#!/usr/bin/env bash
#
# ubuntu 20.04
egrep '^flags.*(vmx|svm)' /proc/cpuinfo || (echo enable CPU virtualization support and try again && exit 9)

# install KVM software
echo installing kvm
sudo apt install -y qemu qemu-kvm libvirt-daemon bridge-utils virt-manager virtinst
sudo systemctl enable libvirtd --now
sudo systemctl status libvirtd.service

# install kubectl
echo installing kubectl
snap install kubectl --classic
kubectl version --client

# install minikube
echo installing minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube

sudo mv minikube /usr/local/bin

echo at this point, reboot. After reboot, manually run as non-root
echo minikube start --memory 4096 --vm-driver=kvm2echo also use usermod -aG libvirt $USER where $USER is the name of the user that is going to start minikube