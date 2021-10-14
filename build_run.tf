resource "oci_devops_build_run" "test_build_run" {
  #Required
  build_pipeline_id = oci_devops_build_pipeline.test_build_pipeline.id

  #Optional
  display_name  = var.build_run_display_name
}