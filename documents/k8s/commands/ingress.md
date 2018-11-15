# # Working with k8s ingress resources

## Overview

**ingress resources** allow you to define two basic facts:<br>

- A url that you want to accept traffic at.
- Which service that traffic should be routed to.<br>

**ingress resources** are one of the common ways that you can (in a declarative way) tell **k8s** what kind of traffic to send to the **service** you have exposed for your **pods**. **ingress resources** work in conjunction with **ingress controllers** to perform this traffic routing.<br>

More information:

- https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
- https://kubernetes.io/docs/concepts/services-networking/ingress/

### Viewing the ingress resources in a namespace:
```
----------------
kubectl -n qa get ingresses
----------------
```

### Viewing details about a specific ingress resource:
```
----------------
kubectl -n qa get ingresses ingress-name-here
kubectl -n qa get ingresses ingress-name-here -o yaml
kubectl -n qa describe ingresses ingress-name-here
----------------
```

**Note**: When to use **describe name** vs **get name -o yaml** commands:<br>

- **describe** gives you info about a running instance
- **get name -o yaml** gives you info about the deployed resource in yaml format 

<br>
_To see more help run:_ **k8s**