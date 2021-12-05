#!/bin/bash

script_directory=`dirname $0`
workflows_path=$script_directory/../.github/workflows/

csi -R r7rs -ss $script_directory/generate-docker-actions.scm $workflows_path
