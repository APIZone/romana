# The Romana Project

[Romana](https://romana.io) is a new [Software Defined Network (SDN)](http://romana.io/cloud/cloud_native_sdn/) solution
specifically designed for the Cloud Native architectural style. 
The result of this focus is that Romana cloud networks are less expensive to build, 
easier to operate and deliver higher performance than cloud networks built using alternative SDN designs.

# Code

This repository contains the installer and documentation.
The Romana source code, however, is contained in these repositories:

* [core](https://github.com/romana/core ): A number of micro services written in Go, which comprise the core components of the Romana system.
* [kube](https://github.com/romana/kube): The Romana CNI plugin and Network Policy Agents for Kubernetes
* [networking-romana](https://github.com/romana/networking-romana): The Romana ML2 plugin and IPAM driver for OpenStack

The READMEs of those repos contain more information about the source code and how to run and test it.

#  Installation

To get up and running with Romana, some scripts and Ansible playbooks have been provided to automate the setup and deployment.
It currently supports [Amazon EC2](https://aws.amazon.com/ec2/) instances and [Vagrant](https://www.vagrantup.com/) VMs,
integrated with either [Kubernetes](http://kubernetes.io) or [Devstack](http://docs.openstack.org/developer/devstack/).

* [Romana on AWS EC2 with Kubernetes](aws_kubernetes.md)
* [Romana on AWS EC2 with Devstack](aws_devstack.md)
* [Romana on Vagrant VMs with Kubernetes](vagrant_kubernetes.md)
* [Romana on Vagrant VMs with Devstack](vagrant_devstack.md)

Additional installation platforms are being targeted.
You can express your interest in specific platforms or get help with manually installing Romana by [contacting us](#contact-us).

# Using Romana

Now that Romana is installed, choose your stack type below for more information on what you can do.

* [Romana with Kubernetes](kubernetes_romana.md)
* [Romana with Devstack](devstack_romana.md)

# Contact Us

There are a number of ways in which you can contact us if you have any questions about deploying or using Romana,
or about contributing to our code.

* By email: [info@romana.io](mailto:info@romana.io)
* Via our [Romana developer mailing list](https://groups.google.com/forum/?hl=en#!forum/romana-dev)
* Via our [Romana user mailing list](https://groups.google.com/forum/?hl=en#!forum/romana-user)
* On the [Romana Slack channel](https://romana.slack.com/). Please note that you will need an invite for this channel. Please contact us [by email](mailto:info@romana.io) to request an invite
