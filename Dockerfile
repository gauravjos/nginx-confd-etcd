FROM ubuntu:14.04

MAINTAINER gauravjoshi@outlook.com

RUN apt-get update -qq && apt-get install -y nginx

RUN rm /etc/nginx/sites-available/default

EXPOSE 80

ADD https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 /usr/local/bin/confd

RUN chmod +x /usr/local/bin/confd

RUN mkdir -p /etc/confd/{templates,conf.d}

ADD files/nginx.conf.tmpl  /etc/confd/templates/nginx.conf.tmpl

ADD files/nginx.toml /etc/confd/conf.d/nginx.toml

ADD start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]
