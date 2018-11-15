# # Working with k8s pod logs

## Overview

In **k8s** your code runs within the context of a **container** inside of a **pod**. A **pod** in **k8s** may contain one or more **containers**. For simplification purposes - we will cover the common scenario of a single **container** in a **pod**.

The following is a brief overview of how you can get the logs for your container/pod:

### First - you need to know what namespace your pod is in:
```
----------------
You can list the existing namespaces using:

kubectl get ns
----------------
```

### Now we need to find the pod:
```
----------------
kubectl -n NAMESPACE-HERE get pods

--or--

kubectl -n NAMESPACE-HERE get po

Example:

kubectl -n qa get po
----------------
```

From this command you should get a list of the **pods** running in the **namespace** you provided. Copy the name of your pod (in the case you have multiple pods running you may need to run the following for each of them).<br>

### Using the pod name, ask for its logs:
```
----------------
kubectl -n NAMESPACE-HERE logs POD-NAME

Example:

kubectl -n qa logs super-cool-pod-1abcd
----------------
```

<br>
_To see more help run:_ **k8s**