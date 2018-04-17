# ↓ Module metadata

terragrunt = {
  terraform {
    source = "/project/modules//cert-manager"
  }

  dependencies {
    paths = [
      "../cluster-admin",
      "../../istio-system/istio",
    ]
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Module configuration (empty means all default)

