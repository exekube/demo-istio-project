terraform {
  backend "gcs" {}
}

module "bookinfo" {
  source = "/exekube-modules/helm-template-release"

  release_name      = "bookinfo"
  release_namespace = "default"
  istio_inject      = true

  chart_name = "bookinfo-v1alpha3/"
}
