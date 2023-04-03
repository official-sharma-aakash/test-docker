FROM openjdk:8-jre

RUN apt-get remove -y curl

ENV \
    http_proxy= \
   https_proxy=
