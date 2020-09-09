FROM centos:latest

MAINTAINER Simon NG <007lock@gmail.com>

RUN yum install -y http://sphinxsearch.com/files/sphinx-2.3.2-1.rhel7.x86_64.rpm

ARG SPHINXSEARCH_CONFIG=sphinx.conf
ENV SPHINXSEARCH_CONFIG ${SPHINXSEARCH_CONFIG}

RUN mkdir -p /var/run/sphinx /var/log/sphinx/

ENTRYPOINT ["searchd", "--nodetach"]