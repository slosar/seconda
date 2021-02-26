FROM continuumio/anaconda3
MAINTAINER seconda@slosar.com
# Compile this with: docker build -t slosar/seconda .
#then docker push slosar/seconda

RUN conda config --add channels conda-forge; conda config --set channel_priority strict
RUN conda install  astropy scipy healpy
RUN pip install pyccl
## ... TBC ...
