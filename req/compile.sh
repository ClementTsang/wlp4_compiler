#!/bin/bash

cat $1 | ./wlp4scan | ./wlp4parse | ./wlp4gen > "${1%%.*}.asm" 
