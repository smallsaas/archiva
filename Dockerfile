FROM ubuntu:latest
LABEL maintainer="craftperson/kequandian.net"

ENV LANG=C.UTF-8 \
    TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /webapps
WORKDIR   /webapps

RUN apt-get update && apt-get install -y procps
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

COPY ./apache-archiva /usr/tmp/apache-archiva
COPY ./script/run.sh /usr/local/bin/run.sh
EXPOSE 8080
CMD sh /usr/local/bin/run.sh
