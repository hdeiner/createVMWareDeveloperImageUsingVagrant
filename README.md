# A More Proper DevOps Treatment of Development Environments

We have a crisis with development environments 
for many corporate settings.  Either they are 
centrally managed, with developers at the mercy 
of ticketing systems to grant them access to tools
that they need to do their jobs (lack of even "local 
admin"), or they are left
to their own devices to try to get their work done.

I propose we aid developers get started, yet promote
self determinism for environments.  What makes
sense is a virtual machine environment, where
developers are masters of their environment, yet 
are given pre-provisioned virtual machines to
get them started.  This project demonstrates
that concept.

## The General Flow

I use macOS 10.14.1 currently.  Some people
prefer Windows machines.  No matter.  I will
provision Unbuntu virtual machines that are usable
in either setting.  I will create and provision
these machines using Vagrant for my VMWare Fusion
environment.  Vagrant works from your host and
can command the virtual environment to respond
to your commands, so the virtual environment can 
be setup perfectly every single time.  We will
then take the virtual machine artifact and use
it as our development environment under VMWare.

## Getting Started to Use This Project

* You first will need to install VMWare.  I use
Fusion.  If you're on a Windows environment,
you will want to use VMWare Workstation.  You 
could probably get away with VMWare Player.
* You will now need to download and install 
Vagrant.  Start at https://www.vagrantup.com/downloads.html
* Vagrant needs a provider of virtual services.
Vagrant uses VirtualBox by default.  However,
VMWare seems to be much more robust, and I wouldn't
do business without it.  In theory, you can change
providers and start provisioning any other 
virtualization provider.  AWS EC2 machines, 
for instance.  First, install the VMWAre 
Utility from https://www.vagrantup.com/vmware/downloads.html.  
Then 
 ```bash
 vagrant plugin install vagrant-vmware-desktop
 vagrant plugin license vagrant-vmware-desktop ~/license.lic [wherever the license is...]
 ```
* Create the artifact for Fusion to run
```bash
vagrant up
```
* Note: the last thing that the provision script
is a "shutdown".  This causes Vagrant to lose contact
with the virtual machine, which leads to a command
line error such as:
```bash
The SSH command responded with a non-zero exit status. Vagrant
assumes that this means the command failed. The output for this command
should be in the log above. Please read the output to determine what
went wrong.
```
* At this point, you can use the virtual machine
directly in VMWare Fusion.  You may want to 
take control away from Vagrant, so the artifact
can be used by others (those people that do not
want to run Vagrant, for example).  This is easily 
done.  For example, on my machine, and for this
run, execute the following two commands to allow
the virtual machine to be "forked":
```bash
mkdir ~/Virtual\ Machines/ubuntu-16.04.vmwarerm
cp -R .vagrant/machines/default/vmware_desktop/faf0cb49-2af2-479e-92a2-beb126cfb0cc/* ~/Virtual\ Machines/ubuntu-16.04.vmwarerm/.

```

## TODO
* Change the userid and password from vagrant/vagrant
to whatever the user wants