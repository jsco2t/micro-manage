----
# Working with _k8s_ _deployments_

## Overview

**deployments** in **k8s** are one of the key ways to request that a cluster start running a new workload (set of **pods** and **sevices**...etc). **deployments** are not the *only* way to request a **k8s** cluster to run your containers. Other options include **replicasets** and **daemonsets**.

This document contains examples for using the **kubectl** **deployment** command. For more information about this command please see the following documents:

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#creating-a-deployment

https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands

### Deploying using a _'yaml'_ file and the _'apply'_ or _'create'_ command:
```
----------------
kubectl -n some-namespace apply -f some-deployment.yaml
kubectl -n some-namespace create -f some-deployment.yaml

(namespaces can be listed with the 'kubectl get namespaces' command)
----------------
```

***Sidebar**: In **k8s** the **create** and **apply** commands accomplish the same thing - but do so by managing state in different ways. The scope of which is largely outside this document. In short we usually use **apply**.

More info:
https://kubernetes.io/docs/concepts/overview/object-management-kubectl/overview/

### View current _'deployments'_:
```
----------------
kubectl -n some-namespace get deployments
----------------
```

### View _'deployment'_ details:
```
----------------
kubectl -n some-namespace get deployments deployment-name -o yaml
kubectl -n some-namespace describe deployment deployment-name
----------------
```

### View _'deployment'_ rollout status:
```
----------------
kubectl -n some-namespace rollout status deployment/deployment-name
----------------
```

### Deleting a _'deployment'_ using it's _'yaml file'_ or name:
```
----------------
kubectl -n some-namespace delete -f deployment-name.yaml
kubectl -n some-namespace delete deployments deployment-name
----------------
```

_To see more help run:_
**k8s**