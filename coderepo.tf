resource "oci_devops_repository" "test_repository" {
  #Required
  name       = var.repository_name
  project_id = oci_devops_project.test_project.id

  #Optional
  default_branch = var.repository_default_branch
  description    = var.repository_description
    
  #repository_type = var.repository_repository_type
}


resource "null_resource" "clonerepo" {

  depends_on = [oci_devops_project.test_project, oci_devops_repository.test_repository]

  provisioner "local-exec" {
    command = "git clone https://devops.scmservice.us-ashburn-1.oci.oraclecloud.com/namespaces/'${var.tenancy_name}'/projects/'${oci_devops_project.test_project.name}'/repositories/'${oci_devops_repository.test_repository.name}'"
  }
}


resource "null_resource" "clonefromgithub" {
  provisioner "local-exec" {
    command = "git clone '${var.git_repo}'"
  }
}


resource "null_resource" "copyfiles" {

  depends_on = [null_resource.clonerepo]

  provisioner "local-exec" {
    command = "rsync -a --exclude='.*' ./'${var.git_repo_name}'/ ./'${oci_devops_repository.test_repository.name}'/"
  }
}


resource "null_resource" "pushcode" {

  depends_on = [null_resource.copyfiles]  
  
  provisioner "local-exec" {
    command = "cd ./'${oci_devops_repository.test_repository.name}'; git add .; git commit -m 'added latest files'; git push origin main"
  }
}