## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_devops_repository" "test_repository" {
  #Required
  name       = var.repository_name
  project_id = oci_devops_project.test_project.id

  #Optional
  default_branch = var.repository_default_branch
  description    = var.repository_description

  repository_type = var.repository_repository_type
}


resource "null_resource" "clonerepo" {

  depends_on = [oci_devops_project.test_project, oci_devops_repository.test_repository]

  provisioner "local-exec" {
    command = "echo '(1) Cleaning local repo: '; rm -rf ${oci_devops_repository.test_repository.name}"
  }

  provisioner "local-exec" {
    command = "echo '(2) Repo to clone: https://devops.scmservice.${var.region}.oci.oraclecloud.com/namespaces/${var.tenancy_name}/projects/${oci_devops_project.test_project.name}/repositories/${oci_devops_repository.test_repository.name}'"
  }

  provisioner "local-exec" {
    command = "echo '(3) Preparing git-askpass-helper script... '; current_dir=$(PWD); chmod +x $current_dir/git-askpass-helper.sh"
  }

  provisioner "local-exec" {
    command = "echo '(4) Starting git clone command... '; current_dir=$(PWD); export GIT_ASKPASS=$current_dir/git-askpass-helper.sh; export GIT_PASSWORD=${var.oci_user_authtoken} ; git clone https://devops.scmservice.${var.region}.oci.oraclecloud.com/namespaces/${var.tenancy_name}/projects/${oci_devops_project.test_project.name}/repositories/${oci_devops_repository.test_repository.name}"
  }

  provisioner "local-exec" {
    command = "echo '(5) Finishing git clone command: '; ls -latr ${oci_devops_repository.test_repository.name}"
  }

}

#resource "null_resource" "clonefromgithub" {
#  provisioner "local-exec" {
#    command = "git clone ${var.git_repo}"
#  }
#}


resource "null_resource" "copyfiles" {

  depends_on = [null_resource.clonerepo]

  provisioner "local-exec" {
    command = "rsync -a --exclude='.*' ./${var.git_repo_name}/ ./${oci_devops_repository.test_repository.name}/"
  }
}


resource "null_resource" "pushcode" {

  depends_on = [null_resource.copyfiles]

  provisioner "local-exec" {
    command = "cd ./${oci_devops_repository.test_repository.name}; git add .; git commit -m 'added latest files'; git push origin main"
  }
}
