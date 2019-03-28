# httpbin: HTTP Request & Response Service

Originally a [Kenneth Reitz](http://kennethreitz.org/) Project.
See [httpbin.org](http://httpbin.org) for more information.


## Quick Start

### with Docker

```shell
$ docker pull kapb14/httpbin
$ docker run -d -p 80:80 kapb14/httpbin
```

### with Docker Compose

```shell
$ git clone git@github.com:kapb14/httpbin.git && cd httpbin
$ cp docker-compose.override.yml.dist docker-compose.override.yml
$ $EDITOR docker-compose.override.yml
$ docker-compose up -d
```

___

## Officially Deployed at:

- http://httpbin.org
- https://httpbin.org
- http://eu.httpbin.org
- https://eu.httpbin.org
- https://hub.docker.com/r/kennethreitz/httpbin/


## SEE ALSO

- http://httpbin.org
- https://www.hurl.it
- http://requestb.in
- http://python-requests.org

