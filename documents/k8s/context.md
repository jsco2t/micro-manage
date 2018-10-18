----
# Working with multiple _k8s_ clusters using _kubectl contexts_

## Overview

When you setup a **kubectl config file** you have the option of including multiple clusters within that same config file. **kubectl** identifies which cluster it's communicating with **contexts**. A **context** is just an indicator of:

- Which cluster endpoint is being communicated with
- What auth information is being used for the cluster
- What the cluster name is

### To see the current _context_:
```
kubectl config get-contexts
```

In the output look for the `*` symbol to designate which **k8s cluster** the **context** is currently pointing to:

```
CURRENT:   NAME        CLUSTER              AUTHINFO
*          FooCluster  foo.somecluster.bar  foo-auth-info
           BarCluster  bar.somecluster.foo  bar-auth-info
```

### To change the current _context_:
```
kubectl config use-context FooCluster
```

You can verify the change by running the following again:

```
kubectl config get-contexts
```

## PLEASE READ notes:

A couple **VERY** important things to understand about **contexts** and **kubectl**

- Some *commands* with **kubectl** are *destructive* please double check which cluster your working with prior to running anything which might cause a state change.

_To see more help run:_
**k8s**