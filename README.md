# Docker/Spring – Sample set-up

## Table of Contents
- Running
- Contribution

## Running
1. Make a copy of the `.env.sample` file as `.env`
2. Run the following commands in the root dir:
```shell
$ ./mvnw package
$ docker build -t springio/gs-spring-boot-docker .
$ docker-compose up -d
```

## Contribution
- [Contribution](https://docs.cream.camp/getting-started/contribution) – remind yourself about working with Github