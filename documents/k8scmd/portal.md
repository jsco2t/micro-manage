# # k8scmd: **portal**

## What just ran:

_kubectl_ was just launched as a **proxy** to allow access to tke **k8s dashboard**. The **proxy** is running in a background process which will exit in one hour.<br>

### To access the portal the container must be launched with the _-p_ parameter:
```
----------------
docker run -it -p 8001:8001 --name micro-manage jsco2t/micro-manage:latest
----------------
```
Once the portal is running it can be accessed on your local machine at the following address:<br>

http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

### To manually startup the proxy:
```
----------------
kubectl proxy --accept-hosts '.*' --address 0.0.0.0 &
----------------
```

<br>
_To see more help run:_ **k8s**
## =======================================