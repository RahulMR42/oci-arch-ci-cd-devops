## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_devops_deploy_environment" "test_environment" {

  display_name            = "oke_environment_${random_id.tag.hex}"
  description             = "oke based enviroment"
  deploy_environment_type = "OKE_CLUSTER"
  project_id              = oci_devops_project.test_project.id
  cluster_id              = module.oci-oke[0].cluster.id
}

#  Add var to choose between an existing Articat and an inline one

resource "oci_devops_deploy_artifact" "test_deploy_oke_artifact" {
  argument_substitution_mode = var.deploy_artifact_argument_substitution_mode
  deploy_artifact_type       = var.deploy_artifact_type
  project_id                 = oci_devops_project.test_project.id

  deploy_artifact_source {
    deploy_artifact_source_type = var.deploy_artifact_source_type #INLINE,GENERIC_ARTIFACT_OCIR
    base64encoded_content       = file("${path.module}/manifest/gettingstarted-manifest.yaml")
  }
}

resource "oci_devops_deploy_pipeline" "test_deploy_pipeline" {
  #Required
  project_id   = oci_devops_project.test_project.id
  description  = var.deploy_pipeline_description
  display_name = "devops-oke-pipeline_${random_id.tag.hex}"

  deploy_pipeline_parameters {
    items {
      name          = var.deploy_pipeline_deploy_pipeline_parameters_items_name
      default_value = var.deploy_pipeline_deploy_pipeline_parameters_items_default_value
      description   = var.deploy_pipeline_deploy_pipeline_parameters_items_description
    }
  }
}

resource "oci_devops_deploy_stage" "test_deploy_stage" {
  #Required
  deploy_pipeline_id = oci_devops_deploy_pipeline.test_deploy_pipeline.id
  deploy_stage_predecessor_collection {
    #Required
    items {
      #Required - firt statge has the predecessor ID as pipeline ID
      id = oci_devops_deploy_pipeline.test_deploy_pipeline.id
    }
  }
  deploy_stage_type = var.deploy_stage_deploy_stage_type


  description  = var.deploy_stage_description
  display_name = "deploy_to_OKE_${random_id.tag.hex}"

  kubernetes_manifest_deploy_artifact_ids = [oci_devops_deploy_artifact.test_deploy_oke_artifact.id]
  #namespace                               = var.deploy_stage_namespace
  oke_cluster_deploy_environment_id = oci_devops_deploy_environment.test_environment.id
}

/*
resource "oci_devops_deployment" "test_deployment1" {
  count      = var.execute_deployment ? 1 : 0
  depends_on = [oci_devops_deploy_stage.test_deploy_stage]
  #Required
  deploy_pipeline_id = oci_devops_deploy_pipeline.test_deploy_pipeline.id
  deployment_type    = "PIPELINE_DEPLOYMENT"

  #Optional
  display_name = "devopsdeployment_${random_id.tag.hex}"
}
*/
