resource "aws_instance" "ubuntu-server" {
  ami                         = data.aws_ami.ubuntu-1804.id
  instance_type               = "t2.micro"

  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true

  key_name                    = "CYBERSECURITY_EC2_PUB"

  vpc_security_group_ids      = [aws_security_group.allow-ssh.id, aws_security_group.allow-tcp.id, aws_security_group.egress-all.id]
  
  tags = {
    Name = "linux-vm"
  }
}

resource "aws_instance" "ubuntu-server-private" {
  ami                         = data.aws_ami.ubuntu-1804.id
  instance_type               = "t2.micro"

  subnet_id                   = aws_subnet.private.id
  associate_public_ip_address = false

  key_name                    = "CYBERSECURITY_EC2_PRIV"

  vpc_security_group_ids      = [aws_security_group.allow-ssh.id, aws_security_group.egress-all.id]
  
  tags = {
    Name = "linux-vm-private"
  }
}
