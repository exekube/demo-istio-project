# ↓ Module metadata

terragrunt = {
  terraform {
    source = "/project/modules//istio-bookinfo"
  }

  dependencies {
    paths = [
      "../../istio-system/istio",
    ]
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Module configuration (empty means all default)

