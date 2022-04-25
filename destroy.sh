#!/bin/bash
docker stop consul-server consul-client greeter-receiver
docker rm consul-server consul-client greeter-receiver
