# # Working with **k8s** **deployments**

## Overview

**deployments** in **k8s** are one of the key ways to request that a cluster start running a new workload (set of **pods** and **sevices**...etc). **deployments** are not the only way to request a **k8s** cluster to run your containers. Other options include **replicasets** and **daemonsets**.<br>

This document contains examples for using the _kubectl deployment_ command. For more information about this command please see the following documents:<br>

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#creating-a-deployment
<br>
https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands

### Deploying using a **yaml** file and the _apply_ or _create_ command:
```
----------------
kubectl -n some-namespace apply -f some-deployment.yaml
kubectl -n some-namespace create -f some-deployment.yaml

(namespaces can be listed with the 'kubectl get namespaces' command)
----------------
```
More info:
https://kubernetes.io/docs/concepts/overview/object-management-kubectl/overview/

### View current deployments:
```
----------------
kubectl -n some-namespace get deployments
----------------
```

### View deployment details:
```
----------------
kubectl -n some-namespace get deployments deployment-name -o yaml
kubectl -n some-namespace describe deployment deployment-name
----------------
```

### View deployment rollout status:
```
----------------
kubectl -n some-namespace rollout status deployment/deployment-name
----------------
```

### Deleting a deployment using it's 'yaml file' or 'name':
```
----------------
kubectl -n some-namespace delete -f deployment-name.yaml
kubectl -n some-namespace delete deployments deployment-name
----------------
```

<br>
_To see more help run:_ **k8s**