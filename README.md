# demo-istio-project

A playground for Istio ⛵️

> :warning:
>
> This is a work in progress and may not be functional
>
> :warning:

If you are new to Exekube, follow the *Getting Started Tutorial* at https://exekube.github.io/exekube/in-practice/getting-started

---

- [Project structure](#project-structure)
	- [Project modules](#project-modules)
	- [Project environments](#project-environments)
- [Configuring the project](#configuring-the-project)
	- [Global settings: docker-compose.yaml](#global-settings-docker-composeyaml)
	- [network module](#network-module)
	- [cluster module](#cluster-module)
	- [cluster-admin module](#cluster-admin-module)
	- [istio / istio-nightly modules](#istio-istio-nightly-modules)
	- [cert-manager module](#cert-manager-module)
	- [bookinfo module](#bookinfo-module)
- [Contributions](#contributions)

## Project structure

### Project modules

```sh
modules/
├── bookinfo      # Istio Bookinfo sample application
├── cert-manager  # cert-manager for TLS certificates
├── cluster       # GKE cluster
├── cluster-admin # Common cluster administration tasks
├── istio         # Istio latest stable release (0.7.1)
└── istio-nightly # Istio nightly release (unstable)
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

### Global settings: docker-compose.yaml

...

### network module

...

### cluster module

...

### cluster-admin module

...

### istio / istio-nightly modules

...

### cert-manager module

...

### bookinfo module

...

## Contributions

Contributions are welcome!
