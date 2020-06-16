FROM ubuntu:latest

MAINTAINER jemimalwh@gmail.com

ARG RSEM_VERSION=1.33

ENV PACKAGES apt-utils wget build-essential gcc-multilib perl expat libexpat-dev zlib1g-dev cpanminus python

RUN set -ex

RUN apt-get update && \
    apt-get install -y --no-install-recommends ${PACKAGES} && \
    apt-get clean && \
    cd /home && \
    wget --no-check-certificate https://github.com/deweylab/RSEM/archive/v1.3.3.tar.gz && \
    tar -zxvf v1.3.3.tar.gz && cd RSEM-1.3.3 && make && make install && \
    mkdir /work && cd /work && \
    apt-get --purge autoremove -y ${PACKAGES}

WORKDIR /work

ENV PATH /home/RSEM-1.3.3:${PATH}





