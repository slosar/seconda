# TL;DR:
# Compile this with:  docker build -t slosar/seconda .
# then:               docker push slosar/seconda




FROM slosar/seconda-base
MAINTAINER seconda@slosar.com

RUN  conda install -y -c conda-forge fitsio spiceypy  astropy-healpix mpi4py pyccl
RUN pip install pyshtools
RUN pip install healpy && \
    pip install adstex && \
    pip install corner
RUN pip install git+https://github.com/mirochaj/ares 
RUN pip install git+https://github.com/telegraphic/pygdsm 
RUN pip install lunarsky==0.1.2
RUN pip install pyerfa

COPY hpwin.py .
RUN python hpwin.py
RUN rm hpwin.py

         




