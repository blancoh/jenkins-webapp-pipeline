# jenkins-pipeline

Project Goals:

1) Create an Amazon VPC with 3 Public and 3 Private subnets.
2) Create an autoscaling group in 3 availability zones of Nginx HTTP servers with a Network Load Balancer on port 80. Desired state: 3 VMs.
3) Destroy all EC2 instances, load balancers, gateways and eventually the entire Amazon VPC.
