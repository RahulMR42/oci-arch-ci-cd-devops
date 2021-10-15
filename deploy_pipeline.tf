/*
resource "oci_devops_deploy_environment" "test_environment" {
  display_name            = "test_oke_env"
  description             = "test oke based enviroment"
  deploy_environment_type = "OKE_CLUSTER"
  project_id              = oci_devops_project.test_project.id
  cluster_id              = var.create_new_oke_cluster ? oci_containerengine_cluster.oke_cluster[0].id : var.existent_oke_cluster_id
  #  cluster_id              = oci_containerengine_cluster.oke_cluster[0].id
  defined_tags = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}

#  Add var to choose between an existing Articat and an inline one

resource "oci_devops_deploy_artifact" "test_deploy_artifact" {
  argument_substitution_mode = var.argument_substitution_mode
  deploy_artifact_type       = var.deploy_artifact_type
  project_id                 = oci_devops_project.test_project.id

  deploy_artifact_source {
    deploy_artifact_source_type = var.deploy_artifact_source_type #INLINE,GENERIC_ARTIFACT_OCIR
    base64encoded_content       = file("${path.module}/manifest/nginx.yaml")
  }
  defined_tags = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}

resource "oci_devops_deploy_pipeline" "test_deploy_pipeline" {
  #Required
  project_id   = oci_devops_project.test_project.id
  description  = var.deploy_pipeline_description
  display_name = var.deploy_pipeline_display_name

  deploy_pipeline_parameters {
    items {
      name          = var.deploy_pipeline_deploy_pipeline_parameters_items_name
      default_value = var.deploy_pipeline_deploy_pipeline_parameters_items_default_value
      description   = var.deploy_pipeline_deploy_pipeline_parameters_items_description
    }
  }
  defined_tags = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
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
  display_name = var.deploy_stage_display_name

  kubernetes_manifest_deploy_artifact_ids = [oci_devops_deploy_artifact.test_deploy_artifact.id]
  namespace                               = var.deploy_stage_namespace
  oke_cluster_deploy_environment_id       = oci_devops_deploy_environment.test_environment.id
  defined_tags                            = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}
*/