# Kubernetes Setup (1 master, N workers) using Vagrant

## Documentation

Refer this link for documentation: https://devopscube.com/kubernetes-cluster-vagrant/

## Prerequisites

1. Working Vagrant setup
2. 16 Gig + RAM workstation as the Vms use 4 vCPUS and 8+ GB RAM
3. VirtualBox v7.0.6 and above
4. Vagrant 2.4.0 and above

## Change Vagrant Directory

Create folder that you want to use for vagrant
Set the $VAGRANT_HOME variable to point to that folder

ex. For windows open the system environment variables and set the VAGRANT_HOME to point to the specified directory

## Box configuration

As the box is not present because most version control providers do not allow files as big as a vagrant box (1GB),
I will provide u the box hosted on Google Cloud through a link.

First, navigate to the directory `boxes/vbox-ubuntu`.
Download the box from the link:

- `https://drive.google.com/file/d/1scqAQ1FMp81kbWM_Y-8fxarW-1i1Xvj5/view?usp=sharing`

Make sure the box's relative path is `boxes\vbox-ubuntu\bento-ubuntu-22-04.box`.

## Bring Up the Cluster

To provision the cluster, execute the following commands.

```shell
git clone https://github.com/CodeMaster10000/k8s-cluster-vagrant.git
cd vagrant-k8s-cluster
vagrant up
```
## To shutdown the cluster and save the state, keep in mind dont use the vagrant halt command!

```shell
vagrant suspend
```

## To restart the cluster,

```shell
vagrant up
```

## To destroy the cluster,

```shell
vagrant destroy -f
```

## Installation guide

After having all the VM's up and running, you might want to access the kubectl cli.
Open an SSH Session with PuTTy or a similar tool.
- ip `10.0.0.101`
- user `root`
- password `vagrant`

execute the following commands:

- `kubectl get pods --all-namespaces` -> to verify the pods are being provisioned in the cluster
- `kubectl get nodes` -> to verify that all nodes are up and running

## Between restarts

When restarting the Virtual Machines, make sure to do the following:

1. vagrant up master
2. Wait 5 minutes, allowing k8s master to restart its essential pods/services
3. vagrant up (for the remaining worker nodes)  
