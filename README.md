## Overview

This project consist of various Ansible playbooks to setup internal Kubernetes cluster along with some base apps.

## Setup

This project is a container i.e. individual components are git projects themselves and referred here as git submodules.

__So make sure to clone this project recursively and follow relevant submodules specific commands to fetch new information of the submodule projects.__

![Read more on how to work with submodules](https://github.com/blog/2104-working-with-submodules).

## Component Briefs

Short overview of individual component. For more details check each submodule project's README.md

### kubespray

Bunch of Ansible playbooks to setup a highly available Kubernetes(K8S) cluster

### haproxy

Ansible playbook to setup an external load balancer required to route requests to a multi-master K8S setup

### lv-extend

Ansible playbook to extend logical volumes of the nodes of cluster as additional disc is attached

### mitm-cert-push

Ansible playbook to setup MITM certifcates in the nodes of the cluster for remote requests to not fail during n/w operations

### rook-cluster

Ansible playbook to setup a Rook Cluster in an already available K8S cluster

## Adding a new node to the cluster

In case of a new node is added to an existing cluster, before running the Kubespray playbooks to make the same information available to K8S cluster following steps need to be done:

- Run the `mitm-cert-push` playbook to ensure that MITM certficates are added to the certificate chain of the new node(s)
- Run the `lv-extend` playbook to extend the filesystem for the attached additional storage disc


