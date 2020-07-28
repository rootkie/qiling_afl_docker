#!/bin/bash

docker run --cap-add=ALL --privileged --name fuzz_env -it \
    -v "$PWD/shared_folder":/shared_folder afl-distrib-qiling:latest /bin/bash
#docker container start -i fuzz_env
