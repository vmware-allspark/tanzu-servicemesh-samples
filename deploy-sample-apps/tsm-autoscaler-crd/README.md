# Tanzu Service Mesh Service Autoscaler

## About TSM Autoscaler

// TODO: add link to TSM Autoscaler documentation

With Tanzu Service Mesh Service Autoscaler, developers and operators can have automatic
scaling of microservices that meet changing levels of demand based on metrics, such
as CPU or memory usage. These metrics are available to Tanzu Service Mesh without
needing additional code changes or metrics plugins. If you are familiar with Kubernetes,
implementing Tanzu Service Mesh Service Autoscaler will be easy because it uses
the Kubernetes Custom Resource Definition (CRD) to configure the autoscaler.

You can set the desired autoscaling properties with this CRD. For example, the Tanzu
Service Mesh Service Autoscaler allows for performance or efficiency modes of operation.
Performance Mode (scales out service instances) is designed to respond to increasing
demand on the service while Efficiency Mode is designed to scale in or out as needed,
as defined by the metric thresholds within the CRD properties. Within Tanzu Service
Mesh, detailed metrics are available on service instances, such as requests, memory
usage, CPU usage, and latencies. You can use these metrics to configure the associated
properties in the autoscaling CRD.

You can deploy autoscaling definitions alongside their application manifests into
existing CI/CD pipelines and GitOps workflows without needing further code changes.
You can deploy Tanzu Service Mesh Service Autoscaler non-intrusively in production
or even as part of the development process for testing and simulation purposes.

## Instructions

1. Install TSM Autoscaler CRD (need to be done only once per onboarded cluster).
Apply the CRD placed inside the tsm-autoscaler_install directory with
`kubetl apply -f autoscaling.tsm.tanzu.vmware.com_definitions.yaml`
1. Create TSM Autoscaling Definition custom resource manifests for your services
and apply them with, for example, `kubectl apply -f asd_efficiency_on.yaml`. We
have provided examples in directories called `tsm-autoscaler` inside the example
application directories.

We have provided scripts that will do the two above steps for a single application
with a single command. For example, the `acme-fitness_autoscaler-enable.sh` will
install the Autoscaler Definition CRD as well as enable the autoscaler on the ACME
Fitness application.
