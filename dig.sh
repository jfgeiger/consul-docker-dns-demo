#!/bin/bash
ip=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' consul-server)
dig @$ip greeter-receiver.service.consul
