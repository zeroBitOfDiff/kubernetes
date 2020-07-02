#!/usr/bin/env bash
#
# ubuntu 20.04
echo kubectl get nodes
kubectl get nodes
echo
echo kubectl cluster-info
kubectl cluster-info
echo 
echo kubectl get all -o wide
kubectl get all -o wide
# echo starting dashboard
# minikube dashboard