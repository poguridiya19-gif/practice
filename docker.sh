#!/bin/bash
## extend volume 
sudo growpart /dev/nvme0n1 4
sudo lvextend -L +30G /dev/mapper/Root VG -VarVol
sudo xfs -growfs /var

## install docker
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
sudo docker-builds-plugin
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user