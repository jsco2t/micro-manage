----
# Working with _k8s_ _nodes_

## Overview

A **k8s cluster** is really just a collection of **nodes**. **nodes** are the representation a physical docker host has within the cluster. **k8s** will organize **nodes** along workload *roles* and in a typical **kops** cluster you will find two basic roles:

- *Master*: These are the **nodes** responsible for all of the management/orchestration in the cluster.
- *Workers*/*"Nodes"*: These are the **nodes** which are responsible for run client pods/services...etc. 

More information:
https://kubernetes.io/docs/concepts/architecture/nodes/

### Viewing the existing _'nodes'_:
```
----------------
kubectl get nodes

For more info:
kubectl get nodes -o wide
----------------
```

_To see more help run:_
**k8s**