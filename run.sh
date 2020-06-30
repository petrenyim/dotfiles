#!/bin/bash

docker run --rm -it -v "/home/${USER}:/env/home" -w "/env" env
