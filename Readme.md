# http2(H2O) playground

> Provides a Docker environment for verification of HTTP2 of protocol

Relationship of the docker container and proxy.

```
        ---->      ---->
browser        H2O        Nginx
        <----      <----
```

## Setup

Using the ```Docker```.
If there is a ```docker-compose``` is convenient.

```sh
docker compose up
```

path | content
--- | ---
/:8000 | HTTP1.1
/:8443 | HTTP2.0
/:8443/server_push | HTTP2.0 + server-push
/:8443/proxy | HTTP2.0 + transfer to nginx server-push
/:3443 | HTTP2.0 + casper directive
/:3443/server_push | HTTP2.0 + server-push + casper directive
/:3443/proxy | HTTP2.0 + transfer to nginx server-push + casper directive
