#!/bin/bash
# Filebeat installer for CentOS
# Daniel Korel | 2015

SOURCE="IP"
PORT="22"

# Add the repo
rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch

# Repo config
echo "[beats]
name=Elastic Beats Repository
baseurl=https://packages.elastic.co/beats/yum/el/$basearch
enabled=1
gpgkey=https://packages.elastic.co/GPG-KEY-elasticsearch
gpgcheck=1" > /etc/yum.repos.d/elastic-beats.repo

# Install it
yum -y install filebeat

# Copy the certificate matching the logstash server
mkdir -p /etc/pki/tls/certs

scp -P$PORT root@$SOURCE:/etc/pki/tls/certs/logstash-forwarder.crt /etc/pki/tls/certs/logstash-forwarder.crt
