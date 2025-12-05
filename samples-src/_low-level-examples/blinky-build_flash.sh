#!/bin/bash

make clean && make

if [ -f ./blinky.ihx ]; then
    cd ..
    ../../stm8flash -c stlinkv2 -p stm8s103f3 -w ./blinky.ihx
else
    echo "--> nothing to flash!"
fi


