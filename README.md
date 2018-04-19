# demo-istio-project

A playground for Istio ⛵️

> :warning:
>
> This is a work in progress
>
> :warning:

If you are new to Exekube, follow the *Getting Started Tutorial* at https://exekube.github.io/exekube/in-practice/getting-started

---

## Get started

To get this working, you'll need to:

1. Set the *GCP project* name base in `docker-compose.yaml`:
    ```yaml
    TF_VAR_project_id: ${ENV:?err}-demo-apps-296e23
    ```
2. Configure project-scoped modules in the `modules` directory: all settings that will be *the same across all environments of the project*.
3. Configure module imports for the *dev* environment in the `live/dev` directory.

## Project structure

### Project modules

#### `gcp-secret-mgmt`

This module creates Google Cloud KMS encryption keys and GCS storage buckets for storing and distributing secrets.

#### `gke-network`

This module creates networking resources for our GKE cluster.

#### `gke-cluster`

This module creates a GKE cluster.

#### `administration-tasks`

This module handles common cluster administration tasks, such as assigning cluster-admins, creating namespaces, and securing the Kubernetes Dashboard. Can be installed before Tiller (using `helm template ... | kubectl apply -f`) or through kube-system Tiller.

#### `helm-initializer`

This modules installs Tiller into `kube-system` namespace.

#### `cert-manager`

This modules installs cert-manager Helm chart into `kube-system` namespace.

#### `istio`

This module installs Istio 0.7.1 (latest release on GitHub)

#### `istio-nightly`

This module installs the latest version of Istio (from `master` branch on GitHub).

#### `istio-bookinfo`

This module installs istio-bookinfo sample application.

### Project environments

```sh
live/
├── dev
│   ├── infra
│   │   ├── network
│   │   │   └── terraform.tfvars
│   │   └── secret-mgmt
│   │       ├── permissions.tf
│   │       └── terraform.tfvars
│   ├── k8s
│   │   ├── cluster
│   │   │   └── terraform.tfvars
│   │   ├── default
│   │   │   └── bookinfo
│   │   │       └── terraform.tfvars
│   │   ├── istio-system
│   │   │   └── istio
│   │   │       └── terraform.tfvars
│   │   └── kube-system
│   │       ├── administration-tasks
│   │       │   └── terraform.tfvars
│   │       ├── cert-manager
│   │       │   ├── resources
│   │       │   └── terraform.tfvars
│   │       └── helm-initializer
│   │           └── terraform.tfvars
│   └── secrets
│       ├── default
│       │   └── helm-tls
│       │       ├── ca.cert.pem
│       │       ├── helm.cert.pem
│       │       ├── helm.key.pem
│       │       ├── tiller.cert.pem
│       │       └── tiller.key.pem
│       └── kube-system
│           ├── helm-tls
│           │   ├── ca.cert.pem
│           │   ├── helm.cert.pem
│           │   ├── helm.key.pem
│           │   ├── tiller.cert.pem
│           │   └── tiller.key.pem
│           └── owner.json
├── stg
│   ...
├── prod
│   ...
└── terraform.tfvars
```
