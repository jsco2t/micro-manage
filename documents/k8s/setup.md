----
# Setting up _kubectl_ to access k8s

## Overview

Working with a **k8s cluster** involves a few basic components:

1. A kubernetes cluster to talk to.

2. An authorized account/credentials/credentials provider for that cluster.

3. **kubectl** installed locally. **kubectl** is the console utility used for doing most basic tasks with the cluster.

For **kubectl** to be able to talk to a _kubernetes_ cluster it needs to have a configuration called **config** located in a folder called **.kube** in your home directory:

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

The following help documents discuss options for setting up a **kubectl config file**:

| **_Command_** | **_Purpose_** |
| -- | -- |
| _k8s setup create_ | Create _config_ file |
| _k8s setup mount_ | Mount a known good _config_ file |

_To see more help run:_
**k8s**