#!/usr/bin/env bash
if [ -z "$1" ]; then
  echo "Starting up visudo with this script as first parameter"
  PYTHON_PATH=$(dirname $(which python))
  echo export PYTHON_PATH=$(dirname $(which python)) > /tmp/ppath.sh
  chmod +x /tmp/ppath.sh
  export EDITOR=$0 && sudo -E visudo
else
  echo "Changing sudoers"
  . /tmp/ppath.sh
  echo "PYTHON_PATH: ${PYTHON_PATH}"
  sed -E -i.bak "s#(secure_path=\")(/)#\1${PYTHON_PATH}:\2#g" $1
  echo "# ${PYTHON_PATH} added to secure_path" >> $1
  echo "# ${PYTHON_PATH} added to secure_path"
fi
