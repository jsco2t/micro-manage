# # k8scmd: which-cluster

## What's going to be run:

This helper command will report on which cluster **context** your configured for, as well as the cluster version information.<br>

**PLEASE NOTE**: If the **kubectl version** command fails then you likely have a configuration problem in your **kubectl config file** OR a networking issue connecting to the cluster.

### Example:
```
----------------
kubectl config get-contexts
kubectl config current-context
kubectl version
----------------
```

_To see more help about managing your kubectl context run:_ **kubectl context** <br>

_To see more help run:_ **k8s**
## =======================================