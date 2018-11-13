# # Working with **k8s services**

## Overview

A **pod** in **k8s** by itself is not exposed outside the cluster (or even the **node** it's running on). If the **pod** you have deployed needs to be accessible then you need to define a **service** for it.<br>

More information:

- https://kubernetes.io/docs/concepts/services-networking/service/
- https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands

### Listing existing _sevices_:
```
----------------
kubectl -n some-namespace get svc

Example:
kubectl -n qa get svc
----------------
```

### Getting _service_ details:
```
----------------
kubectl -n some-namespace get svc service-name -o yaml
kubectl -n some-namespace describe svc service-name
----------------
```

**Note**: When to use _describe name_ vs _get name -o yaml_ commands:<br>

- _describe_ gives you info about a running instance
- _get name -o yaml_ gives you info about the deployed resource in **yaml** format 

<br>
_To see more help run:_ **k8s**