# oci-arch-ci-cd-devops

Rapid delivery of software is essential for efficiently running your applications in the cloud. Oracle DevOps service provides a continuous integration and deployment (CI/CD) platform for developers. You can use the DevOps service to easily build, test, and deploy software and applications on Oracle Cloud. The service also provides a private Git repositories to store your code and supports connections to external code repositories.

In this reference architecture, you will build and test a sample Node.js web application and then deploy it to OKE by using the OCI DevOps service. The application source code is hosted on a DevOps code repository. The end user commits the code into the code repository, which triggers the start of a build pipeline.

The build pipeline follows a user-defined flow to build and test software, then create a container image of the latest version of the application. The output of the build is stored in the container registry as an image. Then a deployment pipeline uses the built image from the container registry and a Kubernetes manifest to deploy the most recent version of the application to OKE.

For details of the architecture, see [Build a continuous integration and deployment pipeline using Oracle DevOps service](https://docs.oracle.com/en/solutions/ci-cd-pipe-oci-devops/index.html)

## Terraform Provider for Oracle Cloud Infrastructure
The OCI Terraform Provider is now available for automatic download through the Terraform Provider Registry. 
For more information on how to get started view the [documentation](https://www.terraform.io/docs/providers/oci/index.html) 
and [setup guide](https://www.terraform.io/docs/providers/oci/guides/version-3-upgrade.html).

* [Documentation](https://www.terraform.io/docs/providers/oci/index.html)
* [OCI forums](https://cloudcustomerconnect.oracle.com/resources/9c8fa8f96f/summary)
* [Github issues](https://github.com/terraform-providers/terraform-provider-oci/issues)
* [Troubleshooting](https://www.terraform.io/docs/providers/oci/guides/guides/troubleshooting.html)


## Deploy Using the Terraform CLI

### Clone the Module

Now, you'll want a local copy of this repo. You can make that with the commands:

    git clone https://github.com/oracle-quickstart/oci-arch-ci-cd-devops
    cd oci-arch-ci-cd-devops
    ls

## Prerequisites
First off, you'll need to do some pre-deploy setup.  That's all detailed [here](https://github.com/cloud-partners/oci-prerequisites).

Secondly, create a `terraform.tfvars` file and populate with the following information:

```
# Authentication
tenancy_ocid         = "<tenancy_ocid>"
user_ocid            = "<user_ocid>"
fingerprint          = "<finger_print>"
private_key_path     = "<pem_private_key_path>"

# Region
region = "<oci_region>"

# Compartment
compartment_ocid = "<compartment_ocid>"

# OCI User Authtoken
oci_user_authtoken = "<oci_user_authtoken>" # for accessing artifact repository

````

Deploy:

    terraform init
    terraform plan
    terraform apply


## Access the application
You can go to created OKE cluster, click on `Access Cluster`, launch `Cloud Shell`, run `kubeconfig` create command in cloud shell. 

Next, run the below command.

    `kubectl -n example get services` 

- where `example` is the namespace for the cluster. You should be able to copy the `EXTERNAL-IP` and paste it on the browser to access the Node.JS application.

## Destroy the Deployment
When you no longer need the deployment, you can run this command to destroy it:

    terraform destroy


