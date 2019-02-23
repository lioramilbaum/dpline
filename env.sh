#!/usr/bin/env bash

set -e

ACTION=$1
ENV=$2

echo "Verifying VirtualBox installed"
if ! [ -x "$(command -v VBoxManage)" ]; then
  echo 'Error: VirtualBox is not installed.'
  exit 1
fi

echo "Verifying VirtualBox supported version"
if [ $(virtualbox --help | head -n 1 | awk '{print $NF}') != "v6.0.4" ]; then
  echo 'Error: Unsupported VirtualBox version'
  exit 1
fi

echo "Verifying vagrant installed"
if ! [ -x "$(command -v vagrant)" ]; then
  echo 'Error: vagrant is not installed.'
  exit 1
fi

if [ "$ACTION" == "up" ]; then

  if ! [ -x "$(command -v ansible)" ]; then
    virtualenv -p python3 venv
    source venv/bin/activate
    pip install ansible
  fi

  vagrant box update
  vagrant up $ENV

  curl -s -XPOST 'http://localhost:8080/createItem?name=test' -u jenkins:jenkins --data-binary @jenkins/jobs/test/config.xml -H "Content-Type:text/xml"
  curl -X POST http://jenkins:jenkins@localhost:8080/job/test/build

elif [ "$ACTION" == "destroy" ]; then

  vagrant destroy -f $ENV

fi
