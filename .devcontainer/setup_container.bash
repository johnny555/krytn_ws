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
