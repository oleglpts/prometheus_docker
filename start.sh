#!/bin/bash

service grafana-server start
cd /app/alertmanager-0.21.0.linux-amd64
alertmanager &
cd /app/prometheus-2.23.0.linux-amd64
./prometheus --config.file=prometheus.yml && ../alertmanager-0.21.0.linux-amd64/alertmanager
