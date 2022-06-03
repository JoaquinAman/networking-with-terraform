Networking with Terraform

DevOps JalaSoft Bootcamp

This is a terraform project. The code builds in AWS a VPC,with 4 subnets (1 of them is public), each of them with an EC2 instance. Others components from the VPC applied here are: Route Tables, Internet Gateway, Route Table Association.

Subnetting Requirements for this project:
* Hosts: need - total
* Network: 650 - 4096 -> 192.168.0.0/20
* Office 2: 500 - 512 -> 192.168.0.0/23      |   SUBNET 2
* Office 1: 80 - 128 -> 192.168.2.0/25       |   SUBNET 1
* Office 3: 40 - 64 -> 192.168.2.128/26      |   SUBNET 3
* Remote Office: 30 - 64 -> 192.168.2.192/26 |   SUBNET 4


ip adress	    first adress	last host		braoadcast	    subnet	
192.168.0.0	    192.168.0.4		192.168.1.254	192.168.1.255	192.168.0.0/23	
192.168.2.0	    192.168.2.4		192.168.2.126	192.168.2.127	192.168.2.0/25	
192.168.2.128	192.168.2.132	192.168.2.190	192.168.2.191	192.168.2.128/26	
192.168.2.192	192.168.2.196   192.168.2.254	192.168.2.255	192.168.2.192/26

Terraform Structure:
-Provider.tf file : Its were we set the Provider that will build our VPC, setting the zone where it will be ( us-east-2 ).
-Main.tf file : Where the Subnets are defined, besides the Internet Gateway, The Route and Association Tables.
-Ec2.tf file : Definition of each EC2, heading to its corresponding Subnet and Security Group.
-Security.tf file: Where Security Groups are declared: A private one to which the private subnets are pointing and a public one to which the public subnet is pointing.
-Dockerfile file: To ensure that every User can get the same Development Enviroment in case of needs

Build instructions:
-You need your own aws keys.
-Clone this code.
-Reopen the project in the Container when VStudio prompt for it
-In terminal: terraform plan -out joacoVPC.tfplan
-In terminal apply joacoVPC.tfplan
-Log in into AWS. And you will be able to see the VPC, subnets, EC2...
-Move to the folder where you have the KP.pem open a Linux terminal and use next command:  ssh -i "JoaquinAman-KP.pem" ubuntu@3.23.60.207
-You are connected to the Office4 EC2 (public subnet)
-To check communication with private EC2, you will need to check their private IP's on AWS, and enter the command $ping "private_ip" on your console
