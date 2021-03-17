# jenkins-webapp-pipeline

Project Goals:

1) Create an Amazon VPC with 3 public subnets and 3 private subnets. 
2) Create an autoscaling group of 3 Web servers in public subnets with network (nlb) load Balancer for HTTP port tcp/80.
3) Todo: Create a 3 node MySQL Galera cluster in the private subnets with an internal load balancer.
4) Destroy the entire Amazon VPC when finished.

Requirements:

Jenkins - https://jenkins.io/

Jenkins Pipeline plugin - https://wiki.jenkins.io/display/JENKINS/Pipeline+Plugin

Jenkins GIT plugin - https://wiki.jenkins.io/display/JENKINS/Git+Plugin

Jenkins CloudBees AWS Credentials plugin - https://wiki.jenkins.io/display/JENKINS/CloudBees+AWS+Credentials+Plugin

Terraform - https://www.terraform.io/downloads.html

Extra files. Rename extension to .tf to use.

alb.tf-unused - Configuration for Application Load Balancer

elb.tf-unused - Configuration for Elastic Load Balancer
