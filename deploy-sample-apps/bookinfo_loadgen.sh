#!/bin/bash
# Create a Cyclical load generator to exercise TSM Autoscaler and SLO features/

# Check that Bookinfo has been installed.
BOOKINFO_NAMESPACE_STATUS_PHASE=`kubectl -o json get namespace bookinfo | jq  .status.phase -r`
LOADGEN_NAMESPACE_STATUS_PHASE=`kubectl -o json get namespace loadgen | jq  .status.phase -r`
if [ "$BOOKINFO_NAMESPACE_STATUS_PHASE" != "Active" ]; then
    printf "\nUnable to find Bookinfo namespace. Please install Bookinfo before creating load generator.\n"
    exit 1
fi
if [ "$LOADGEN_NAMESPACE_STATUS_PHASE" != "Active" ]; then
    kubectl create namespace loadgen
fi


# Enable cyclical loadgen for Bookinfo
kubectl apply -f bookinfo/traffic-generator/bookinfo-locust-cyclical.yaml
if [ $? -gt 0 ]; then
    printf "\nUnable to start cyclical load generator deployment.\n" 
    exit 1
fi

echo ""
echo "###############################################"
echo "# Cyclical load generator created for Bookinfo #"
echo "###############################################"
echo ""
