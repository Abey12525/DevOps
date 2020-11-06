resource "aws_ebs_volume" "volume" {
    availability_zone = "us-east-1a"
    size = 10 
    tags = {
        Name = var.tag_name
        # Name = "IBM-DEVOPS-AH"
    }
}