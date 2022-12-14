resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "CYBERSECURITY_RTB"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rtb.id
}

resource "aws_route_table" "rtb-ngw" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "CYBERSECURITY_RTB_NGW"
  }
}

resource "aws_route_table_association" "rta-ngw" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.rtb-ngw.id
}
