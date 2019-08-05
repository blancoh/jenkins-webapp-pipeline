# jenkins-pipeline

Project Goals:

1) Create an Amazon VPC with 3 Public subnets and 3 Private subnets. 
2) Create an autoscaling group of Web servers in public subnet with network (nlb) load Balancer for port 80.    Desired state: 3 VMs.
3) Todo: Create a 3 node MySQL Galera cluster in the private subnets with an internal load balancer.
4) Destroy all EC2 instances, load balancers, subnets, gateways and eventually the entire Amazon VPC.

Requirements:

Jenkins - https://jenkins.io/

Jenkins Pipeline plugin - https://wiki.jenkins.io/display/JENKINS/Pipeline+Plugin

Jenkins GIT plugin - https://wiki.jenkins.io/display/JENKINS/Git+Plugin

Jenkins CloudBees AWS Credentials plugin - https://wiki.jenkins.io/display/JENKINS/CloudBees+AWS+Credentials+Plugin

Terraform - https://www.terraform.io/downloads.html

Extra files. Rename extension to .tf to use.

alb.tf-unused - Configuration for Application Load Balancer

elb.tf-unused - Configuration for Elastic Load Balancer
