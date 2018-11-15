# # Setting up kubectl to access k8s

## Overview

Working with a **k8s cluster** involves a few basic components:<br>

1. A kubernetes cluster to talk to.

2. An authorized account/credentials/credentials provider for that cluster.

3. **kubectl** installed locally. **kubectl** is the console utility used for doing most basic tasks with the cluster.<br>

For **kubectl** to be able to talk to a **kubernetes** cluster it needs to have a configuration called **config** located in a folder called **.kube** in your home directory:

```
----------------
c:\users\username\.kube\config

--or macos--

/Users/username/.kube/config

--or linux--

/home/username/.kube/config
----------------
```

## Setup

The following help documents discuss options for setting up a **kubectl config file**:<br>

| Command | Purpose |
| -- | -- |
| _k8s setup create_ | Create **config file** |
| _k8s setup mount_ | Mount a known good **config file** |

<br>
_To see more help run:_ **k8s**