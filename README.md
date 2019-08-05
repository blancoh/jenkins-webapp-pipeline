# jenkins-pipeline

Project Goals:

1) Create an Amazon VPC with 3 Public subnets and 3 Private subnets. 
2) Create an autoscaling group of Web servers with a Load Balancer for port 80. Desired state: 3 VMs.
3) Destroy all EC2 instances, load balancers, gateways and eventually the entire Amazon VPC.

Requirements:
Jenkins - https://jenkins.io/
Jenkins Pipeline plugin - https://wiki.jenkins.io/display/JENKINS/Pipeline+Plugin
Jenkins GIT plugin - https://wiki.jenkins.io/display/JENKINS/Git+Plugin
Terraform - https://www.terraform.io/downloads.html
AWS CLI - https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

Extra files. Rename extension to .tf to use.

alb.tf-unused - Configuration for Application Load Balancer

elb.tf-unused - Configuration for Elastic Load Balancer
