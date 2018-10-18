****
# k8scmd: _test-connect_

## What's going to be run:

This helper command will test to see if we can get **version** information from the *k8s server*. If the version request fails then you either have an invalid **kubectl config file** or no networking connection to the server. 

### Example:
```
----------------
kubectl version
----------------
```
**Note** *'kubectl version'* will report both the **client** and the **server** version. If you see any sort of connection error *after* the client information then you have a connection problem.

### Example failure output:
```
----------------
Client Version: version.Info{Major:"1", Minor:"11", GitVersion:"v1.11.3", GitCommit:"a4529464e4629c21224b3d52edfe0ea91b072862", GitTreeState:"clean", BuildDate:"2018-09-09T18:02:47Z", GoVersion:"go1.10.3", Compiler:"gc", Platform:"linux/amd64"}
The connection to the server localhost:8080 was refused - did you specify the right host or port?

^^^^^^^^^ that last line == you have a problem
----------------
```

_To see more help run:_ **k8s**

****