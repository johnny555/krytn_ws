# Deploying new container

To create a new container image, cd into .devcontainer and run the command

`docker build -t johnny555/krytn:v1 .`

This will build it with the tag `johnny555/krytn:v1`.

If you are logged into docker, you can then push the new version to the hub with

`docker push johnny555/krytn:v1`