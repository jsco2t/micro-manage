# # Working with k8s pod logs

## Overview

**containers** in **k8s** run within the scope of a **pod**. You can use the logs command to access the log of a running container.<br>

For more information:
https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands

### Viewing the logs for a pod

First - find your pod (example for the 'qa' namespace):
```
----------------
kubectl -n qa get pods
----------------
```

Now ask for the pods logs:
```
----------------
kubectl -n qa logs pod-name-here
----------------
```

### Viewing the logs for a container in a pod which has multiple containers in it:
```
----------------
kubectl -n qa logs pod-name-here container-name-here
----------------
```

### Viewing the last 'N' log lines for a pod:
```
----------------
kubectl -n qa logs pod-name-here --tail=10
----------------
```

<br>
_To see more help run:_ **k8s**