#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
cd /var/www/html
aws s3 cp s3://dctlabs/index.txt ./
EC2AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone) 
sed "s/INSTANCE/the EC2 instance in $EC2AZ/" index.txt > index.html