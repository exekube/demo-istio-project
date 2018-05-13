terraform {
  backend "gcs" {}
}

variable "domain_name" {}

module "forms_app" {
  source = "/exekube-modules/helm-template-release"

  release_name      = "forms-app"
  release_namespace = "default"
  chart_repo        = "exekube"
  chart_name        = "nginx-react"
  chart_version     = "0.2.0"
  domain_name       = "${var.domain_name}"
}
