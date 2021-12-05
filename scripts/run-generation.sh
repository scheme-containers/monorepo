#!/bin/bash

script_directory=`dirname $0`

csi -R r7rs -ss $script_directory/generate-docker-actions.scm $@
