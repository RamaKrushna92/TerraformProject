# TerraformProject

*Intro:
-------
    
    * Terraform is an Open source HashiCorp IaC tool, used to provision the resources on cloud infrastructure.
    * Terraform can manage low-level components like compute, storage, and networking resources, as well as high-level components like DNS entries and SaaS features.

![Workflow Diagram](https://github.com/RamaKrushna92/TerraformProject/blob/main/Screenshot%202024-08-13%20114537.png)

*Project Workflow:
------------------

* In this Project we are going to Create Below Servcies using terraform like:
    * VPC, 
    * Internet Gateway, 
    * Subnets, 
    * Security Group, 
    * ec2 instances.

*As shown in the above:
-----------------------

* Written the terraform code using the editor vscode, Created the aws vpc and subnets.
	* Created the Security Group, including the ports 22 and 80 to allow SSH and HTTP
	* Pushes that code in to Github for Tracking the changes.
	* Configure the Jenkins Freestyle job and Tested the terraform code.

*Project Pre Requisites:
------------------------

    * Create S3 Bucket to store the statefile in remote.
    * Spin up aws ec2 instance, install Jenkins and Terraform.
    * Go to manage Jenkins, plugins and install AWS credentials to secure the ACCESS and Secret Keys.
    * Configure the Git in Jenkins
    * Create Jenkins freestyle Job, clone the repo.
