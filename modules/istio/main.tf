provider "helm" {}

terraform {
  backend "gcs" {}
}

variable "secrets_dir" {}
variable "load_balancer_ip" {}

module "istio" {
  source = "/exekube-modules/helm-template-release"

  release_name      = "istio"
  release_namespace = "istio-system"

  chart_name       = "istio/"
  load_balancer_ip = "${var.load_balancer_ip}"
}
