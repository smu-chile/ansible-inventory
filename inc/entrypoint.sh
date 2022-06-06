#!/bin/sh

set -e

#SET DEFAULT ENV VARS

if [ ! -z $PLUGIN_ENV_FILE ]; then
  export $(cat $PLUGIN_ENV_FILE | xargs)
fi

if [ -z $PLUGIN_PLAYBOOK ]; then
  echo "PLUGIN_PLAYBOOK is missing"
  exit 1
fi

#if [ -z "$SSH_KEY" ]  && [ -z "$VAULT_TOKEN" ]; then
if [ -z "$SSH_KEY" ]; then 
  echo "SSH_KEY is missing"
  #echo "SSH_KEY and VAULT_TOKEN missing"
  exit 2
fi

if [ -z "$PLUGIN_PROVIDER" ]; then
  echo "PLUGIN_PROVIDER is missing"
  exit 3
fi

if [ -z $PLUGIN_INVENTORY_PATH ]; then
  echo "PLUGIN_INVENTORY_PATH is missing"
  exit 4
fi

if [ "$SSH_KEY" ]; then
  mkdir ~/.ssh
  printf '%s\n' "$SSH_KEY" > ~/.ssh/id_rsa
  chmod 400 ~/.ssh/id_rsa
  echo "Host *" > ~/.ssh/config
  echo "  StrictHostKeyChecking no" >> ~/.ssh/config
fi

if [ $PLUGIN_PROVIDER = "huawei" ]; then
  INVENTORY="$PLUGIN_INVENTORY_PATH/hwc_ecs.py"
fi

if [ ! -z $PLUGIN_USE_BASTION ] && [ -z $PLUGIN_REMOTE_USER ]; then
  echo "REMOTE_USER is missing"
  exit 8
fi

if [ ! -z $PLUGIN_USE_BASTION ] && [ -z $IP_BASTION ] && [ -z $PLUGIN_CONSUL_PATH_TO_BASTION_IP ]; then
  echo "IP_BASTION is missing"
  exit 9
elif [ ! -z $PLUGIN_CONSUL_PATH_TO_BASTION_IP ]; then
  echo "Getting IP_BASTION from Consul key -> $PLUGIN_CONSUL_PATH_TO_BASTION_IP"
  export IP_BASTION=`consul kv get $PLUGIN_CONSUL_PATH_TO_BASTION_IP`
fi

printf "ANSIBLE PLAYBOOK\n"
ansible-playbook -i $INVENTORY $PLUGIN_PLAYBOOK --private-key=/drone/src/keys/id_rsa $VERBOSE
