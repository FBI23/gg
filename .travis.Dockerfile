FROM ubuntu:18.04

MAINTAINER sadjad "https://github.com/sadjad"

RUN apt-get update -qq
RUN apt-get install -y -q gcc-7 g++-7 libcap-dev libncurses5-dev \
                          libboost-dev libssl-dev autopoint help2man texinfo \
                          python3 python3-pip libhiredis-dev protobuf-compiler \
                          git libprotobuf-dev libcrypto++-dev texinfo automake \
                          libtool pkg-config python-minimal

RUN pip3 install python_magic
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 99
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 99

RUN useradd --create-home --shell /bin/bash user
COPY . /home/user/gg/
RUN chown user -R /home/user/gg/

ENV LANG C.UTF-8
ENV LANGUAGE C:en
ENV LC_ALL C.UTF-8

USER user
