# # A k8s and kubectl introduction

When working with **k8s** a few basic principles are important to grasp. The following are very high level details. For more information see the links listed below.<br>

High level info:
https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/

### kubectl<br>

**kubectl** is the core cli console application used for communicating with a **k8s** clusters. In some cases the clusters may also provide a web portal but in many cases the default or most basic access "tool" for working with **k8s** will be the **kubectl** toolset.<br>

More info:
https://kubernetes.io/docs/reference/kubectl/overview/<br>

**micro-manage** provides additional information about working with **kubectl**. Run the following command for more information: **k8s commands**

### nodes<br>

A **k8s cluster** is really just a collection of **nodes**. **nodes** are the representation a physical docker host has within the cluster. **k8s** will organize **nodes** along workload **roles** and in a typical **kops** cluster you will find two basic roles:<br>

- _Master_: These are the **nodes** responsible for all of the management/orchestration in the cluster.
- _Workers/Nodes_: These are the **nodes** which are responsible for run client pods/services...etc.<br>

More information:
https://kubernetes.io/docs/concepts/architecture/nodes/

### pods<br>

A **pod** is a logical object in **k8s** which represents one or more **docker containers**. In simple deployment scenarios you will typically find a 1:1 relationship between a **k8s pod** and a **docker container**<br>

More information:
https://kubernetes.io/docs/concepts/workloads/pods/pod/

### deployments<br>

A **deployment** is an instruction to **k8s** to deploy a set of resources (**pods**, **services**, **ingresses** ...etc). It's important to understand that **k8s** works on the "desired state" principle. When you deploy (or update) "something" in **k8s**, then **k8s** will repeatedly work to get the cluster state to match what you requested in your **deployment**. If the **deployment** is unhealthy then **k8s** will continue to try to get it into an operational/healthy state.<br>

More information:
https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

### services<br>

A **pod** in **k8s** by itself is not exposed outside the cluster (or even the **node** it's running on). If the **pod** you have deployed needs to be accessible then you need to define a **service** for it.<br>

More information:
https://kubernetes.io/docs/concepts/services-networking/service/

### ingresses<br>

A **service** in **k8s** tells **k8s** that your **pods** want to accept traffic. That declaration is (typically) a simple designation of the **protocols** and **ports** you accept traffic at. To get traffic outside of **k8s** to your service there are a few strategies. One of which is **ingress resources** used by **ingress controllers**. **ingress resources** allow you to define which url/path your service accepts traffic at. **k8s** does the rest of the work to make sure that when it sees traffic matching the pattern you supplied that it's handed off to your service for further evaluation.<br>

More information:
https://kubernetes.io/docs/concepts/services-networking/ingress/

### namespaces<br>

**namespaces** in **k8s** are logical permissions and/or policy boundaries established within the cluster. As a user you may not have access to all the various **namespaces** in a cluster. And your rights within any given **namespace** may vary.<br>

More information:
https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/

<br>
_To see more help run:_ **k8s**