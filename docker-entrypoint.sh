#!/usr/bin/env bash

if [ -z "$RABBIT_HOST" ]; then
    echo 'Default rabbit host used'
else
    JAVA_OPTS="$JAVA_OPTS -Dspring.rabbitmq.host=$RABBIT_HOST"
fi

if [ -z "$RABBIT_HOST_PORT" ]; then
    echo 'Default rabbit host port used'
else
    JAVA_OPTS="$JAVA_OPTS -Dspring.rabbitmq.port=$RABBIT_HOST_PORT"
fi

if [ -z "$RABBIT_USERNAME" ]; then
    echo 'Default rabbit username used'
else
    JAVA_OPTS="$JAVA_OPTS -Dspring.rabbitmq.username=$RABBIT_USERNAME"
fi

if [ -z "$RABBIT_PASS" ]; then
    echo 'Default rabbit password used'
else
    JAVA_OPTS="$JAVA_OPTS -Dspring.rabbitmq.password=$RABBIT_PASS"
fi


if [ -z "$APPLICATION_DATABASE_URL" ]; then
    echo 'Default database URL used'
else
    JAVA_OPTS="$JAVA_OPTS -Dspring.datasource.url=$APPLICATION_DATABASE_URL"
fi

if [ -z "$APPLICATION_DATABASE_USERNAME" ]; then
    echo 'Default database username used'
else
    JAVA_OPTS="$JAVA_OPTS -Dspring.datasource.username=$APPLICATION_DATABASE_USERNAME"
fi

if [ -z "$APPLICATION_DATABASE_PASSWORD" ]; then
    echo 'Default database password used'
else
    JAVA_OPTS="$JAVA_OPTS -Dspring.datasource.password=$APPLICATION_DATABASE_PASSWORD"
fi

exec java ${JAVA_OPTS} \
-Djavax.net.ssl.trustStorePassword=changeit \
-Djavax.net.ssl.trustStore=keystore.jks \
-Djava.security.egd=file:/dev/./urandom \
-jar \
/app.jar