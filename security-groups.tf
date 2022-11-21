resource "aws_security_group" "allow-ssh" {
    name = "allow-ssh-sg"
    vpc_id = aws_vpc.main.id
    ingress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }
}

resource "aws_security_group" "allow-tcp" {
    name = "allow-tcp-sg"
    vpc_id = aws_vpc.main.id
    ingress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 8081
        to_port = 8081
        protocol = "tcp"
    }
}

resource "aws_security_group" "egress-all" {
    name = "egress-all-sg"
    vpc_id = aws_vpc.main.id
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}