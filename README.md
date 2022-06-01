# Docker Monitoring with Telegraf/InfluxDb/Grafana

## Prerequisite

- Access to a host with docker and privileged rights
- Have installed Traefik

## Setup

1. Define a password for Telegraf

- edit `docker-compose.yaml` at line 18 and replace `DEFINE_A_SUPER_STRONG_PASSWORD_FOR_TELEGRAF_HERE` with a randomly generated password
- edit `config/telegraf/telegraf.conf` at line 168 and replace `DEFINE_A_SUPER_STRONG_PASSWORD_FOR_TELEGRAF_HERE` with the same password you set in `docker-compose.yaml`
- edit `config/grafana/datasource.yml` at line 11 and replace `DEFINE_A_SUPER_STRONG_PASSWORD_FOR_TELEGRAF_HERE` with the same password you set in `docker-compose.yaml`

2. Define a hostname for accessing Grafana through Traefik

- edit `config/grafana/grafana.ini` at line 10 and replace `DEFINE_A_HOST` with a DNS entry pointing to your host

3. Define a password for accessing Grafana

- edit `config/grafana/grafana.ini` at line 248 and replace `SET_A_PASSWORD` with a strong password for accessing Grafana dashboards. The user will be `monitoring-admin`.

4. Create the Docker Network

If you don't have any pre-existing docker network :
 - Run `docker network create dockernet`

Otherwise:
 - Change `docker-compose.yaml` and replace `dockernet` with the name of your docker network

5. Configure your Traefik instance for sending metrics to Telegraf :

- add the following lines to your `traefik.toml` configuration file :

```
metrics:
  influxDB:
    protocol: "http"
    address: "http://telegraf:DEFINE_A_SUPER_STRONG_PASSWORD_FOR_TELEGRAF_HERE@influxdb:8086"
    database: "telegraf"
    addEntryPointsLabels: true
    addServicesLabels: true
```

Replace `DEFINE_A_SUPER_STRONG_PASSWORD_FOR_TELEGRAF_HERE` with the same password set in `docker-compose.yaml`

- restart the service

## Starting

At the first start of this stack, uncomment `docker-compose.yaml` at lines 14 to 19 so the InfluxDb databases properly sets up.

`docker-compose up`

Check the logs and see that InfluxDb is correctly setup, the stop the stack :

`docker-compose down`

And comment `docker-compose.yaml` at lines 14 to 19. Now you can start the stack again.

`docker-compose up -d`

## Inspiration

 - https://ubuntu.self-hosted.fr/installation-grafana-docker-traefik/3/
