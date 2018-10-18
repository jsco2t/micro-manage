****
# k8scmd: _which-cluster_

## What's going to be run:

This helper command will report on which cluster **context** your configured for, as well as the cluster version information.

**PLEASE NOTE** If the **kubectl version** command fails then you likely have a configuration problem in your **kubectl config file** *OR* a networking issue connecting to the cluster.

### Example:
```
----------------
kubectl config get-contexts
kubectl version
----------------
```
_To see more help run:_ **k8s**

****