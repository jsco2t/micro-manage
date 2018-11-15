# # Working with multiple k8s clusters using kubectl contexts

## Overview

When you setup a **kubectl config file** you have the option of including multiple clusters within that same config file. **kubectl** identifies which cluster it's communicating with **contexts**. A **context** is just an indicator of:<br>

- Which cluster endpoint is being communicated with
- What auth information is being used for the cluster
- What the cluster name is

## To see the current context:
```
kubectl config current-context
```

The output of that command will look something like this:

```
FooCluster01
```

## To change the current context to:
```
kubectl config use-context FooCluster02
```

You can verify the change by running the following again:
```
kubectl config current-context
```

You can also see all of the contexts, as well as your currently selected one with:
```
kubectl config get-contexts
```

## PLEASE READ notes:<br>

A couple **VERY** important things to understand about **contexts** and **kubectl**<br>

- Some commands with **kubectl** are **destructive** please double check which cluster your working with prior to running anything which might cause a state change.<br>

_To see more help run:_ **k8s**