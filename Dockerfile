FROM ubuntu:18.04

WORKDIR /app
RUN apt-get update && apt-get install -y mc adduser libfontconfig1 wget systemd
RUN wget https://github.com/prometheus/prometheus/releases/download/v2.23.0/prometheus-2.23.0.linux-amd64.tar.gz
RUN tar -xzvf prometheus-2.23.0.linux-amd64.tar.gz && rm -rf prometheus-2.23.0.linux-amd64.tar.gz
RUN cd prometheus-2.23.0.linux-amd64
COPY ./start.sh /app
COPY ./prometheus.yml /app/prometheus-2.23.0.linux-amd64/prometheus.yml
RUN wget https://dl.grafana.com/oss/release/grafana_7.3.4_amd64.deb && dpkg -i grafana_7.3.4_amd64.deb
RUN rm -rf grafana_7.3.4_amd64.deb
RUN wget https://github.com/prometheus/alertmanager/releases/download/v0.21.0/alertmanager-0.21.0.linux-amd64.tar.gz
RUN tar -xzvf alertmanager-0.21.0.linux-amd64.tar.gz && rm -rf alertmanager-0.21.0.linux-amd64.tar.gz
EXPOSE 3000 9090
CMD ["/app/start.sh"]
