

if [ -z "$INFRA_CONTROL_AS_COMPUTE" ]; then
    echo "Empty option control as compute."
    read -p "Enter control as compute (y/N): " INFRA_CONTROL_AS_COMPUTE
fi

while [[ "$INFRA_CONTROL_AS_COMPUTE" != "y" ]] && [[ "$INFRA_CONTROL_AS_COMPUTE" != "N" ]] &&
        [[ "$INFRA_CONTROL_AS_COMPUTE" != "Y" ]] && [[ "$INFRA_CONTROL_AS_COMPUTE" != "n" ]] &&
         [[ "$INFRA_CONTROL_AS_COMPUTE" != "" ]]; do
    echo "Wrong value, insert a valid one." 
    read -p "Enter control as compute (y/N): " INFRA_CONTROL_AS_COMPUTE
done

if  [[ "$INFRA_CONTROL_AS_COMPUTE" == "y" ]] || [[ "$INFRA_CONTROL_AS_COMPUTE" == "Y" ]];  then
    INFRA_CONTROL_AS_COMPUTE=true
elif [[ "$INFRA_CONTROL_AS_COMPUTE" == "n" ]] || [[ "$INFRA_CONTROL_AS_COMPUTE" == "N" ]];  then
    INFRA_CONTROL_AS_COMPUTE=false
else
    INFRA_CONTROL_AS_COMPUTE=false
fi



terraform apply -auto-approve -var="controlAsCompute=$INFRA_CONTROL_AS_COMPUTE"             
