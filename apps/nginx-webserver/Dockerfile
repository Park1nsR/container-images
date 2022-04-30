# hadolint ignore=DL3007
FROM ghcr.io/k8s-at-home/ubuntu:latest

ARG VERSION

USER root

RUN apt update \
    && apt-get install -y nginx php-fpm php-cli php-curl php-mysql php-gd php-mbstring php-pear \
    && apt-get -y clean all

COPY ./config/nginx/ /etc/nginx/
COPY ./entrypoint.sh /entrypoint.sh

EXPOSE 80 443

WORKDIR /app

CMD ["/entrypoint.sh"]
