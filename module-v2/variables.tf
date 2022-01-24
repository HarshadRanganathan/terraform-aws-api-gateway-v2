
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}
variable "account_id" {
  type        = string
  description = "AWS region"
}
variable "create" {
  description = "Controls if API Gateway resources should be created"
  type        = bool
  default     = true
}

variable "create_api_gateway" {
  description = "Whether to create API Gateway"
  type        = bool
  default     = true
}

variable "create_authorizers" {
  description = "Whether to create API Gateway"
  type        = bool
  default     = true
}

variable "create_default_stage" {
  description = "Whether to create default stage"
  type        = bool
  default     = true
}

variable "create_default_stage_api_mapping" {
  description = "Whether to create default stage API mapping"
  type        = bool
  default     = true
}

variable "create_api_domain_name" {
  description = "Whether to create API domain name resource"
  type        = bool
  default     = false
}

variable "create_routes_and_integrations" {
  description = "Whether to create routes and integrations resources"
  type        = bool
  default     = true
}


# API Gateway
variable "name" {
  description = "The name of the API"
  type        = string
  default     = ""
}

variable "description" {
  description = "The description of the API."
  type        = string
  default     = null
}

variable "default_route_settings" {
  description = "Settings for default route"
  type        = map(string)
  default     = {}
}

variable "disable_execute_api_endpoint" {
  description = "Whether clients can invoke the API by using the default execute-api endpoint. To require that clients use a custom domain name to invoke the API, disable the default endpoint"
  type        = string
  default     = false
}

variable "protocol_type" {
  description = "The API protocol. Valid values: HTTP, WEBSOCKET"
  type        = string
  default     = "HTTP"
}

variable "api_key_selection_expression" {
  description = "An API key selection expression. Valid values: $context.authorizer.usageIdentifierKey, $request.header.x-api-key."
  type        = string
  default     = "$request.header.x-api-key"
}

variable "route_key" {
  description = "Part of quick create. Specifies any route key. Applicable for HTTP APIs."
  type        = string
  default     = null
}

variable "route_selection_expression" {
  description = "The route selection expression for the API."
  type        = string
  default     = "$request.method $request.path"
}

variable "cors_configuration" {
  description = "The cross-origin resource sharing (CORS) configuration. Applicable for HTTP APIs."
  type        = any
  default     = {}
}

variable "credentials_arn" {
  description = "Part of quick create. Specifies any credentials required for the integration. Applicable for HTTP APIs."
  type        = string
  default     = null
}

variable "target" {
  description = "Part of quick create. Quick create produces an API with an integration, a default catch-all route, and a default stage which is configured to automatically deploy changes. For HTTP integrations, specify a fully qualified URL. For Lambda integrations, specify a function ARN. The type of the integration will be HTTP_PROXY or AWS_PROXY, respectively. Applicable for HTTP APIs."
  type        = string
  default     = null
}

variable "body" {
  description = "An OpenAPI specification that defines the set of routes and integrations to create as part of the HTTP APIs. Supported only for HTTP APIs."
  type        = string
  default     = null
}

variable "api_version" {
  description = "A version identifier for the API"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to API gateway resources."
  type        = map(string)
  default     = {}
}

#####
# default stage
variable "default_stage_access_log_destination_arn" {
  description = "Default stage's ARN of the CloudWatch Logs log group to receive access logs. Any trailing :* is trimmed from the ARN."
  type        = string
  default     = "arn"  
}

