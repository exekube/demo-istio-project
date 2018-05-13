terraform {
  backend "gcs" {}
}

module "bookinfo" {
  source = "/exekube-modules/helm-template-release"

  release_name      = "bookinfo"
  release_namespace = "default"
  chart_name        = "bookinfo-v1alpha2/"
}
