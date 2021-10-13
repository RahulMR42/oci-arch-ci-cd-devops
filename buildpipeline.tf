resource "oci_devops_build_pipeline" "test_build_pipeline" {
  #Required
  project_id = oci_devops_project.test_project.id

  #Optional
#   build_pipeline_parameters {
#     #Required
#     items {
#       #Required
#       name = var.build_pipeline_build_pipeline_parameters_items_name

#       #Optional
#       default_value = var.build_pipeline_build_pipeline_parameters_items_default_value
#       description   = var.build_pipeline_build_pipeline_parameters_items_description
#     }
#   }
  description   = var.build_pipeline_description
  display_name  = var.build_pipeline_display_name
}

