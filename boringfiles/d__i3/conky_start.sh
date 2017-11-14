#!/bin/bash

killall conky
conky -c ~/.conkyrc | dzen2 -y 2500 -w 1000 -ta c -x 200 -bg black -fn -misc-fixed-medium-r-normal--12-120-75-75-C-70-iso10646-1
