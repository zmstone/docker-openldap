FROM ubuntu:20.04

ARG LDAP_TAG=2.5.16

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y
RUN apt-get install -y groff groff-base curl build-essential
RUN curl -o openldap-${LDAP_TAG}.tgz https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-${LDAP_TAG}.tgz \
    && tar xvzf openldap-${LDAP_TAG}.tgz \
    && cd openldap-${LDAP_TAG} \
    && ./configure && make depend && make && make install \
    && cd .. && rm -rf  openldap-${LDAP_TAG}
