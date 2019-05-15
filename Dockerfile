
FROM openjdk:8-jdk-alpine
VOLUME /tmp


EXPOSE 9005
ENV SPRING_PROFILES_ACTIVE dev

ENV SPRING_BOOT_USER spring-boot
ENV SPRING_BOOT_GROUP spring-boot

COPY docker-entrypoint.sh docker-entrypoint.sh

RUN addgroup -S $SPRING_BOOT_USER && adduser -S -g $SPRING_BOOT_GROUP $SPRING_BOOT_USER && \
chmod 555 docker-entrypoint.sh && sh -c 'touch /app.jar'

COPY build/libs/subscriver-service*.jar /app.jar
COPY src/main/resources/logback-spring.xml /src/main/resources/logback-spring.xml
COPY src/main/resources/keystore.jks keystore.jks

ENTRYPOINT ["./docker-entrypoint.sh"]