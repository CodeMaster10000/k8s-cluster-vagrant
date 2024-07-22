#!/bin/bash
sudo apt install dos2unix -y
sudo dos2unix /vagrant/dos2unix.sh

dos2unix_recursive() {
  local path=$1
  for file in "$path"/*; do
    if [[ -f "$file" ]]; then
      extension="${file##*.}"
      if [[ "$extension" == "sh" || "$extension" == "env" || "$extension" == "exp" || "$extension" == "py" ]]; then
        sudo dos2unix "$file"
        # sudo chmod 777 "$file"
      fi
    elif [[ -d "$file" ]]; then
      dos2unix_recursive "$file"
    fi
  done
}

dos2unix "/vagrant/environment.properties"
dos2unix_recursive "/vagrant/provision"
