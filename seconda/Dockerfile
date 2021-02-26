FROM nvidia/cuda:11.2.1-base
MAINTAINER seconda@slosar.com

### CUDA stuff from:
# FROM nvidia/cuda
# CMD nvidia-smi
## See https://hub.docker.com/r/nvidia/cuda
# https://gitlab.com/nvidia/container-images/cuda/blob/master/dist/11.2.1/ubuntu20.04-x86_64/runtime/Dockerfile

#ENV NCCL_VERSION 2.8.4
#
#RUN apt-get update && apt-get install -y --no-install-recommends \
#    cuda-libraries-11-2=11.2.1-1 \
#    libnpp-11-2=11.3.2.139-1 \
#    cuda-nvtx-11-2=11.2.67-1 \
#    libcublas-11-2=11.4.1.1026-1 \
#    libcusparse-11-2=11.4.0.135-1 \
#    libnccl2=$NCCL_VERSION-1+cuda11.2 \
#    && rm -rf /var/lib/apt/lists/*#
#
# apt from auto upgrading the cublas package. See https://gitlab.com/nvidia/container-images/cuda/-/issues/88
#RUN apt-mark hold libcublas-11-2 libnccl2

###  Anaconda stuff starts here
# FROM continuumio/anaconda3
# see https://github.com/ContinuumIO/docker-images/blob/master/anaconda3/debian/Dockerfile

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

ENV TZ=Europe/Ljubljana
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion && \
    apt-get clean

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy

CMD [ "/bin/bash" ]


### My Stuff starts here

# Compile this with: docker build -t slosar/seconda .
# then docker push slosar/seconda

## RUN conda config --add channels conda-forge; conda config --set channel_priority strict
RUN conda install -c conda-forge pyccl pytorch
RUN pip install healpy
## ... TBC ...
