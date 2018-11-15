# # Setting up kubectl to access k8s

## Option: Mount a known-good kubectl config file into the docker image when launched:

The '-v' option for docker allows you to mount a local folder on your machine into a folder in the running docker container. It's important to understand that this is **read/write** access. Anything destructive you do in the container will have an impact on the mounted files on your local machine.<br>

In this case we need to mount the local **.kube** folder into the container so that *micro-manage* can use your pre-existing **kubectl config file** for accessing k8s.<br>

```
----------------
docker run -v c:\users\username\.kube\:/root/.kube -it --name micro-manage jsco2t/micro-manage:latest

-- or --

docker run -v /home/username/.kube/:/root/.kube -it --name micro-manage jsco2t/micro-manage:latest

For example - for a user named `Sue` on `macOS` that might look like this:
docker run -v /Users/sue/.kube/:/root/.kube -it --name jsco2t/micro-manage:latest
----------------
```

<br>
_To see more help run:_ **k8s**