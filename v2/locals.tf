locals {

  default_tags = {
    "Stage"     = var.stage
    "namespace" = var.namespace
    "ManagedBy" = "Terraform"
    "App"       = var.gateway_name
  }
}

locals {
  cors_configuration = {
    allow_headers = var.cors_allowed_headers
    allow_methods = var.cors_allowed_methods
    allow_origins = var.cors_allowed_origins
  }


  cognito_app_client_ids = [for clients in data.terraform_remote_state.cognito_app_clients.outputs.app_clients : [for name in var.cognito_app_client_names : clients.id if clients.name == name ]]
}