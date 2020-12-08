FROM ubuntu:18.04

WORKDIR /app
COPY ./start.sh /app
RUN apt-get update && apt-get install -y mc wget
RUN wget https://github.com/prometheus/alertmanager/releases/download/v0.21.0/alertmanager-0.21.0.linux-amd64.tar.gz
RUN tar -xzvf alertmanager-0.21.0.linux-amd64.tar.gz && rm -rf alertmanager-0.21.0.linux-amd64.tar.gz
EXPOSE 9093
CMD ["/app/start.sh"]
