# seconda
Slosar Enivornment anaConda: my own portable anaconda 3 environment.

## Install

Add

```
source /path/to/seconda aliases.sh
```

to your `.bashrc`.

## Build docker image

To build, run (in `seconda` directory):
```
 docker build -t slosar/seconda .
```

To push, run (only if you are me)
```
docker push slosar/seconda
```

## Extract built conda environment:

Run

```
./extract_conda.sh
```
and copy resulting `conda.tbz2` wherever you want.




