if [ $HOSTNAME == "kosovel" ]; then
    export DOCKER_OPTS="--gpus all"
else
    export DOCKER_OPTS=""
fi
export DOCKER_ENV="-e ARES -e HOME -v /home/anze:/home/anze -w $PWD --user $(id -u):$(id -g)"

sbash() { docker run  $DOCKER_ENV $DOCKER_OPTS  -it slosar/seconda /usr/bin/bash $@; }
spython() { docker run  $DOCKER_ENV $DOCKER_OPTS -it slosar/seconda python $@; }
sipython() { docker run $DOCKER_ENV $DOCKER_OPTS -it slosar/seconda ipython $@; }
adstex() { docker run -v /home/anze:/here -e ADS_API_TOKEN -it slosar/seconda adstex /here/"$1";}
snotebook() { port=$1; [ -z "$port" ] && port=9100;  docker run $DOCKER_OPTS  $DOCKER_ENV -w $PWD -itp $port:$port slosar/seconda /bin/bash -c "/opt/conda/bin/jupyter notebook  --ip='*' --port=$port --no-browser --NotebookApp.token='' "; }



