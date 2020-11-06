resource "aws_volume_attachment" "attach_volumet" {
    device_name = "/dev/xvdb"
    volume_id = aws_ebs_volume.volume.id 
    instance_id = aws_instance.centos_server.id    
}