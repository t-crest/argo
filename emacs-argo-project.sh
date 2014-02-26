#!/bin/bash
ARGO_PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export ARGO_PROJECT_DIR
echo "PROJECT ROOT = $ARGO_PROJECT_DIR"
cat Argo.tpl | sed s@ARGO_PROJECT_DIR@$ARGO_PROJECT_DIR/@g > Argo.prj
emacs -l vhdl-mode -f vhdl-import-project Argo.prj auto -f vhdl-speedbar
