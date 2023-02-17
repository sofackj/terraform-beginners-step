#!/bin/bash
sudo hostnamectl hostname hello-world
sudo -i <<EOF
apt-get update -y
apt-get install apache2 -y
EOF