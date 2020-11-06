resource "aws_instance" "centos_server"{
    ami = "ami-030ff268bd7b4e8b5"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    # count = 1

    tags = { 
        Name = var.tag_name
        # Name = "IBM-DEVOPS-AH"
    }

    security_groups = [
        aws_security_group.centos_server_sg_group.name 
    ]

    provisioner "local-exec" {
        command = "echo self.public_ip > public_ip.txt"
    }

    provisioner "remote-exec" {
        connection {
            type = "ssh"
            user = "root"
            password = "thinknyx@123"
            # password = "testing"
            host = self.public_ip  
        }
        inline = [
            "df -h",
            "apt-get update",
            "mkfs -t ext4 /dev/xvdb",
            "mkdir /opt/app", 
            "mount /dev/xvdb /opt/app",
            "df -h"
        ]
    }
    
}
