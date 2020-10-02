# Tanzu Service Mesh Samples

## Learn about TSM through Examples

This repository contains sample applications from various organizations that can
be installed on your onboarded TSM cluster.

- [Acme Fitness from VMware Cloud Advocacy Team](https://github.com/vmwarecloudadvocacy/acme_fitness_demo)
- [Bookinfo from Istio](https://istio.io/latest/docs/examples/bookinfo/)

We have selected parts of and pre-packaged the example applications to run on TSM
Service Mesh. It is a way to learn about TSM and test out its features such as

- Autoscaling using TSM Service Autoscaler
- Configuring TSM Service Autoscaler through Argo GitOps
- Monitoring application quality using Service Level Objectives (SLOs)

## Prerequisites

Before the sample applications can be installed an run, the following must first
be completed:

- Have access to Tanzu Service Mesh
- Onboard a Kubernetes cluster onto TSM

Instructions for onboarding a cluster onto TSM is [here](https://docs.vmware.com/en/VMware-Tanzu-Service-Mesh/services/getting-started-guide/GUID-DE9746FD-8369-4B1E-922C-67CF4FB22D21.html)

## Steps for Installing Sample Applications

### Clone the Tanzu Service Mesh Samples repo (this repo)

Clone this repo to get a copy of Kubernetes manifest files and scripts to install
and run the applications.

### Get access to the Kubernetes cluster onboarded onto TSM

Make sure you can apply the manifest files using your `kubectl` client. If you cloned
this repo onto a machine that is running your k8s cluster, then you're set.

However, if a copy of this repo and your k8s cluster are on different machines,
you can copy over a kubeconfig file from the machine running the onboarded k8
cluster. From the [kubernetes.io](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/) website:

> By default, kubectl looks for a file named config in the $HOME/.kube directory.
You can specify other kubeconfig files by setting the KUBECONFIG environment variable
or by setting the --kubeconfig flag.

For this repo, I saved a kubeconfig file called `guestcluster.kubeconfig` in the
`/home/tsmUser/data/` directory. It has all the config information needed to access
my k8s cluster. I then set up the environment variable KUBECONFIG to be the path
to a kubeconfig file. I did this using this command:

`export KUBECONFIG="/home/tsmUser/data/guestcluster.kubeconfig"`

I was then able to use `kubectl` to control the remote k8s cluster.

### The sample applications and how to run them

The sample applications available in this repo are from VMware, Istio, and Google.
They have been modified from their original versions to better fit our needs here.

|| Sample Application || Source Organization || Source Site ||
| ACME Fitness Shop | VMware Cloud Advocacy | [Repository](https://github.com/vmwarecloudadvocacy/acme_fitness_demo) |
| Bookinfo | Istio | [Repository](https://github.com/istio/istio/tree/master/samples/bookinfo), [Documentation](https://istio.io/latest/docs/examples/bookinfo/) |

The scripts use the [jq](https://stedolan.github.io/jq/) tool to run, available
on Linux, MacOS, and Windows.

To install the apps, run the `01_install-sample-apps.sh` script.
To remove the apps, run the `99_uninstall-sample-apps.sh` script.

### Explore and Learn

Look through the configurations and scripts. Compare them to the originals. We hope
this repo can help you learn about how to work with Tanzu Service Mesh and its
features.
