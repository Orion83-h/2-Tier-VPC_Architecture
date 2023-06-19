# allocate elastic ip. this eip will be used for the nat-gateway in public subnet az1 
resource "aws_eip" "eip_for_nat_gateway_az1" {
  domain = "vpc"

  tags = {
    Name = "eip-az1"
  }
}
# create nat gateway & attache to public subnet az1
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip_for_nat_gateway_az1.id
  subnet_id     = aws_subnet.public_1a.id

  tags = {
    Name = "test_nat"
  }
}
