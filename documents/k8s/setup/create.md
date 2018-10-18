----
# Setting up _kubectl_ to access k8s

## Option: Create a config file and/or configure it.

**Please Note** This is a basic overview for how you might *bootstrap* a **kubectl config file**. Before running any of these commands you will need (at a minimum) the following information:

- The address for your **kubernetes api** on the *kubernetes cluster*
- The user account to use
- The access token for the user
- A name (logical name) to use for the cluster

This is not a complete list. The requirements on the kubectl config file will depend on how the kubernetes cluster is configured. Please evaluate the various configuration options **kubectl** provides by checking it's help documentation:

```
kubectl config --help
```

It's also **very** important to understand that there are multiple ways to setup a **kubectl config file** that will work with a **k8s** server. This information is just an overview. The following is an **example** of how to bootstrap a kubectl configuration:

Create a user (named "developer") - and set it's access token:
```
kubectl config set-credentials developer --token="foo"
```

Setup the cluster (named "development-cluster") API endpoint information:
```
kubectl config set-cluster development-cluster --server=https://api.foo.bar
```

Setup the user to use the newly defined cluster (context named "development"):
```
kubectl config set-context development --user=developer --cluster=development-cluster
```

Finally tell kubectl that you want to use this context:
```
kubectl config set-context development
```

_To see more help run:_
**k8s**