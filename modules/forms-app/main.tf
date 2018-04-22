terraform {
  backend "gcs" {}
}

variable "secrets_dir" {}
variable "domain_name" {}

module "forms_app" {
  # Note the `helm-template-release` module, a Tillerless Helm release
  source = "/exekube-modules/helm-template-release"

  release_name      = "forms-app"
  release_namespace = "default"
  chart_repo        = "exekube"
  chart_name        = "nginx-react"
  chart_version     = "0.1.3"

  istio_inject = true

  domain_name = "${var.domain_name}"
}
