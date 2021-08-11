#!/bin/bash

set -u
set -x

init(){
  cp ./backends/backend_${environment}.tf backend.tf
  terraform init
}

apply(){
  init
  terraform apply -var-file=tfvars/${environment}.tfvars --auto-approve
}


plan(){
  init
  terraform plan -var-file=tfvars/${environment}.tfvars
}

destroy(){
  init
  terraform destroy --auto-approve
}


command=$1
environment=$2

if [ $command == "init" ]
then
  echo "$command Invoked"
  init
elif [ $command == "apply" ]
then
  echo "$command Invoked"
  apply
elif [ $command == "destroy" ]
then
  echo "$command Invoked"
  destroy
elif [ $command == "plan" ]
then
  echo "$command Invoked"
  plan
fi