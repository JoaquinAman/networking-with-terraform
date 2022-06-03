data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web_office2" {
  ami                         = data.aws_ami.ubuntu.id
  subnet_id                   = aws_subnet.public_subnet1_with_tf_joaquin_aman.id
  vpc_security_group_ids      = [aws_security_group.private.id]
  associate_public_ip_address = false
  key_name                    = aws_key_pair.deployer.key_name
  instance_type               = "t2.micro"
  tags = {
    Name = "ec2_office2_with_terraform_test_joaquin_aman"
  }
}
resource "aws_instance" "web_office1" {
  ami                         = data.aws_ami.ubuntu.id
  subnet_id                   = aws_subnet.private_subnet2_with_tf_joaquin_aman.id
  vpc_security_group_ids      = [aws_security_group.private.id]
  associate_public_ip_address = false
  key_name                    = aws_key_pair.deployer.key_name
  instance_type               = "t2.micro"
  tags = {
    Name = "ec2_office1_with_terraform_test_joaquin_aman"
  }
}
resource "aws_instance" "web_office3" {
  ami                         = data.aws_ami.ubuntu.id
  subnet_id                   = aws_subnet.private_subnet3_with_tf_joaquin_aman.id
  vpc_security_group_ids      = [aws_security_group.private.id]
  associate_public_ip_address = false
  key_name                    = aws_key_pair.deployer.key_name
  instance_type               = "t2.micro"
  tags = {
    Name = "ec2_office3_with_terraform_test_joaquin_aman"
  }
}
resource "aws_instance" "web_remoteoffice" {
  ami                         = data.aws_ami.ubuntu.id
  subnet_id                   = aws_subnet.remote_office_public_subnet4_with_tf_joaquin_aman.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.deployer.key_name
  instance_type               = "t2.micro"
  tags = {
    Name = "ec2_remote_office_with_terraform_test_joaquin_aman"
  }
}