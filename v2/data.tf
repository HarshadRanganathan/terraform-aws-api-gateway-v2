data "terraform_remote_state" "vpc_link" {
  backend = "s3"

  config = {
    region = var.region
    bucket = format("%s-%s-terraform-state", var.namespace, var.stage)
    key    = format("%s/api-gateway/v2/vpc-link/terraform.tfstate", var.stage)
  }
}

data "aws_caller_identity" "current" {}

data "terraform_remote_state" "cognito" {
  backend = "s3"

  config = {
    region = var.region
    bucket = format("%s-%s-terraform-state", var.namespace, var.stage)
    key    = format("%s/cognito/userpools/%s/terraform.tfstate", var.stage, var.user_pool_tf_name)
  }
}

data "terraform_remote_state" "cognito_app_clients" {
  backend = "s3"

  config = {
    region = var.region
    bucket = format("%s-%s-terraform-state", var.namespace, var.stage)
    key    = format("%s/cognito/userpools/%s/app-clients/terraform.tfstate", var.stage, var.user_pool_tf_name)
  }
}