#!/bin/bash
ip=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' greeter-receiver)
curl -H "Content-Type: text/plain" -d "Hello from cURL via "$ip"!" http://$ip:10080
