#!/bin/bash

apt-get update
apt-get upgrade -y

mkdir src
cd src
git clone https://github.com/johnny555/krytn_cafe

cd ..
source /opt/ros/foxy/local_setup.bash
rosdep update
rosdep install --from-paths src --ignore-src -y -r

# Create user ros, and allow it to install stuff. 
adduser --disabled-password --gecos "docker user" ros
echo 'ros ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ros && chmod 0440 /etc/sudoers.d/ros
chown -R ros /workspace

# Get python deps

sudo apt install python3-pip
pip install black

# Make it so that sourcing happens automatically
echo "source /opt/ros/foxy/setup.bash" >> /home/ros/.bashrc
echo "source /workspace/install/setup.bash" >> /home/ros/.bashrc