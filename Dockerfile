FROM openjdk:8-jre-slim
EXPOSE 8080
ENV ACTIVE_PROFILE=production
ENV VERSION=1.7.2

WORKDIR /data
RUN mkdir -p /home/netfra/service && \
    cd /home/netfra/service && \
    ln -s /data/upload .
COPY docker/entrypoint.sh /srv/entrypoint.sh
COPY build/libs/streama-$VERSION.jar /srv/streama.jar

ENTRYPOINT ["sh", "/srv/entrypoint.sh"]
