# demo-istio-project

A playground for Istio ⛵️

> :warning:
>
> This is a work in progress and may not be functional
>
> :warning:

If you are new to Exekube, follow the *Getting Started Tutorial* at https://exekube.github.io/exekube/in-practice/getting-started

---

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [demo-istio-project](#demo-istio-project)
	- [Project structure](#project-structure)
		- [Project modules](#project-modules)
		- [Project environments](#project-environments)
	- [Configuring the project](#configuring-the-project)
		- [docker-compose.yaml (project settings)](#docker-composeyaml-project-settings)
		- [gke-network module](#gke-network-module)
		- [gke-cluster module](#gke-cluster-module)
		- [cluster-admin module](#cluster-admin-module)
		- [istio / istio-nightly modules](#istio-istio-nightly-modules)
		- [istio-bookinfo module](#istio-bookinfo-module)
		- [cert-manager module](#cert-manager-module)
	- [Contributions](#contributions)

<!-- /TOC -->

## Project structure

### Project modules

```sh
modules/
├── cert-manager    # cert-manager Helm release
├── cluster-admin   # cluster-admin Helm release (cluster administration tasks)
├── gcp-secret-mgmt # Cloud KMS encryption keys + GCS storage bucket for secrets
├── gke-cluster     # GKE cluster
├── gke-network     # Networking module for the cluster
├── istio           # Istio latest stable release (0.7.1)
├── istio-bookinfo  # Istio Bookinfo example app
└── istio-nightly   # Istio nightly release (unstable)
```

Project-scoped Terraform modules can be found in the `modules` directory. These modules contain configuration that *is common* to all environments (dev, stg, prod) of the demo-istio-project.

All project-scoped modules can be built from ground up, by using *external Terraform modules*, such as those included with [Exekube](/), or those found in the [Module Registry](/), or some combination of them.

### Project environments

```sh
live/
├── dev
├── stg
├── prod
├── ...
└── terraform.tfvars # Terraform remote state config et al.
```

In `live`, we have a directory structure with *live modules* in leaf directires. Each of the live modules uses Terragrunt to import a project-scoped (sometimes directly global-scoped) module and configure it for a specific environment.

Live modules are similar in scope to Terraform [workspaces](/), namely because each will have:

- Unique input variables
- A unique Terraform state file

## Configuring the project

### docker-compose.yaml (project settings)

...

### gke-network module

...

### gke-cluster module

...

### cluster-admin module

...

### istio / istio-nightly modules

...

### istio-bookinfo module

...

### cert-manager module

...

## Contributions

Contributions are welcome!
