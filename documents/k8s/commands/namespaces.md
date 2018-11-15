# # Working with k8s namespaces


## Overview
**namespaces** in **k8s** are logical permissions and/or policy boundaries established within the cluster. As a user you may not have access to all the various **namespaces** in a cluster. Your rights within any given **namespace** may vary.<br>

More information:
https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/

### To view the existing namespaces:
```
----------------
kubectl get ns
----------------
```

### Using namespaces to specify the run context for a command:
```
----------------
kubectl -n namespace-name command

-or-

kubectl --namespace namespace-name foo
----------------
```

<br>
_To see more help run:_ **k8s**