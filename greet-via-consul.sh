#!/bin/bash
url=greeter-receiver.service.consul
curl -H "Content-Type: text/plain" -d "Hello from cURL via "$url"!" http://$url:10080
