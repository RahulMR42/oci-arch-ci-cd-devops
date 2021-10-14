resource "oci_devops_build_pipeline" "test_build_pipeline" {
  #Required
  project_id = oci_devops_project.test_project.id

  
  description   = var.build_pipeline_description
  display_name  = var.build_pipeline_display_name
}

