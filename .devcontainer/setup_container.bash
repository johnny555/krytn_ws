#!/bin/bash

# Add kisak-mesa for gazebo hotfixes. https://github.com/gazebosim/gz-sim/issues/920
add-apt-repository ppa:kisak/kisak-mesa

apt-get update
apt-get upgrade -y
apt install mesa-utils

# ------------------------------------------------------
# Now download and install openvdb so STVL plugin works. 
# https://github.com/SteveMacenski/spatio_temporal_voxel_layer/issues/232
# ------------------------------------------------------
mkdir openvdb
cd openvdb

wget https://github.com/wyca-robotics/openvdb/releases/download/v8.2.0-debian/libopenvdb-dev_8.2.0-1-wyca_amd64.deb
wget https://github.com/wyca-robotics/openvdb/releases/download/v8.2.0-debian/libopenvdb-doc_8.2.0-1-wyca_all.deb
wget https://github.com/wyca-robotics/openvdb/releases/download/v8.2.0-debian/libopenvdb-tools_8.2.0-1-wyca_amd64.deb
wget https://github.com/wyca-robotics/openvdb/releases/download/v8.2.0-debian/libopenvdb8.2_8.2.0-1-wyca_amd64.deb
wget https://github.com/wyca-robotics/openvdb/releases/download/v8.2.0-debian/python3-openvdb_8.2.0-1-wyca_amd64.deb

dpkg -i libopenvdb8.2_8.2.0-1-wyca_amd64.deb
dpkg -i libopenvdb-dev_8.2.0-1-wyca_amd64.deb
dpkg -i libopenvdb-tools_8.2.0-1-wyca_amd64.deb
dpkg -i python3-openvdb_8.2.0-1-wyca_amd64.deb
dpkg -i libopenvdb-doc_8.2.0-1-wyca_all.deb

cd .. 

# -----------------------------------------------------

# Now download repo code. 
mkdir src
cd src
git clone https://github.com/johnny555/krytn_cafe
cd ..
# ------------------------

source /opt/ros/humble/local_setup.bash
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
echo "source /opt/ros/humble/setup.bash" >> /home/ros/.bashrc
echo "source /workspace/install/setup.bash" >> /home/ros/.bashrc