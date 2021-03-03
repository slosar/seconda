#!/bin/bash
docker run -v "$PWD":/here -w /opt -it slosar/seconda tar jcvf /here/conda.tbz2 conda
