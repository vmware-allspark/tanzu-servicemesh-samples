#!/bin/bash
# Create a Cyclical loadgenerator to excercise TSM Autoscaler and SLO features/

# Check that ACME Fitness has been installed.
ACME_NAMESPACE_STATUS_PHASE=`kubectl -o json get namespace acme | jq  .status.phase -r`
LOADGEN_NAMESPACE_STATUS_PHASE=`kubectl -o json get namespace loadgen | jq  .status.phase -r`
if [ "$ACME_NAMESPACE_STATUS_PHASE" != "Active" ]; then
    printf "\nUnable to find Acme Fitness namspace. Please install Acme Fitness to enable TSM Autoscaler.\n"
    exit 1
fi
if [ "$LOADGEN_NAMESPACE_STATUS_PHASE" != "Active" ]; then
    kubectl create namespace loadgen
fi

# Enable headless loadgen for ACME Fitness.
kubectl apply -n acme -f acme-fitness/traffic-generator/headless_loadgen.yaml
if [ $? -gt 0 ]; then
    printf "\nUnable to install Headless Loadgen deployment.\n" 
    exit 1
fi

# Enable cyclical loadgen for ACME Fitness
kubectl apply -f acme-fitness/traffic-generator/cyclical-traffic-deployment.yaml
if [ $? -gt 0 ]; then
    printf "\nUnable to start cyclical loadgenerator deployment.\n" 
    exit 1
fi


echo ""
echo "###################################################"
echo "# Cyclical loadgenerator created for ACME Fitness #"
echo "###################################################"
echo ""
