#!/bin/bash


# while [[ $(echo "${INFRA_CONTROL_AS_COMPUTE,,}") != "y" ]] &&
#         [[ $(echo "${INFRA_CONTROL_AS_COMPUTE,,}") != "n" ]] &&
#          [[ "$INFRA_CONTROL_AS_COMPUTE" != "" ]]; do
#     echo "Wrong value, insert a valid one." 
#     read -p "Enter control as compute (y/N): " INFRA_CONTROL_AS_COMPUTE
# done
source ./env.sh

INFRA_CONTROL_AS_COMPUTE="${INFRA_CONTROL_AS_COMPUTE:-false}"



terraform apply -auto-approve -var="controlAsCompute=$INFRA_CONTROL_AS_COMPUTE"             
