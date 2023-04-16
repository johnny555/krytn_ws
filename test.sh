#!/bin/bash
# from https://github.com/athackst/vscode_ros2_workspace/blob/humble/test.sh
set -e

if [ -f install/setup.bash ]; then source install/setup.bash; fi
colcon test --merge-install
colcon test-result --verbose