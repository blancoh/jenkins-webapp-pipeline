# jenkins-pipeline

Project Goals:

1) Create an Amazon VPC with 3 Public subnets for Nginx HTTP servers and 3 Private subnets for 3 Postgres Database servers. Todo: Postgres EC2 instances configuration.
2) Create an autoscaling group  Nginx HTTP servers in 3 availability zones with a Load Balancer (Default: Network) on port 80. Desired state: 3 VMs.
3) Destroy all EC2 instances, load balancers, gateways and eventually the entire Amazon VPC.

Extra files. Rename extension to .tf to use.

alb.tf-unused - Configuration for Application Load Balancer

elb.tf-unused - Configuration for Elastic Load Balancer
