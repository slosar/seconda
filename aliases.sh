spython() { docker run -v "$PWD":"$PWD" -w "$PWD" -it slosar/seconda python $1; }
sipython() { docker run -v "$PWD":"$PWD" -w "$PWD" -it slosar/seconda ipython $1; }
adstex() { docker run -v "$PWD":/here -e ADS_API_TOKEN -it slosar/seconda adstex /here/"$1";}
alias snotebook='docker run --gpus all -v `pwd`:/here -itp 9100:9100 slosar/seconda /bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/here --ip='*' --port=9100 --no-browser --NotebookApp.token="" --allow-root"'
alias snotebook1='docker run --gpus all -v `pwd`:/here -itp 9100:9100 slosar/seconda /bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/here --ip='*' --port=9101 --no-browser --NotebookApp.token="" --allow-root"'
