# vmstat_logger

## What is it?
vmstat logger is regular vmstat piped through a couple of line buffered grep filters (to remove unecessary information) and daemonized. It outputs system stats to /var/log/vmstat every 10 seconds by default.

This is part of a larger project to relay this information into an ELK stack using filebeat and logstash grok filters for further analysis.

## Install it
```cd /etc/init.d; curl -O https://raw.githubusercontent.com/dhdanno/vmstat_logging/master/vmstat_logger; chmod +x vmstat_logger; chkconfig vmstat_logger on```

### Autostart
- Debian: ```/etc/update-rc.d vmstat_logger defaults```
- CentOS: ```chkconfig vmstat_logger on```

## What about log rotation?
At one line every 10 seconds it would take approx a year for it to grow to < 100mb... asuming the service never crashes or the system never restarts. Should be safe enough to leave out.

## More Information:
More detailed blog post with an explanation of how everything ties together:
 - http://korel.com.au/monitor-your-systems-with-elk-and-vmstat-logger/

## Dashboard
You should be able to import dashboard.json into Kibana. It should contain all visualizations and the dashboard.
