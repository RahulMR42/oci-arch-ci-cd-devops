## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_artifacts_container_repository" "test_container_repository" {
  #Required
  compartment_id = var.compartment_ocid
  display_name   = var.registry_display_name

  #Optional
  is_public = var.container_repository_is_public
}

resource "oci_devops_deploy_artifact" "test_deploy_artifact" {

  #depends_on = [oci_devops_project.test_project, oci_devops_repository.test_repository]

  #Required
  argument_substitution_mode = var.deploy_artifact_argument_substitution_mode
  deploy_artifact_source {
    #Required
    deploy_artifact_source_type = var.deploy_artifact_deploy_artifact_source_deploy_artifact_source_type

    #Optional
    image_uri     = "${var.ocir_region}.ocir.io/${var.tenancy_name}/${var.deploy_artifact_display_name}:$${BUILDRUN_HASH}"
    image_digest  = " "
    repository_id = oci_devops_repository.test_repository.id
  }

  deploy_artifact_type = var.deploy_artifact_deploy_artifact_type
  project_id           = oci_devops_project.test_project.id

  #Optional
  display_name = var.deploy_artifact_display_name
}
