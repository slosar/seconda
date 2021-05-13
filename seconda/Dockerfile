# TL;DR:
# Compile this with:  docker build -t slosar/seconda .
# then:               docker push slosar/seconda


# ---------------------------------------------------------

# We build from cuda, to get GPU acceleration through when needed
# CUDA stuff from:
#    https://hub.docker.com/r/nvidia/cuda
#    https://gitlab.com/nvidia/container-images/cuda/blob/master/dist/11.2.1/ubuntu20.04-x86_64/runtime/Dockerfile
# run nvidia-smi to see if it works
#

FROM nvidia/cuda:11.3.0-base
MAINTAINER seconda@slosar.com

# ---------------------------------------------------------
# Anaconda stuff 
# Dockerfile stuff from continuumio/anaconda3
#   -- see https://github.com/ContinuumIO/docker-images/blob/master/anaconda3/debian/Dockerfile, Nov 30 commit
#   -- added TZ fix below

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

# ---------------------------------------------------------
### My config starts here

## RUN conda config --add channels conda-forge; conda config --set channel_priority strict
RUN conda install -c conda-forge pyccl pytorch
RUN pip install healpy
RUN pip install adstex

# Minimal latex for matplotlib
RUN apt-get install -y texlive-latex-base texlive-latex-extra cm-super-minimal dvipng

# galaxy simulation stuff
RUN conda install -y -q -c conda-forge galsim numba ngmix esutil lsstdesc.weaklensingdeblending && \
    git clone https://github.com/LSSTDESC/descwl-shear-sims.git && \
    pip install --no-deps descwl-shear-sims/ && \
    rm -rf descwl-shear-sims
    
# for LuSEE work + get Ephem cache files
# python -c "from pygdsm import GlobalSkyModel" && << not needed as we now see home
RUN pip install git+https://github.com/mirochaj/ares && \
    pip install git+https://github.com/telegraphic/pygdsm && \
    conda install -y -q -c conda-forge spiceypy 
