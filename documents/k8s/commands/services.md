----
# Working with _k8s_ _services_

## Overview

A **pod** in **k8s** by itself is not exposed outside the cluster (or even the **node** it's running on). If the **pod** you have deployed needs to be accessible then you need to define a **service** for it. 

More information:
- https://kubernetes.io/docs/concepts/services-networking/service/
- https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands

### Listing existing _'sevices'_:
```
----------------
kubectl -n some-namespace get svc

Example:
kubectl -n qa get svc
----------------
```

### Getting _'service'_ details:
```
----------------
kubectl -n some-namespace get svc service-name -o yaml
kubectl -n some-namespace describe svc service-name
----------------
```

**Note**: When to use _'describe name'_ vs _'get name -o yaml'_ commands:
- _'describe'_ gives you info about a running instance
- _'get name -o yaml'_ gives you info about the deployed resource in _'yaml'_ format 

_To see more help run:_
**k8s**