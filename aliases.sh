alias spython='docker run --gpus all -v `pwd`:/here -itp  8888:8888 slosar/seconda python'
alias sipython='docker run --gpus all -v `pwd`:/here -itp  8888:8888 slosar/seconda ipython'
alias snotebook='docker run --gpus all -v `pwd`:/here -itp 9100:9100 slosar/seconda /bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/here --ip='*' --port=9100 --no-browser --NotebookApp.token="" --allow-root"'
alias snotebook1='docker run --gpus all -v `pwd`:/here -itp 9100:9100 slosar/seconda /bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/here --ip='*' --port=9101 --no-browser --NotebookApp.token="" --allow-root"'
