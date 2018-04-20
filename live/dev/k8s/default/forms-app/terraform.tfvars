# ↓ Module metadata

terragrunt = {
  terraform {
    source = "/project/modules//forms-app"
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

domain_name = "dev.app.istio.exekube.us"
