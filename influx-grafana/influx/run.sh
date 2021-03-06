#!/bin/bash

set -m
CONFIG_FILE="/opt/influxdb/shared/config.toml"
API_URL="http://localhost:8086"

if [ "${PRE_CREATE_DB}" == "**None**" ]; then
    PRE_CREATE_DB="grafana"
else
    PRE_CREATE_DB="grafana;${PRE_CREATE_DB}"
fi

# Dynamically change the value of 'max-open-shards' to what 'ulimit -n' returns
sed -i "s/^max-open-shards.*/max-open-shards = $(ulimit -n)/" ${CONFIG_FILE}

# Check whether we need to create the initial database
echo "=> About to create the following database: ${DB_NAME}"
if [ -f "/data/.pre_db_created" ]; then
    echo "=> Database had been created before, skipping ..."
else
    echo "=> Starting InfluxDB ..."
    exec /usr/bin/influxdb -config=${CONFIG_FILE} &
    USER=${INFLUXDB_INIT_USER:-root}
    PASS=${INFLUXDB_INIT_PWD:-root}

    #wait for the startup of influxdb
    RET=1
    while [[ RET -ne 0 ]]; do
        echo "=> Waiting for confirmation of InfluxDB service startup ..."
        sleep 3
        curl -k ${API_URL}/ping 2> /dev/null
        RET=$?
    done
    echo ""

    arr=$(echo ${PRE_CREATE_DB} | tr ";" "\n")
    for x in $arr
    do
        echo "=> Creating database: ${x}"
        curl -s -k -X POST -d "{\"name\":\"${x}\"}" $(echo ${API_URL}'/db?u='${USER}'&p='${PASS})
    done
    echo ""

    touch "/data/.pre_db_created"
    fg
    exit 0
fi
echo "=> Starting InfluxDB ..."

exec /usr/bin/influxdb -config=${CONFIG_FILE}