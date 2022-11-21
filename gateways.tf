resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "CYBERSECURITY_IGW"
  }
}

resource "aws_nat_gateway" "ngw" {
  subnet_id     = aws_subnet.public.id
  connectivity_type = "public"

  allocation_id = "eipalloc-03134d30b14cbecca"

  tags = {
    Name = "CYBERSECURITY_NG"
  }

  depends_on = [aws_internet_gateway.gw]
}
