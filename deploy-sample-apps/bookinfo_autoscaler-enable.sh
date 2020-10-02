#!/bin/bash
# Enable Tanzu Service Mesh Service Autoscaler for Bookinfo application.

# Check that TSM Autoscaler Definition CRD has been installed.
CRD_KIND=`kubectl -o json get crd definitions.autoscaling.tsm.tanzu.vmware.com | jq  .status.acceptedNames.kind -r`
if [ "$CRD_KIND" != "Definition" ]; then
    printf "Autoscaler Definition CRD not installed. Installing Definition CRD...\n"
    kubectl apply -f tsm-autoscaler-crd/autoscaling.tsm.tanzu.vmware.com_definitions.yaml
    if [ $? -ne 0 ]; then 
        echo "\nUnable to install Definition CRD. Exiting..."
        exit 1
    fi
fi

# Check that Bookinfo has been installed.
NAMESPACE_STATUS_PHASE=`kubectl -o json get namespace bookinfo | jq  .status.phase -r`
if [ "$NAMESPACE_STATUS_PHASE" != "Active" ]; then
    printf "\nUnable to find Bookinfo namspace. Please install Bookinfo to enable TSM Autoscaler.\n"
    exit 1
fi


# Enable TSM Autoscaler for Bookinfo.
kubectl apply -f bookinfo/tsm-autoscaler/asd_efficiency_on.yaml
if [ $? -gt 0 ];then
    printf "\nUnable to install Definition CRD.\n"
    exit 1
fi

echo ""
echo "#############################################################"
echo "# TSM Autoscaling is enabled for Bookinfo #"
echo "#############################################################"
echo ""
