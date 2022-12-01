# TL;DR:
# Compile this with:  docker build -t slosar/seconda .
# then:               docker push slosar/seconda




FROM slosar/seconda-base
MAINTAINER seconda@slosar.com
RUN conda install gcc_linux-64 gxx_linux-64
RUN conda install -y -c conda-forge mpi4py
RUN conda install -y -c conda-forge fitsio
RUN conda install -y -c conda-forge datrie
# pyccl stuff
RUN conda install cmake
RUN apt-get install -y autotools-dev automake yacc libpcre3 libpcre3-dev swig4.0
RUN ln -s /usr/lib/x86_64-linux-gnu/libpcre.so /usr/lib/x86_64-linux-gnu/libpcre.so.1
RUN pip install pyccl
RUN pip install pyshtools
RUN pip install healpy && \
    pip install adstex && \
    pip install corner
RUN pip install git+https://github.com/mirochaj/ares 
RUN pip install git+https://github.com/telegraphic/pygdsm 
RUN pip install lunarsky==0.1.2
RUN pip install pyerfa
RUN pip install showyourwork
RUN cd /opt/conda/lib && rm libstdc++.so.6.0.29 && cp /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.30 . && ln -sf libstdc++.so.6.0.30 libstdc++.so.6 && ln -sf libstdc++.so.6.0.30 libstdc++.so


#COPY hpwin.py .
#RUN python hpwin.py
#RUN rm hpwin.py

         




