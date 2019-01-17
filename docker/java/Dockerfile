FROM openjdk:11.0.1-jdk-oracle

MAINTAINER foxiswho@gmail.com

ARG ip
ARG port

#host
ENV IP ${ip:-localhost}
#ip
ENV PORT ${port:-8080}

# opt home
ENV PROGRAM_HOME  /opt/
ENV PROGRAM_LOGS  /opt/logs

RUN rm -rf /etc/localtime \
&& ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


RUN mkdir -p ${PROGRAM_LOGS}

# add scripts
COPY scripts/* /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
&& ln -s /usr/local/bin/docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod -R +x ${SENTINEL_HOME}/*jar

VOLUME ${SENTINEL_LOGS}

WORKDIR  ${SENTINEL_HOME}

RUN java -version

EXPOSE ${PORT}

ENTRYPOINT ["docker-entrypoint.sh"]

CMD java ${JAVA_OPTS} -jar *.jar