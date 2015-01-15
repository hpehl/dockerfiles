#!/bin/sh
/opt/grafana/config.py /opt/grafana/config.js.mustache > /opt/grafana/config.js
/usr/bin/supervisord -c /etc/supervisord.conf
