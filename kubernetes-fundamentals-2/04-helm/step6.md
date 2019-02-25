Using helm, we can list and upgrade our charts when we have application changes. Let's take a look at what we have deployed:
`helm list`{{execute}}

```
NAME         	REVISION	UPDATED                 	STATUS  	CHART         	APP VERSION	NAMESPACE
my-chart     	2       	Fri Jan 18 15:11:01 2019	DEPLOYED	my-chart-0.1.0	1.0        	default
```
This shows information about the charts you have deployed, such as their name, revision, version and namespace.

Notice that for our upgraded chart we have 2 revisions.

## History
Using helm's history we can see we can view the activity on a chart.

`helm history my-chart`{{execute}}

```
REVISION	UPDATED                 	STATUS    	CHART         	DESCRIPTION     
1       	Fri Jan 18 15:11:01 2019	SUPERSEDED	my-chart-0.1.0	Install complete
2       	Fri Jan 18 15:14:25 2019	DEPLOYED  	my-chart-0.1.0	Upgrade complete
```

The chart has remained the same. So how can we tell what has changed?

We can get the values we specified for our chart. Revision 2 is our most recent deployment, revision 1 is our initial install.

`helm get values --revision=2 my-chart`{{execute}}

```
image:
  repository: httpd
  tag: latest
service:
  type: NodePort
```

`helm get values --revision=1 my-chart`{{execute}}

```
service:
  type: NodePort
```

## Reverting to and old version
We've decided that we want to go back to the original version. We can simply rollback the chart:

`helm rollback my-chart 1`{{execute}}

Running the curl command yet again will show that we have an NGINX welcome page agian.

Looking at the history a final time reveals the rollback as well

`helm history my-chart`{{execute}}

```
REVISION	UPDATED                 	STATUS    	CHART         	DESCRIPTION     
1       	Fri Jan 18 15:11:01 2019	SUPERSEDED	my-chart-0.1.0	Install complete
2       	Fri Jan 18 15:14:25 2019	SUPERSEDED	my-chart-0.1.0	Upgrade complete
3       	Fri Jan 18 15:16:15 2019	DEPLOYED  	my-chart-0.1.0	Rollback to 1
```

And the values show the same story:

`helm get values --revision=3 my-chart`{{execute}}

```
service:
  type: NodePort
```
