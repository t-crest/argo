#!/bin/bash
pushd "$( dirname "${BASH_SOURCE[0]}" )/.."
ARGO_PROJECT_DIR="$(pwd)/"
# cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"

export ARGO_PROJECT_DIR
SRC_DIR_STRING=$(find src -type d | sed 's/\(.*\)/"\1"/g' |tr '\n' ' ') 
TB_DIR_STRING=$(find test/bench -type d | sed 's/\(.*\)/"\1"/g' |tr '\n' ' ') 

echo "PROJECT ROOT = $ARGO_PROJECT_DIR"

# create project file & add directories
echo "" > util/Argo.prj
while IFS= read -r; do
  line=$REPLY
  line=${line/ARGO_PROJECT_DIR/$ARGO_PROJECT_DIR}
  line=${line/SRC_DIR_STRING/$SRC_DIR_STRING $TB_DIR_STRING}
  echo $line >> util/Argo.prj
done < util/Argo.tpl
echo "Project file for emacs vhdl-mode is in $(pwd)/util/Argo.prj"
popd