variable "default_stage_access_log_format" {
  description = "Default stage's single line format of the access logs of data, as specified by selected $context variables."
  type        = map(any)
  default     = {
  "stage" :  "$context.stage",
  "status" : "$context.status",
  "route_key" : "$context.routeKey",
  "request_id" :  "$context.requestId",
  "api_id" :  "$context.apiId",
  "account_id" :  "$context.accountId",
  "http_method" :  "$context.httpMethod",
  "source_ip" :  "$context.identity.sourceIp",
  "user-agent" :  "$context.identity.userAgent",
  "caller" :  "$context.identity.caller",
  "user" :  "$context.identity.user",
  "user_arn" :  "$context.identity.userArn",
  "authorizer_claims_property" :  "$context.authorizer.claims.property",
  "authorizer_principal_id" :  "$context.authorizer.principalId",
  "authorizer_error" : "$context.authorizer.error",
  "authorizer_latency" : "$context.authorizer.latency",
  "authorizer_property" :  "$context.authorizer.property",
  "authorizer_status" : "$context.authorizer.status",
  "aws_endpoint_request_id" :  "$context.awsEndpointRequestId",
  "aws_endpoint_request_id_2" :  "$context.awsEndpointRequestId2",
  "data_processed" : "$context.dataProcessed",
  "domain_name" :  "$context.domainName",
  "domain_prefix" :  "$context.domainPrefix",
  "error_message" :  "$context.error.message",
  "error_response_type" :  "$context.error.responseType",
  "extended_request_id" :  "$context.extendedRequestId",
  "identity_account_id" :  "$context.identity.accountId",
  "identity_caller" :  "$context.identity.caller",
  "identity_cognito_authentication_provider" :  "$context.identity.cognitoAuthenticationProvider",
  "identity_cognito_authentication_type" :  "$context.identity.cognitoAuthenticationType",
  "identity_cognito_identity_id" :  "$context.identity.cognitoIdentityId",
  "identity_cognito_identity_pool_id" :  "$context.identity.cognitoIdentityPoolId",
  "identity_principal_org_id" :  "$context.identity.principalOrgId",
  "integration_error" : "$context.integration.error",
  "integration_status" : "$context.integration.integrationStatus",
  "integration_latency" : "$context.integration.latency",
  "integration_request_id" : "$context.integration.requestId",
  "identity_source_ip_address" :  "$context.identity.sourceIp",
  "identity_user" :  "$context.identity.user",
  "identity_user_agent" :  "$context.identity.userAgent",
  "identity_user_arn" :  "$context.identity.userArn",
  "request_path" :  "$context.path",
  "request_protocol" :  "$context.protocol",
  "request_time" :  "$context.requestTime",
  "response_latency" : "$context.responseLatency",
  "response_length" : "$context.responseLength",
  "request_time_epoch" :  "$context.requestTimeEpoch"
}
}

variable "default_stage_tags" {
  description = "A mapping of tags to assign to the default stage resource."
  type        = map(string)
  default     = {}
}

#####
# default stage API mapping

####
# domain name
variable "domain_name" {
  description = "The domain name to use for API gateway"
  type        = string
  default     = null
}

variable "domain_name_certificate_arn" {
  description = "The ARN of an AWS-managed certificate that will be used by the endpoint for the domain name"
  type        = string
  default     = null
}

variable "domain_name_tags" {
  description = "A mapping of tags to assign to API domain name resource."
  type        = map(string)
  default     = {}
}

variable "mutual_tls_authentication" {
  description = "An Amazon S3 URL that specifies the truststore for mutual TLS authentication as well as version, keyed at uri and version"
  type        = map(string)
  default     = {}
}

####
# routes and integrations
variable "integrations" {
  description = "Map of API gateway routes with integrations"
  type        = map(any)
  default     = {}
}


# Authorizer
variable "authorizers" {
  description = "A map of authorizer details to create only supports one"
  type        = map(any)
  default     = {}
}

#variable "authorization_scopes" {
#  type        = list(string)
#  default     = []
#  description = "The authorization scopes used when the authorization is COGNITO_USER_POOLS."
#}
variable "authorization_scopes" {
  description = "Map of API gateway routes with scopes"
  type        = map(any)
  default     = {}
}
variable "routes_wihout_integrations" {
  description = "Map of API gateway routes with scopes"
  type        = map(any)
  default     = {}
}
variable "authorizer_name" {
  type        = string
  default     = "CognitoAuthorizer"
  description = "The name of the authorizer."
}

variable "authorizer_identity_sources" {
  type        = list(string)
  default     = ["$request.header.Authorization"]
  description = "The name of the authorizer."
}
variable "jwt_audience" {
  type        = list(string)
  default     = []
  description = "The jwt_audience  used to suply authorized users/tokens."
}

variable "jwt_issuer" {
  description = "JWT Token issuer"
  type        = string
  default     = null
}

variable "authorizer_type" {
  description = "What kind of authorization is expecting for Integrations"
  type        = string
  default     = "JWT"
}

variable "vpc_link_id" {
  description = "What VPC link needs to be attched for Integrations"
  type        = string
  default     = null
}

variable "server_name" {
  description = "The Server name to use for API gateway HTTPS/TLS config"
  type        = string
  default     = null
}

variable "log_retention_days" {
  description = "Time to maintain logs in Cloudwatch"
  default = 90
}