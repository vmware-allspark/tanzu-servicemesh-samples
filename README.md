# Tanzu Service Mesh Samples

## Learn about TSM through Examples

This repository contains sample applications from various organizations that can
be installed on your onboarded Tanzu Service Mesh managed cluster.

- [Acme Fitness from VMware Cloud Advocacy Team](https://github.com/vmwarecloudadvocacy/acme_fitness_demo)
- [Bookinfo from Istio](https://istio.io/latest/docs/examples/bookinfo/)

We have selected parts of and pre-packaged the example applications to run on Tanzu
Service Mesh. It is a way to learn about TSM and test out its features such as

- Autoscaling using TSM Service Autoscaler
- Configuring TSM Service Autoscaler through Argo GitOps
- Monitoring application quality using Service Level Objectives (SLOs)

## Prerequisites

Before the sample applications can be installed an run, the following must first
be completed:

- Have access to Tanzu Service Mesh (TSM)
- Onboard a Kubernetes cluster (v1.16 or newer) onto TSM

Instructions for onboarding a cluster onto TSM is [here](https://docs.vmware.com/en/VMware-Tanzu-Service-Mesh/services/getting-started-guide/GUID-DE9746FD-8369-4B1E-922C-67CF4FB22D21.html)

## Steps for Installing Sample Applications

### Clone the Tanzu Service Mesh Samples repo (this repo)

Clone this repo to get a copy of Kubernetes manifest files and scripts to install
and run the applications.

### Get access to the Kubernetes cluster onboarded onto TSM

Make sure you have the proper `KUBECONFIG` that can apply the manifest files using your `kubectl` client.

From the [kubernetes.io](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/) website:

> By default, kubectl looks for a file named config in the $HOME/.kube directory.
You can specify other kubeconfig files by setting the KUBECONFIG environment variable
or by setting the --kubeconfig flag.

### The sample applications and how to run them

The sample applications available in this repo are from VMware, and Istio.
They have been slightly modified from their original versions to better fit our needs here.  Example changes include adding deployment resource requests, adding additional labels and pre configured traffic generators.

Sample Application | Source Organization | Source Site
-------------------| ------------------- | -----------
ACME Fitness Shop | VMware Cloud Advocacy | [Repository](https://github.com/vmwarecloudadvocacy/acme_fitness_demo)
Bookinfo | Istio | [Repository](https://github.com/istio/istio/tree/master/samples/bookinfo), [Documentation](https://istio.io/latest/docs/examples/bookinfo/)

The scripts use the [jq](https://stedolan.github.io/jq/) tool to run, available
on Linux, MacOS, and Windows.

To install the apps, run the `01_install-sample-apps.sh` script.
To remove the apps, run the `99_uninstall-sample-apps.sh` script.

### Explore and Learn

Look through the configurations and scripts. Compare them to the originals. We hope
this repo can help you learn about how to work with Tanzu Service Mesh and its
features.
