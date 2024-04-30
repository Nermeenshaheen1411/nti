#!/bin/bash
sudo apt update && sudo apt upgrade -y
wget -O /etc/apt/sources.list.d/jenkins.list https://pkg.jenkins.io/debian-stable/jenkins.io-2023.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D50582E6B754BE0B
sudo apt update
sudo apt install openjdk-17-jre -y
sudo apt install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword