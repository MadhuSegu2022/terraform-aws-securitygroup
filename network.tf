
# module "vpc" {
#   source  = "app.terraform.io/AchieveGoals/vpc/aws"
#   version = "1.0.0"
#   vpc_info = {
#     cidr_block           = "192.168.0.0/16"
#     enable_dns_hostnames = true
#     tags = {
#       Name    = "simple-vpc"
#       Purpose = "AchieveGoals"
#     }
#   }
#   public_subnets = [{
#     cidr_block = "192.168.0.0/24"
#     az         = "ap-south-1a"
#     tags = {
#       Name = "public"
#     }
#   }]
#   private_subnets = [{
#     cidr_block = "192.168.1.0/24"
#     az         = "ap-south-1a"
#     tags = {
#       Name = "private"
#     }
#     }

#   ]

# }   


module "websg" {
  source = "git::https://github.com/asquarezone/LTTerraformModules.git//aws/securitygroup"
  vpc_id = "vpc-09386e4fb4b6995b3" # module.vpc.id
  security_group_info = {
    name        = "web"
    description = "this opens 80 and 22 port"
    inbound_rules = [{
      port        = 22
      protocol    = "tcp"
      source      = "0.0.0.0/0"
      description = "open ssh"
      }, {
      port        = 80
      protocol    = "tcp"
      source      = "0.0.0.0/0"
      description = "open http"
      }, {
      port        = 443
      protocol    = "tcp"
      source      = "0.0.0.0/0"
      description = "open https"
    }]
  }

}
