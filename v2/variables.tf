variable "region" {
  type        = string
  default     = "us-east-1"
  description = "If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee"
}

# label
variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "gateway_name" {
  description = "The name of the API"
  type        = string
  default     = ""
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

# variable "create_stage" {
#   description = "Whether to create custom stage"
#   type        = bool
#   default     = false
# }
#
# variable "create_stage_api_mapping" {
#   description = "Whether to create stage API mapping"
#   type        = bool
#   default     = false
# }

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

#####
# default stage
variable "default_stage_access_log_destination_arn" {
  description = "Default stage's ARN of the CloudWatch Logs log group to receive access logs. Any trailing :* is trimmed from the ARN."
  type        = string
  default     = null
}

variable "default_stage_access_log_format" {
  description = "Default stage's single line format of the access logs of data, as specified by selected $context variables."
  type        = string
  default     = null
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
variable "server_name" {
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

variable "method" {
  description = "REST method to expose for the endpoint"
  type        = string
  default     = "GET"
}


variable "api_arn" {
  description = "target lb for the api"
  type        = string
  default     = ""
}

variable "cors_allowed_origins" {
  description = "CORS Origins allowed"
  type        = list(string)
  default     = []
}

variable "cors_allowed_methods" {
  description = "CORS methods Allowed"
  type        = list(string)
  default     = []
}

variable "cors_allowed_headers" {
  description = "CORS Allowed headers"
  type        = list(string)
  default     = []
}

variable "create_authorizers" {
  description = "Whether to create API Gateway"
  type        = bool
  default     = true
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


variable "authorization_scopes" {
  description = "Map of API gateway routes with scopes"
  type        = map(any)
  default     = {}

}



variable "authorization_type" {
  description = "What kind of authorization is expecting for Integrations"
  type        = string
  default     = "JWT"
}
variable "user_pool_tf_name" {
  description = "The name of the user pool for pool id"
  type        = string
  default     = ""
}

variable "cognito_app_client_names" {
  type        = list(string)
  description = "Api Clinets used to give permissions"
  default = ["PDP-P360", "PDP-PES"]
}
variable "routes_wihout_integrations" {
  description = "Map of API gateway routes with scopes"
  type        = map(any)
  default     = {}
}
