// subnet ids
data "aws_subnet_ids" "default_subnets" {
  vpc_id = aws_default_vpc.default.id
}

// ami data provider
data "aws_ami" "latest_aws_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}

// get the latest ami ids
data "aws_ami_ids" "latest_aws_linux_2_ids" {
  owners = ["amazon"]
}

// all subnets in my vpc: used [3]
// "subnet-03f0d4627c28d93a5",
//     "subnet-0428964266359d859",
//     "subnet-04f6a60a30948f1e6",
//     "subnet-0c67b531e5978edbf",
//     "subnet-0c8ce74c7b2fabe43",
//     "subnet-0da27d6f646e6b6ad",