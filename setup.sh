#!/usr/bin/env bash

source .env || echo "Could not load .env"

if [[ "${DOCKER_GID}" == "" ]]; then
    echo "Detected empty DOCKER_GID: trying autodetect ..."
    DOCKER_GID_RAW=$(getent group docker 2> /dev/null || echo "")
    DOCKER_GID=$(echo "${DOCKER_GID_RAW}" | cut -d: -f3)
    
    if [[ "${DOCKER_GID}" == "" ]]; then
        echo "Could not determine docker group_id. Please check your /etc/group file and fill DOCKER_GID in .env file"
    else
        echo "Updating .env ..."
        cat .env | sed -e "s/DOCKER_GID=/DOCKER_GID=${DOCKER_GID}/g" 
        source .env
    fi
fi

echo "Updating config/telegraf/telegraf.conf ..."
cp config/telegraf/telegraf.conf.tpl config/telegraf/telegraf.conf
sed -i -e "s/\[HOSTNAME\]/${HOSTNAME}/g"                           config/telegraf/telegraf.conf
sed -i -e "s/\[INFLUXDB_ADMIN_TOKEN\]/${INFLUXDB_ADMIN_TOKEN}/g"   config/telegraf/telegraf.conf
sed -i -e "s/\[INFLUXDB_ORGANIZATION\]/${INFLUXDB_ORGANIZATION}/g" config/telegraf/telegraf.conf
sed -i -e "s/\[INFLUXDB_BUCKET\]/${INFLUXDB_BUCKET}/g"             config/telegraf/telegraf.conf

echo "Updating config/grafana/grafana.ini ..."
cp config/grafana/grafana.ini.tpl config/grafana/grafana.ini
sed -i -e "s/\[HOSTNAME\]/${HOSTNAME}/g"                           config/grafana/grafana.ini
sed -i -e "s/\[GRAFANA_USERNAME\]/${GRAFANA_USERNAME}/g"           config/grafana/grafana.ini
sed -i -e "s/\[GRAFANA_PASSWORD\]/${GRAFANA_PASSWORD}/g"           config/grafana/grafana.ini
sed -i -e "s/\[GRAFANA_EMAIL\]/${GRAFANA_EMAIL}/g"                 config/grafana/grafana.ini

echo "Updating config/grafana/datasources.yml ..."
cp config/grafana/datasources.yml.tpl config/grafana/datasources.yml
sed -i -e "s/\[INFLUXDB_ADMIN_TOKEN\]/${INFLUXDB_ADMIN_TOKEN}/g"   config/grafana/datasources.yml
