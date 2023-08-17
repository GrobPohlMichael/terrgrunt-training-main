remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    subscription_id      = "3902cdee-a787-433e-b331-02b77bc9758c"
    resource_group_name  = "rg-azure-training-1-1013930-01-3"
    storage_account_name = "pdazuretraining13"
    container_name       = "tf-state"
    key                  = "${replace(path_relative_to_include(), "/[^0-9A-Za-z]/", "")}.tfstate"
  }
}


generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
subscription_id = var.subscription_id
features {}
}
EOF
}

inputs = {
    subscription_id = "3902cdee-a787-433e-b331-02b77bc9758c"
    resource_group_name = "rg-azure-training-1-1013930-01-3"
}
