#!/bin/bash

make clean && make

if [ -f ./main.ihx ]; then
    ../../stm8flash -c stlinkv2 -p stm8s103f3 -w ./main.ihx
else
    echo "--> nothing to flash!"
fi


