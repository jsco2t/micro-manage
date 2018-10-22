----
# Working with _k8s_ _ingress resources_

## Overview

**ingress resources** in **k8s** are a way to define to an **ingress controller** which http endpoints your **service** should accept traffic at. 

More information:
- https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
- https://kubernetes.io/docs/concepts/services-networking/ingress/

### Viewing the _'ingress resources'_ in a namespace:
```
----------------
kubectl -n qa get ingresses
----------------
```

### Viewing details about a specific _'ingress resource'_:
```
----------------
kubectl -n qa get ingresses auth-cognito-api-qa-ingress
kubectl -n qa get ingresses auth-cognito-api-qa-ingress -o yaml
kubectl -n qa describe ingresses auth-cognito-api-qa-ingress
----------------
```

**Note**: When to use _'describe name'_ vs _'get name -o yaml'_ commands:
- _'describe'_ gives you info about a running instance
- _'get name -o yaml'_ gives you info about the deployed resource in _'yaml'_ format 

_To see more help run:_
**k8s**