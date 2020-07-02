#!/bin/bash
#
# ubuntu 20.04
egrep '^flags.*(vmx|svm)' /proc/cpuinfo || (echo enable CPU virtualization support and try again && exit 9)

# install KVM software

# install kubectl