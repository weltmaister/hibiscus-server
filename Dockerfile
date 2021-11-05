FROM openjdk:11-jdk-alpine

RUN set -ex; \
    \
    apk add --no-cache \
          mysql-client \
          wget \
          unzip

RUN wget https://www.willuhn.de/products/hibiscus-server/releases/hibiscus-server-2.10.0.zip
RUN unzip hibiscus-server-2.10.0.zip
RUN rm hibiscus-server-2.10.0.zip


COPY ./docker-entrypoint.sh /
COPY ./create-tables.sh /
COPY ./policy /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8080
