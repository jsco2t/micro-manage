# # Working with **k8s** **ingress resources**

## Overview

**ingress resources** in **k8s** are a way to define to an **ingress controller** which http endpoints your **service** should accept traffic at.<br>

More information:
- https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
- https://kubernetes.io/docs/concepts/services-networking/ingress/

### Viewing the **ingress resources** in a namespace:
```
----------------
kubectl -n qa get ingresses
----------------
```

### Viewing details about a specific **ingress resource**:
```
----------------
kubectl -n qa get ingresses auth-cognito-api-qa-ingress
kubectl -n qa get ingresses auth-cognito-api-qa-ingress -o yaml
kubectl -n qa describe ingresses auth-cognito-api-qa-ingress
----------------
```

**Note**: When to use _describe name_ vs _get name -o yaml_ commands:<br>

- _describe_ gives you info about a running instance
- _get name -o yaml_ gives you info about the deployed resource in **yaml** format 

<br>
_To see more help run:_ **k8s**