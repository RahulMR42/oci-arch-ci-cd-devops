## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "tenancy_name" {}
variable "compartment_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}


variable "release" {
  description = "Reference Architecture Release (OCI Architecture Center)"
  default     = "1.1"
}

variable "project_logging_config_retention_period_in_days" {
  default = 30
}

variable "project_description" {
  default = "DevOps CI/CD Sample Project"
}


variable "build_pipeline_description" {
  default = "build pipeline for Node.JS application"
}

variable "build_pipeline_display_name" {
  default = "NodeJS-build-pipeline"
}

variable "repository_name" {
  default = "nodejs"
}

variable "repository_default_branch" {
  default = "main"
}

variable "repository_description" {
  default = "nodejs sample application"
}

variable "git_repo" {
  default = "https://github.com/KartikShrikantHegde/oci-devops-node-express"  
}

variable "git_repo_name" {
  default = "oci-devops-node-express"
}

variable "build_pipeline_stage_build_pipeline_stage_predecessor_collection_items_id" {
  default = "id"
}

variable "build_pipeline_stage_build_pipeline_stage_type" {
  default = "BUILD"
}

variable "build_pipeline_stage_deliver_artifact_stage_type" {
   default = "DELIVER_ARTIFACT"   
}

variable "build_pipeline_stage_build_source_collection_items_branch" {
  default = "main"
}

variable "build_pipeline_stage_build_source_collection_items_connection_type" {
  default = "DEVOPS_CODE_REPOSITORY"
}

variable "build_pipeline_stage_build_source_collection_items_name" {
  default = "node_express"
}

variable "build_pipeline_stage_build_spec_file" {
  default = ""
}

variable "build_pipeline_stage_deliver_artifact_collection_items_artifact_name"{
  default = "output01"
}

variable "deliver_artifact_stage_display_name" {
  default = "deliver-artifact"
}

variable build_pipeline_stage_display_name{
  default = "nodejs-build-pipeline"
}

variable "build_pipeline_stage_image" {
  default = "OL7_X86_64_STANDARD_10"
}

variable "build_pipeline_stage_wait_criteria_wait_duration" {
  default = "waitDuration"
}

variable "build_pipeline_stage_wait_criteria_wait_type" {
  default = "ABSOLUTE_WAIT"
}

variable "build_pipeline_stage_stage_execution_timeout_in_seconds" {
  default = 36000
}

variable "registry_display_name" {
  default = "node-express-getting-starter"
}

variable "container_repository_is_public" {
  default = true
}

variable "deploy_artifact_argument_substitution_mode" {
  default = "NONE"
}

variable "deploy_artifact_display_name"{
  default = "node-express-getting-starter"
}

variable "ocir_region"{
  default = "iad"
}

variable "deploy_artifact_deploy_artifact_source_deploy_artifact_source_type" {
  default = "OCIR"
}

variable "deploy_artifact_deploy_artifact_type" {
  default = "DOCKER_IMAGE"
}

variable "repository_repository_type" {
  default = "HOSTED"
}

variable build_run_display_name{
  default = "run-build"
}

# variable "build_hash_variable" {
#   default = "${BUILDRUN_HASH}"
# }


