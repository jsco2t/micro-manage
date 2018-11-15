# # k8scmd: test-connect

## What's going to be run:

This helper command will test to see if we can get **version** information from the *k8s server*. If the version request fails then you either have an invalid **kubectl config file** or no networking connection to the server. 

### Example:
```
----------------
kubectl version
----------------
```
**Note**: **kubectl version** will report both the **client** and the **server** version. If you see any sort of connection error after the client information then you have a connection problem.

### Example failure output:
```
----------------
The connection to the server localhost:8080 was refused - did you specify the right host or port?
----------------
```

<br>
_To see more help run:_ **k8s**
## =======================================