sbash() { docker run --user $(id -u):$(id -g) --gpus all -v /home/anze:/home/anze -w /home/anze -it slosar/seconda /usr/bin/bash $@; }
spython() { docker run --user $(id -u):$(id -g) -e ARES --gpus all -v /home/anze:/home/anze -w /home/anze -it slosar/seconda python $@; }
sipython() { docker run --user $(id -u):$(id -g) =e ARES --gpus all -v /home/anze:/home/anze -w /home/anze -it slosar/seconda ipython $@; }
adstex() { docker run --gpus all -v /home/anze:/here -e ADS_API_TOKEN -it slosar/seconda adstex /here/"$1";}
snotebook() { port=$1; [ -z "$port" ] && port=9100;  docker run -e ARES --gpus all -v /home/anze:/home/anze -w /home/anze -itp $port:$port slosar/seconda /bin/bash -c "/opt/conda/bin/jupyter notebook  --ip='*' --port=$port --no-browser --NotebookApp.token="" --allow-root"; }

