# # Working with k8s pods

## Overview

A **pod** is a logical object in **k8s** which represents one or more **docker containers**. In simple deployment scenarios you will typically find a 1:1 relationship between a **k8s pod** and a **docker container**<br>

More information:

- https://kubernetes.io/docs/concepts/workloads/pods/pod/
- https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands

### Listing pods:
```
----------------
kubectl -n some-namespace get pods

Example ('get po' is the short form)
kubectl -n qa get po
----------------
```

### View context about what physical instance the pod is running on:
```
----------------
kubectl -n some-namespace get pods -o wide
----------------
```

### Getting pod details:
```
----------------
kubectl -n some-namespace get pods pod-name -o yaml
kubectl -n some-namespace describe pod pod-name

(note: 'describe' will show you recent state transition events for the pod)
----------------
```

**Note**: When to use **describe name** vs **get name -o yaml** commands:<br>

- **describe** gives you info about a running instance
- **get name -o yaml** gives you info about the deployed resource in yaml format 

<br>
_To see more help run:_ **k8s**