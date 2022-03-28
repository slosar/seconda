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

FROM nvidia/cuda:11.4.2-base-ubuntu20.04
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

# Minimal latex for matplotlib
RUN apt update && apt install -y texlive-latex-base texlive-latex-extra cm-super-minimal dvipng

## RUN conda config --add channels conda-forge; conda config --set channel_priority strict
RUN conda install -c conda-forge pyccl pytorch

## PIP install basic stuff
RUN pip install healpy && \
    pip install adstex && \
    pip install corner

# galaxy simulation stuff
RUN conda install -y -q -c conda-forge galsim numba ngmix esutil lsstdesc.weaklensingdeblending && \
    git clone https://github.com/LSSTDESC/descwl-shear-sims.git && \
    cd descwl-shear-sims  && \
    git checkout 514fdb0ac572504a268a985db8e28efbb7a6b63b  && \
    cd ..  && \
    pip install --no-deps descwl-shear-sims/ && \
    rm -rf descwl-shear-sims  
    
# for LuSEE work + get Ephem cache files
# python -c "from pygdsm import GlobalSkyModel" && << not needed as we now see home
RUN pip install git+https://github.com/mirochaj/ares && \
    pip install git+https://github.com/telegraphic/pygdsm && \
    conda install -y -q -c conda-forge spiceypy pyuvdata>=2.2.2 astropy-healpix

RUN pip install --no-deps pyradiosky>=0.1.3
RUN pip install lunarsky>=0.1
#&& \
#    pip install git+git://github.com/aelanman/analytic_diffuse
# RUN python -c "import astropy.coordinates as ac; \
# from lunarsky.time import Time; \
# from astropy.time import TimeDelta; \
# import astropy.units as u; \
# from lunarsky import LunarTopo; \
# from lunarsky.moon import MoonLocation; \
# import numpy as np; \ 
# loc = MoonLocation.from_selenodetic(lat=22, lon=0.5); \
# ts1 = np.arange(Time('2025-01-01T00:00:00'), Time('2025-02-01T00:00:00'), TimeDelta(1*u.h)).astype(Time); \
# ts2 = np.arange(Time('2025-02-01T00:00:00'), Time('2025-03-01T00:00:00'), TimeDelta(1*u.h)).astype(Time); \
# getsun = lambda ts: [float(ac.get_body('sun',t_).transform_to(LunarTopo(location=loc, obstime=t_)).alt/u.deg) for t_ in ts]; \
# obj = ac.SkyCoord(ra=15*u.deg, dec=20*u.deg, frame='icrs'); \
# getobj = lambda ts: [float(obj.transform_to(LunarTopo(location=loc, obstime=t_)).alt/u.deg) for t_ in ts]; \
# res1 = getsun(ts1) ; \
# transit1 = ts1[np.argmax(res1)] ; \
# res2 = getsun(ts2) ; \
# transit2 = ts2[np.argmax(res2)] ; \
# print(transit2-transit1) "

