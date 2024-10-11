# Monitoring for Docker Hosts

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity) 

This stack uses [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/), [InfluxDb](https://www.influxdata.com/products/influxdb-overview/), [Grafana](https://grafana.com/), [Loki](https://grafana.com/docs/loki/latest/), [Promtail](https://grafana.com/docs/loki/latest/) and [Traefik](https://traefik.io/traefik/).

## Prerequisites

Before using this project, please ensure you have the following prerequisites :

- A host with `docker` installed, and a priviledged access to this host,
- `docker-compose`
- A `docker-compose` stack running [Traefik](https://traefik.io/traefik/)
  - any usage of versions below `v2.6` may need some adjustements of the `docker-compose.yml`
- An available DNS entry pointing to your host, for exposing Grafana

## Quick Start

### Edit Configuration

```
$ cp .env.example .env
```

Edit the `.env` file with your values.

Run the setup script :

```
$ ./setup.sh
```

Run the monitoring stack

```
$ docker-compose up -d
```

### Traefik Annotations

Adjust the `docker-compose.yml` annotations for Traefik to match your mesh configuration.

### Setup the correct Docker Network

In our project, we are using a docker network named `dockernet`.  
We have created it with the following command :

```shell
docker network create dockernet
```

Be sure your Traefik instance is connected to that network.

If you want to use another docker network :
1. Replace all `dockernet` strings present in this repository by your docker network name.  

## Running the monitoring stack

### Running the stack

```shell
docker-compose up -d
```

## FAQ

### How to add a provisionned Grafana dashboard ?

Just add the dashboard JSON file into the `config/grafana/dashboards` then restart the monitoring stack.

### How can I find compatible Grafana dashboards ?

Go to the [Grafana Website](https://grafana.com/grafana/dashboards/) and search dashboards with `InfluxDb2` Data Source.

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
