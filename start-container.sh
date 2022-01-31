#!/bin/bash

if [[ $CONFIG_VARS ]]; then

  SPLIT=$(echo $CONFIG_VARS | tr "," "\n")
  ARGS=
  for VAR in ${SPLIT}; do
      ARGS="${ARGS} -v ${VAR} "
  done

  JSON=`json_env --json $ARGS`

  echo " ==> Writing ${CONFIG_FILE_PATH}/${CONFIG_FILE_NAME} with ${JSON}"
  echo "window.__env = ${JSON}" > ${CONFIG_FILE_PATH}/${CONFIG_FILE_NAME}
  
fi

exec "$@"