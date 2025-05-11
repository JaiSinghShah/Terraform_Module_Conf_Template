vpc_cidr      = "10.0.0.0/16"                     # ✅ Valid private CIDR block for a VPC
ami_id        = "ami-0e35ddab05955cf57"           # ✅ AMI ID (make sure it's valid in your target AWS region)
instance_type = "t2.micro"                    	  # ✅ Free-tier eligible EC2 instance type
bucket_name   = "Terraform_Module_Conf_Template"  # ✅ Valid name, but must be globally unique