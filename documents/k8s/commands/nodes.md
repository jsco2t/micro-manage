# # Working with **k8s** **nodes**

## Overview

A **k8s cluster** is really just a collection of **nodes**. **nodes** are the representation a physical docker host has within the cluster. **k8s** will organize **nodes** along workload roles and in a typical **kops** cluster you will find two basic roles:<br>

- _Master_: These are the **nodes** responsible for all of the management/orchestration in the cluster.
- _Workers/Nodes_: These are the **nodes** which are responsible for run client pods/services...etc.<br>

More information:
https://kubernetes.io/docs/concepts/architecture/nodes/

### Viewing the existing **nodes**:
```
----------------
kubectl get nodes

For more info:
kubectl get nodes -o wide
----------------
```

<br>
_To see more help run:_ **k8s**