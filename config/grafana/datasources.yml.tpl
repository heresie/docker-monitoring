apiVersion: 1

datasources:
  - name: InfluxDB_v2
    type: influxdb
    access: proxy
    url: http://influxdb:8086
    jsonData:
      version: Flux
      organization: telegraf
      tlsSkipVerify: true
    secureJsonData:
      token: [INFLUXDB_ADMIN_TOKEN]

  - name: Loki
    type: loki
    access: proxy
    url: http://loki:3100
    version: 1

