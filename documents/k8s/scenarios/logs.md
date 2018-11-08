----
# Working with _k8s_ _pod logs_

## Overview

In **k8s** your code runs within the context of a **container** inside of a **pod**. A **pod** in **k8s** may contain one or more **containers**. For simplification purposes - we will cover the common scenario of a single **container** in a **pod**.

The following is a brief overview of how you can get the logs for your container/pod:

### First - you need to know what _'namespace'_ your _'pod'_ is in:
```
----------------
You can list the existing namespaces using:

kubectl get ns
----------------
```

### Now we need to find the _'pod'_:
```
----------------
kubectl -n NAMESPACE-HERE get pods

--or--

kubectl -n NAMESPACE-HERE get po

Example:

kubectl -n qa get po
----------------
```

From this command you should get a list of the **pods** running in the **namespace** you provided. Copy the name of your pod (in the case you have multiple pods running you may need to run the following for each of them).

### Using the _'pod'_ name, ask for its _'logs'_:
```
----------------
kubectl -n NAMESPACE-HERE logs POD-NAME

Example:

kubectl -n qa logs super-cool-pod-1abcd
----------------
```

_To see more help run:_
**k8s**