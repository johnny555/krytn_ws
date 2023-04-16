# KRYTN_WS Repository

This is the base repo designed to be cloned to setup a VS code enviroment for development with the krytn robot. 

## Steps To Setup

1. Install WSL2 on Windows 11
2. Install and run docker-desktop with WSL 2 enabled.
3. Install VS Code
3. Open WSL2 and clone this repo.
4. Install developer containers VS Code extension.
5. Type `code .` in the repo folder to open VS Code in WSL. 
6. Re-open folder using dev-container, this may take a long time as it downloads.
7. Inside the container, open a terminal and run `bash .devcontainer/setup_container.bash` to setup the container
8. Source the ros environment to get the shell setup.
`source /opt/ros/foxy/local_setup.bash`
9. Build the packages using colcon
`colcon build`
10. Re-source the install directory to get the built packages into your terminals path
`source install/setup.bash`
11. Run the gazebo sim
`ros2 launch krytn-cafe empty-world.launch.py`

And you are away! 


## References

Using some setup inspiration and code snippets from the excellent https://github.com/athackst/vscode_ros2_workspace
