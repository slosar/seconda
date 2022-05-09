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
RUN pip install lunarsky>=0.1
RUN pip install pyerfa
RUN pip install git+https://github.com/radiocosmology/caput

#RUN pip install pyuvdata
#RUN pip install --no-deps pyradiosky>=0.1.3

## RUN conda config --add channels conda-forge; conda config --set channel_priority strict
#RUN conda install -c conda-forge pyccl pytorch

# galaxy simulation stuff
#RUN conda install -y -q -c conda-forge galsim numba ngmix esutil lsstdesc.weaklensingdeblending && \
#    git clone https://github.com/LSSTDESC/descwl-shear-sims.git && \
#    cd descwl-shear-sims  && \
#    git checkout 514fdb0ac572504a268a985db8e28efbb7a6b63b  && \
#    cd ..  && \
#    pip install --no-deps descwl-shear-sims/ && \
#    rm -rf descwl-shear-sims  
    





