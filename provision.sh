#!/bin/bash -x
sudo apt-get -qq update
sudo apt-get install -qq -y software-properties-common
sudo apt-get -qq -y install gnome-core
#java8 (should work for 6/7/8/9)
sudo apt-get install -qq -y python-software-properties debconf-utils
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -qq update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
# internal curl chatter on the oracle-java8-installer is difficult to remove - sorry
sudo apt-get install -qq -y oracle-java8-installer
#git
sudo apt-get install -qq -y git
#docker
sudo apt-get install -qq -y curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -qq
sudo apt-get install -qq -y docker-ce
#maven
sudo apt-get install -qq -y maven
#intellij
sudo apt install -qq -y libcanberra-gtk-module libcanberra-gtk3-module
wget -q https://download.jetbrains.com/idea/ideaIC-2018.2.6-no-jdk.tar.gz
sudo tar -xf ideaIC-2018.2.6-no-jdk.tar.gz -C /opt/
sudo ln -s /opt/idea*/bin/idea.sh /usr/local/sbin/intellij
shutdown now
