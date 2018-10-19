----
# Working with _k8s_ _deployments_

## Overview

**deployments** in **k8s** or one of the key ways to request that a cluster start running a new workload (set of **pods** and **sevices**...etc). **deployments** are not the *only* way to request a **k8s** cluster to run your containers. Other options include **replicasets** and **daemonsets**.

The following are examples for using **command name**. For more information about this command please see the following document:

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#creating-a-deployment

https://kubernetes.io/docs/concepts/overview/object-management-kubectl/overview/

### Deploying using a _'yaml'_ file and the _'apply'_ command:
```
----------------
kubectl -n some-namespace apply -f some-deployment.yaml
----------------
```
### Deploying using a _'yaml'_ file and the _'create'_ command:
```
----------------
kubectl -n some-namespace create -f some-deployment.yaml
----------------
```
### View current _'deployments'_:
```
----------------
kubectl -n some-namespace get deployments

-- find the deployment you want information --
-- then use one of the following --

To see information about the deployment:
kubectl -n some-namespace describe deployment deployment-name

To see a
----------------
```
### View _'deployment'_ details:
```
----------------
kubectl -n some-namespace describe deployment deployment-name

(if you don't know `deployment-name` use the 'get deployments' command)
----------------
```

#### These are overview links
https://kubernetes.io/docs/reference/kubectl/overview/

#### And this is another link
https://kubernetes.io/docs/reference/kubectl/cheatsheet/

## PLEASE READ notes:

Put any cautionary tales / tips / "don't do what I did" info here.

_To see more help run:_
**k8s**