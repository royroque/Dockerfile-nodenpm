FROM ubuntu:16.04
ENV DEBIAN_FRONTEND=noninteractive

## install apps
RUN \
  apt-get update && \
  apt-get install -y vim wget git apt-transport-https software-properties-common python-software-properties git supervisor

## install nodejs and npm
RUN \
  apt-get update && \
  apt-get install -y \
    nodejs \
    npm

RUN apt-get clean

## Copy sample nodeapp to serve
COPY myapp /tmp/myapp
WORKDIR /tmp/myapp

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]

