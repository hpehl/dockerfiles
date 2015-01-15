#!/usr/bin/env python

import pystache
import os
import sys

if os.environ['PRE_CREATE_DB'] != '**None**':
    data = {'datasources': os.environ['PRE_CREATE_DB'].split(';'), 'influxUser': os.environ['INFLUXDB_INIT_USER'], 'influxPassword': os.environ['INFLUXDB_INIT_PWD']}
    renderer = pystache.Renderer()
    print renderer.render_path(sys.argv[1], data)
