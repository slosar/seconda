# TL;DR:
# Compile this with:  docker build -t slosar/seconda-ccl-dev .
# then:               docker push slosar/seconda-ccl-dev



FROM slosar/seconda-base
LABEL MAINTAINER seconda@slosar.com
RUN apt update
RUN apt install -y cmake autotools-dev automake libgsl-dev swig libboost-dev
RUN groupadd -g 1000 -o anze
RUN useradd -m -u 1000 -g anze -o -s /bin/bash anze
USER anze
WORKDIR /home/anze/CCL
#RUN git clone https://github.com/LSSTDESC/CCL.git
#RUN cd CCL; pip install --no-deps -e .