spython() { docker run --gpus all -v "$PWD":"$PWD" -w "$PWD" -it slosar/seconda python $@; }
sipython() { docker run --gpus all -v "$PWD":"$PWD" -w "$PWD" -it slosar/seconda ipython $@; }
adstex() { docker run --gpus all -v "$PWD":/here -e ADS_API_TOKEN -it slosar/seconda adstex /here/"$1";}
snotebook() { port=$1; [ -z "$port" ] && port=9100;  docker run --gpus all -v "$PWD":"$PWD" -w "$PWD" -itp $port:$port slosar/seconda /bin/bash -c "/opt/conda/bin/jupyter notebook  --ip='*' --port=$port --no-browser --NotebookApp.token="" --allow-root"; }



