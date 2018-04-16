terraform {
  backend "gcs" {}
}

variable "project_id" {}
variable "serviceaccount_key" {}

variable "dns_zones" {
  default = {}
}

variable "dns_records" {
  default = {}
}

module "gke_network" {
  source             = "/exekube-modules/gke-network"
  project_id         = "${var.project_id}"
  serviceaccount_key = "${var.serviceaccount_key}"

  dns_zones   = "${var.dns_zones}"
  dns_records = "${var.dns_records}"
}
