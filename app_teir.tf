# # Private Subnet Definition (No Overlapping CIDR Blocks)
# resource "aws_subnet" "private_subnet" {
#   count             = length(var.private_subnet_cidr_blocks)
#   vpc_id            = aws_vpc.go_green_vpc.id
#   cidr_block        = element(var.private_subnet_cidr_blocks, count.index)
#   availability_zone = element(var.vpc_availability_zones, count.index)

#   tags = {
#     Name = "GoGreen-Private-Subnet-${count.index + 1}"
#   }
# }

# # Variables for Private Subnets
# variable "private_subnet_cidr_blocks" {
#   description = "CIDR blocks for private subnets."
#   type        = list(string)
#   default     = ["10.0.3.0/24", "10.0.4.0/24"]
# }

# # Launch Template for App Tier
# resource "aws_launch_template" "app" {
#   name_prefix   = "app-tier-"
#   image_id      = "ami-047d7c33f6e7b4bc4"
#   instance_type = "t2.micro"

#   network_interfaces {
#     associate_public_ip_address = false
#     subnet_id                   = aws_subnet.private_subnet[0].id
#     security_groups             = [aws_security_group.app_sg.id]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# # Auto Scaling Group for App Tier
# resource "aws_autoscaling_group" "app_asg" {
#   launch_template {
#     id      = aws_launch_template.app.id
#     version = "$Latest"
#   }

#   min_size         = 2
#   max_size         = 6
#   desired_capacity = 2

#   vpc_zone_identifier = aws_subnet.private_subnet[*].id

#   health_check_type         = "ELB"
#   health_check_grace_period = 300
# }
