----
# Working with _k8s_ _pods_

## Overview

A **pod** is a logical object in **k8s** which represents one or more **docker containers**. In simple deployment scenarios you will typically find a 1:1 relationship between a **k8s pod** and a **docker container**

More information:
- https://kubernetes.io/docs/concepts/workloads/pods/pod/
- https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands

### Listing _'pods'_:
```
----------------
kubectl -n some-namespace get pods

Example ('get po' is the short form)
kubectl -n qa get po
----------------
```

### View context about what physical instance the _'pod'_ is running on:
```
----------------
kubectl -n some-namespace get pods -o wide
----------------
```

### Getting _'pod'_ details:
```
----------------
kubectl -n some-namespace get pods pod-name -o yaml
kubectl -n some-namespace describe pod pod-name

(note: 'describe' will show you recent state transition events for the pod)
----------------
```

**Note**: When to use _'describe name'_ vs _'get name -o yaml'_ commands:
- _'describe'_ gives you info about a running instance
- _'get name -o yaml'_ gives you info about the deployed resource in _'yaml'_ format 

_To see more help run:_
**k8s**