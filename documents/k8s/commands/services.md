# # Working with k8s services

## Overview

A **pod** in **k8s** by itself is not exposed outside the cluster (or even the **node** it's running on). If the **pod** you have deployed needs to be accessible then you need to define a **service** for it.<br>

More information:

- https://kubernetes.io/docs/concepts/services-networking/service/
- https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands

### Listing existing sevices:
```
----------------
kubectl -n some-namespace get svc

Example:
kubectl -n qa get svc
----------------
```

### Getting service details:
```
----------------
kubectl -n some-namespace get svc service-name -o yaml
kubectl -n some-namespace describe svc service-name
----------------
```

**Note**: When to use **describe name** vs **get name -o yaml** commands:<br>

- **describe** gives you info about a running instance
- **get name -o yaml** gives you info about the deployed resource in yaml format 

<br>
_To see more help run:_ **k8s**