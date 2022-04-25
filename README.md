# Prerequisite

* A docker registry runs under `localhost:5000`.

# Build

```
(cd receiver \
    && mvn clean install \
    && docker build . -t localhost:5000/greeter-receiver \
    && docker push -t localhost:5000/greeter-receiver)
```

# Run

```
bash setup.sh
```

# Demo

```
bash greet-via-ip.sh
```

The logs of `greeter-receiver` show the request as the pod has been identified by IP (`docker logs greeter-receiver`).

```
bash greet-via-consul.sh
```

cURL can't resolve the host `greeter-receiver.service.consul`.

Set the IP address of the consul pod as DNS, e.g. on Ubuntu by editing `/etc/resolv.conf`. The IP of the consul pod is logged when running `setup.sh`.

```
bash greet-via-consul.sh
```

Now the logs of `greeter-receiver` show the request as consul was resolving the name `greeter-receiver.service.consul` against the pod IP.

# Cleanup

```
bash destroy.sh
```
