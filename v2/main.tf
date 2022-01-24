##################################################################################################################
# Module      : Api Gateway v2
# Description : Api Gateway module HTTP API Gateway
# See possible features https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-vs-rest.html 
module "api_gateway" {
  source = "../module-v2"

  name               = "${var.gateway_name}"
  description        = "Managed By Terraform"
  tags               = local.default_tags
  protocol_type      = var.protocol_type
  cors_configuration = local.cors_configuration
  integrations = var.integrations
  vpc_link_id  = data.terraform_remote_state.vpc_link.outputs.vpc_link_id

  # Authorizer
  create_authorizers = var.create_authorizers


  authorizer_name             = "${var.namespace}-${var.stage}-${var.authorizer_name}"
  authorizer_identity_sources = var.authorizer_identity_sources
  jwt_audience                = flatten(local.cognito_app_client_ids)
  jwt_issuer                  = format("https://%s", data.terraform_remote_state.cognito.outputs.endpoint[0])

  authorization_scopes = var.authorization_scopes
  routes_wihout_integrations = var.routes_wihout_integrations


 

  # Domain Name/TLS Config
  create_api_domain_name      = var.create_api_domain_name
  server_name                 = var.server_name
  account_id                  = data.aws_caller_identity.current.account_id
}