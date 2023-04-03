FROM openjdk:8-jre

RUN apt-get upgrade -y curl libtasn1-6 libksba8 zlib1g libpcre2-8-0

ENV \
    http_proxy= \
   https_proxy=
