----
# Working with _k8s_ _pod logs_

## Overview

**containers** in **k8s** run within the scope of a **pod**. You can use the logs command to access the log of a running container.  

For more information:
https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands

### Viewing the _'logs'_ for a _'pod'_
```
----------------
First - find your pod (example for the 'qa' namespace):
kubectl -n qa get pods

Now ask for the pods logs:
kubectl -n qa logs pod-name-here
----------------
```

### Viewing the _'logs'_ for a _'container'_ in a _'pod'_ which has multiple _'containers'_ in it:
```
----------------
kubectl -n qa logs pod-name-here container-name-here
----------------
```

### Viewing the last 'N' log lines for a _'pod'_:
```
----------------
kubectl -n qa logs pod-name-here --tail=10
----------------
```

_To see more help run:_
**k8s**