FROM ubuntu:20.04

ARG OPENLDAP_VSN=2.5.16

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y
RUN apt-get install -y groff groff-base curl build-essential
RUN curl -o openldap-${OPENLDAP_VSN}.tgz https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-${OPENLDAP_VSN}.tgz \
    && tar xvzf openldap-${OPENLDAP_VSN}.tgz \
    && cd openldap-${OPENLDAP_VSN} \
    && ./configure && make depend && make && make install \
    && cd .. && rm -rf  openldap-${OPENLDAP_VSN}
