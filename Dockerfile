FROM ubuntu:16.04
ENV DEBIAN_FRONTEND=noninteractive

## install apps
RUN \
  apt-get update && \
  apt-get install -y sudo vim iputils-ping wget apt-transport-https software-properties-common python-software-properties git supervisor

## install nodejs and npm
RUN \
  apt-get update && \
  apt-get install -y \
    nodejs \
    npm

## Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

## Copy sample nodeapp to serve
COPY myapp /tmp/myapp
WORKDIR /tmp/myapp

## Use supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]

