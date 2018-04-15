# ↓ Module metadata
terragrunt = {
  terraform {
    source = "/project/modules//cluster-admin"
  }

  dependencies {
    paths = [
      "../../cluster",
      "../_helm",
    ]
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Module configuration (empty means all default)

