#!/bin/bash
#based on https://github.com/athackst/vscode_ros2_workspace/blob/humble/setup.sh
set -e

vcs import < .devcontainer/krytn_ws.repos src
sudo apt-get update
rosdep update
rosdep install --from-paths src --ignore-src -y