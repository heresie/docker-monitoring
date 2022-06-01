# Monitoring for Docker Hosts

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity) 

This stack uses [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/), [InfluxDb](https://www.influxdata.com/products/influxdb-overview/), [Grafana](https://grafana.com/) and [Traefik](https://traefik.io/traefik/).

## Prerequisites

Before using this project, please ensure you have the following prerequisites :

- A host with `docker` installed, and a priviledged access to this host,
- `docker-compose`
- A `docker-compose` stack running [Traefik](https://traefik.io/traefik/)
  - any usage of versions below `v2.6` may need some adjustements of the `docker-compose.yml`
- An available DNS entry pointing to your host, for exposing Grafana

## Installation

### Define an InfluxDb password

1. Generate a strong password for your InfluxDb instance,
2. Replace all `INFLUXDB_DATABASE_PASSWORD` strings present in this repository by the generated strong password.  
   You may find replacements to do in :
   - `docker-compose.yml` @ line 18
   - `config/telegraf/telegraf.conf` @ line 168
   - `config/grafana/datasource.yml` @ line 11

### Setup the hostname for accessing Grafana through Traefik

1. Replace all `GRAFANA_HOST` strings present in this repository by your DNS entry pointing to your host.  
   You may find replacements to do in :
   - `config/grafana/grafana.ini` @ line 10
   - `docker-compose.yml` @ lines 66, 70

### Setup a password for accessing Grafana securely

1. Generate another strong password for your Grafana instance,
2. Replace all `GRAFANA_PASSWORD` strings present in this repository by the generated strong password.  
   You may find replacements to do in :
   - `config/grafana/grafana.ini` @ line 248

### Setup the correct Docker Network

In our project, we are using a docker network named `dockernet`.  
We have created it with the following command :

```shell
docker network create dockernet
```

Be sure your Traefik instance is connected to that network.

If you want to use another docker network :
1. Replace all `dockernet` strings present in this repository by your docker network name.  
   You may find replacements to do in :
   - `docker-compose.yml` @ lines 9, 30, 53, 77

### Setup Metrics Exporting in your Traefik instance

Add the following lines to your `traefik.yml` :

```yaml
metrics:
  influxDB:
    protocol: "http"
    address: "http://telegraf:INFLUXDB_DATABASE_PASSWORD@influxdb:8086"
    database: "telegraf"
    addEntryPointsLabels: true
    addServicesLabels: true
```

Don't forget to replace `INFLUXDB_DATABASE_PASSWORD` with the same password set in `docker-compose.yaml`

Then you will need to restart the service.

## Running the monitoring stack

### At first run

At the first start of this stack, uncomment `docker-compose.yml` at lines 14 to 19 so the InfluxDb database properly sets up.

```shell
docker-compose up
```

Check the logs and see that InfluxDb is correctly setup, then stop the stack :

```shell
docker-compose down
```

You can now comment the `docker-compose.yaml` file at lines 14 to 19. 

### Running the stack

```shell
docker-compose up -d
```

## FAQ

### How to add a provisionned Grafana dashboard ?

Just add the dashboard JSON file into the `config/grafana/dashboards` then restart the monitoring stack.

### How can I find compatible Grafana dashboards ?

Go to the [Grafana Website](https://grafana.com/grafana/dashboards/) and search dashboards with `InfluxDb` Data Source.

## Troubleshooting

### If no docker metrics are detected

Check the Telegraf logs, maybe it cannot access to the docker.sock file. Adjust access rights accordingly on the docker host.

```yaml
docker-compose logs -f
```

## Inspirations

This monitoring stack was inspired by many projects available on Internet :

 - https://ubuntu.self-hosted.fr/installation-grafana-docker-traefik/3/

## Licensing

This repository is licensed under the Apache License, Version 2.0. See LICENSE for the full license text.

---
EOF