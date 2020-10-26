#!/bin/bash
# Enable Tanzu Service Mesh Service Autoscaler for ACME Fitness application.

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

# Check that ACME Fitness has been installed.
NAMESPACE_STATUS_PHASE=`kubectl -o json get namespace acme | jq  .status.phase -r`
if [ "$NAMESPACE_STATUS_PHASE" != "Active" ]; then
    printf "\nUnable to find Acme Fitness namspace. Please install Acme Fitness to enable TSM Autoscaler.\n"
    exit 1
fi


# Enable TSM Autoscaler for ACME Fitness.
kubectl apply -f acme-fitness/tsm-autoscaler/asd_efficiency_on.yaml
if [ $? -gt 0 ]; then
    printf "\nUnable to install Definition CRD.\n" 
    exit 1
fi

echo ""
echo "#############################################################"
echo "# TSM Autoscaling is enabled for ACME Fitness #"
echo "#############################################################"
echo ""
