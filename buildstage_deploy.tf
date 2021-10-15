resource "oci_devops_build_pipeline_stage" "test_deploy_stage" {

  depends_on = [oci_devops_build_pipeline_stage.test_deliver_artifact_stage]

  #Required
  build_pipeline_id = oci_devops_build_pipeline.test_build_pipeline.id

  build_pipeline_stage_predecessor_collection {
    #Required
    items {
      #Required
      id = oci_devops_build_pipeline_stage.test_deliver_artifact_stage.id
    }
  }
  
  build_pipeline_stage_type = var.build_pipeline_stage_deploy_stage_type

  deploy_pipeline_id                 = oci_devops_deploy_pipeline.test_deploy_pipeline.id
  display_name                       = var.deploy_stage_display_name
}