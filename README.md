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

```sh
modules/
├── gcp-secret-mgmt   # Cloud KMS cryptokeys + GCS storage buckets for secrets
├── gke-network       # Networking module for the cluster
├── gke-cluster       # GKE cluster
├── helm-initializer  # Install Tiller in any namespace
├── cluster-admin     # cluster-admin Helm release
├── cert-manager      # cert-manager Helm release
├── istio             # Istio latest stable release (0.7.1)
├── istio-nightly     # Istio nightly release (unstable)
└── istio-bookinfo    # Istio Bookinfo example app
```

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
│   │   ├── istio-system
│   │   │   └── istio
│   │   └── kube-system
│   │       ├── cert-manager
│   │       ├── cluster-admin
│   │       └── helm-initializer
│   └── secrets
│       ├── default
│       │   └── helm-tls
│       └── kube-system
│           ├── helm-tls
│           └── owner.json
├── stg
│   ...
├── prod
│   ...
└── terraform.tfvars
```
