resource "oci_devops_build_pipeline_stage" "test_build_pipeline_stage" {
  #Required
  build_pipeline_id = oci_devops_build_pipeline.test_build_pipeline.id
  build_pipeline_stage_predecessor_collection {
    #Required
    items {
      #Required
      id = var.build_pipeline_stage_build_pipeline_stage_predecessor_collection_items_id
    }
  }
  build_pipeline_stage_type = var.build_pipeline_stage_build_pipeline_stage_type

  #Optional
  build_source_collection {

    #Optional
    items {
      #Required
      connection_type = var.build_pipeline_stage_build_source_collection_items_connection_type

      #Optional
      branch         = var.build_pipeline_stage_build_source_collection_items_branch
      # connection_id  = oci_devops_connection.test_connection.id
      name           = var.build_pipeline_stage_build_source_collection_items_name
      repository_id  = oci_devops_repository.test_repository.id
      repository_url = "https://devops.scmservice.us-ashburn-1.oci.oraclecloud.com/namespaces/'${var.tenancy_name}'/projects/'${oci_devops_project.test_project.name}'/repositories/'${oci_devops_repository.test_repository.name}"
    }
  }
  build_spec_file = var.build_pipeline_stage_build_spec_file

  deliver_artifact_collection {

    #Optional
    items {

      #Optional
      artifact_id   = oci_devops_deploy_artifact.test_deploy_artifact.id
      artifact_name = var.build_pipeline_stage_deliver_artifact_collection_items_artifact_name
    }
  }
  # deploy_pipeline_id                 = oci_devops_deploy_pipeline.test_deploy_pipeline.id
  display_name                       = var.build_pipeline_stage_display_name
  image                              = var.build_pipeline_stage_image
  #primary_build_source               = var.build_pipeline_stage_primary_build_source
  stage_execution_timeout_in_seconds = var.build_pipeline_stage_stage_execution_timeout_in_seconds
  wait_criteria {
    #Required
    wait_duration = var.build_pipeline_stage_wait_criteria_wait_duration
    wait_type     = var.build_pipeline_stage_wait_criteria_wait_type
  }
}