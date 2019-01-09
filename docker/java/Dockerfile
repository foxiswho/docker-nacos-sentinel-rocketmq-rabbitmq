FROM openjdk:11.0.1-jdk-oracle


RUN rm -rf /etc/localtime \
&& ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /java


RUN java -version && \
echo $JAVA_HOME