if [ $HOSTNAME == "kosovel" ]; then
    export DOCKER_OPTS=""
    #--gpus all" broken for the time being
else
    export DOCKER_OPTS=""
fi
export DOCKER_ENV="-e ARES -e HOME -e PYTHONPATH -e LD_LIBRARY_PATH -e LUSEE_DRIVE_DIR -v /home/anze:/home/anze -v /tmp/.X11-unix:/tmp/.X11-unix --user $(id -u):$(id -g)"
#-v /home/anze/work/lusee/lunarsky_data:/opt/conda/lib/python3.8/site-packages/lunarsky/data 

sbash() { docker run  $DOCKER_ENV $DOCKER_OPTS -w $PWD  -it slosar/seconda /usr/bin/bash $@; }
spython() { docker run  $DOCKER_ENV $DOCKER_OPTS -w $PWD -e DISPLAY=$DISPLAY  -it slosar/seconda python $@; }
sipython() { docker run $DOCKER_ENV $DOCKER_OPTS -w $PWD -e DISPLAY=$DISPLAY -it slosar/seconda ipython $@; }
spip() { docker run $DOCKER_ENV $DOCKER_OPTS -w $PWD -it slosar/seconda pip $@; }
adstex() { docker run -v $PWD:/here -e ADS_API_TOKEN -it slosar/seconda adstex /here/"$1";}
snotebook() { port=$1; [ -z "$port" ] && port=9100;  docker run $DOCKER_OPTS  $DOCKER_ENV -w $PWD -itp $port:$port slosar/seconda /bin/bash -c "/opt/conda/bin/jupyter lab  --ip='*' --port=$port --no-browser --NotebookApp.token='' "; }



