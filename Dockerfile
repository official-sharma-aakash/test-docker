FROM openjdk:8-jre

ARG proxy_host

RUN apt-get update && \
   apt-get install -y dos2unix zip unzip bash

#RUN apt-get install -y libgcrypt20=1.8.4-5+deb10u1 libgnutls30=3.6.7-4+deb10u7 libhogweed4=3.4.1-1+deb10u1 liblz4-1=1.8.3-1+deb10u1 libnettle6=3.4.1-1+deb10u1 libgssapi-krb5-2=1.17-3+deb10u2 libk5crypto3=1.17-3+deb10u2 libkrb5-3=1.17-3+deb10u2 libkrb5support0=1.17-3+deb10u2

RUN apt-get update && \
    apt-get install -y  openssl=1.1.1n-0+deb11u3 libsasl2-2=2.1.27+dfsg-2.1+deb11u1 libsasl2-modules-db=2.1.27+dfsg-2.1+deb11u1 libssl1.1=1.1.1n-0+deb11u3 libc6=2.31-13+deb11u5 libc-bin=2.31-13+deb11u5 libfreetype6=2.10.4+dfsg-1+deb11u1 zlib1g=1:1.2.11.dfsg-2+deb11u2 gzip=1.10-4+deb11u1 libgnutls30=3.7.1-5+deb11u2 liblzma5=5.2.5-2.1~deb11u1  libtirpc3=1.3.1-1+deb11u1 libtirpc-common=1.3.1-1+deb11u1 libpcre2-8-0=10.36-2+deb11u1 dpkg=1.20.12 libksba8=1.5.0-3+deb11u1 libtasn1-6=4.16.0-2+deb11u1 libexpat1=2.2.10-2+deb11u5 libgssapi-krb5-2=1.18.3-6+deb11u3 libk5crypto3=1.18.3-6+deb11u3 libkrb5-3=1.18.3-6+deb11u3 libkrb5support0=1.18.3-6+deb11u3 libssl1.1=1.1.1n-0+deb11u3 curl=7.64.0-4+deb10u4&& \
    #apt-get upgrade -y  libksba8 libtasn1-6 curl  libnss3
    #zlib
    #libcurl


RUN  apt-get autoremove && \
   apt-get remove --purge -y libldap-2.4-2 libldap-common

RUN wget http://mirrors.kernel.org/ubuntu/pool/universe/j/jattach/jattach_1.5-2_amd64.deb && \
   dpkg -i jattach_1.5-2_amd64.deb

RUN addgroup -gid 1000 appgroup && \
   adduser -shell /usr/sbin/nologin -uid 1000 -gecos "" -ingroup appgroup -disabled-password appuser

ENV \
    http_proxy= \
   https_proxy=
