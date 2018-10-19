----
# Working with _k8s_ _deployments_

## Overview

**deployments** in **k8s** are one of the key ways to request that a cluster start running a new workload (set of **pods** and **sevices**...etc). **deployments** are not the *only* way to request a **k8s** cluster to run your containers. Other options include **replicasets** and **daemonsets**.

This document contains examples for using the **kubectl** **deployment** command. For more information about this command please see the following document:

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#creating-a-deployment

https://kubernetes.io/docs/concepts/overview/object-management-kubectl/overview/

https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#apply

https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#delete

### Deploying using a _'yaml'_ file and the _'apply'_ command:
```
----------------
kubectl -n some-namespace apply -f some-deployment.yaml

(namespaces can be listed with the 'kubectl get namespaces' command)
----------------
```
### Deploying using a _'yaml'_ file and the _'create'_ command:
```
----------------
kubectl -n some-namespace create -f some-deployment.yaml

(namespaces can be listed with the 'kubectl get namespaces' command)
----------------
```

**Sidebar**: Why use **create** vs **apply**? The answer is beyond the scope of this document. The basics have to do with how **k8s** manages state for the resources it's managing. With **apply**, **k8s** will attempt to examine the previous state of the object and only update what has changed. 

More info:
https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/#in-place-updates-of-resources

https://kubernetes.io/docs/concepts/overview/object-management-kubectl/overview/

In most cases - using **'apply'** as long as it's consistently used should be a more flexible choice.

### View current _'deployments'_:
```
----------------
kubectl -n some-namespace get deployments

(namespaces can be listed with the 'kubectl get namespaces' command)
----------------
```
### View _'deployment'_ details:
```
----------------
kubectl -n some-namespace describe deployment deployment-name

(to get deployment-name use the 'get deployments' command)
----------------
```
### View _'deployment'_ rollout status:
```
----------------
kubectl -n some-namespace rollout status deployment/deployment-name

(to get deployment-name use the 'get deployments' command)
----------------
```
### View the _'deployment yaml'_ that was last used (may contain _'k8s'_ modifications):
```
----------------
kubectl -n some-namespace get deployments deployment-name -o yaml

(to get deployment-name use the 'get deployments' command)
----------------
```
### Deleting a _'deployment'_ using it's _'yaml file'_ or name:
```
----------------
kubectl -n some-namespace delete -f deployment-name.yaml

kubectl -n some-namespace delete deployments deployment-name

(to get deployment-name use the 'get deployments' command)
----------------
```

_To see more help run:_
**k8s**