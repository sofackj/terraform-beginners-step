#!/bin/bash
sudo hostnamectl hostname worker-node
sudo -i <<EOF
apt-get update -y
apt-get install vim htop curl
apt-get install gnupg2 lsb-release software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
add-apt-repository "deb https://apt.kubernetes.io/ kubernetes-xenial main"
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io
apt-get install -y kubelet=1.24.9-00 kubeadm=1.24.9-00 kubectl=1.24.9-00
apt-mark hold kubelet kubeadm kubectl
systemctl start docker
systemctl enable docker
EOF
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF
sudo -i <<EOF
sysctl --system
EOF
containerd config default | sudo tee /etc/containerd/config.toml
sudo -i <<EOF
sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml
systemctl restart containerd
EOF