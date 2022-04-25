#!/bin/bash

# Server
docker run \
    -d \
    --expose 53/udp \
    -p 8500:8500 \
    --name=consul-server \
    consul agent -dns-port=53 -server -ui -node=server-1 -bootstrap-expect=1 -client=0.0.0.0

# Client
server_ip=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' consul-server)
docker run \
   -d \
   --name=consul-client \
   consul agent -node=client-1 -join=$server_ip

# Greeter receiver
docker run \
   -d \
   --expose 10080 \
   --name=greeter-receiver \
   localhost:5000/greeter-receiver
greeter_receiver_ip=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' greeter-receiver)
docker exec consul-client /bin/sh -c "echo '{\"service\": {\"name\": \"greeter-receiver\", \"address\": \""$greeter_receiver_ip"\", \"port\": 10080}}' >> /consul/config/greeter-receiver.json"
docker exec consul-client consul reload

echo "Set nameserver "$server_ip" as DNS server"
