In the last step our service came up as a LoadBalancer on a random port. In this step we are going to investigate the chart to learn why, then modify the chart to allow us to specify the NodePort.

## Chart structure
Helm charts follow the basic structure outlined below:
```
my-chart/
 Chart.yaml          # A YAML file containing information about the chart
 LICENSE             # OPTIONAL: A plain text file containing the license for the chart
 README.md           # OPTIONAL: A human-readable README file
 requirements.yaml   # OPTIONAL: A YAML file listing dependencies for the chart
 values.yaml         # The default configuration values for this chart
 charts/             # A directory containing any charts upon which this chart depends.
 templates/          # A directory of templates that, when combined with values,
                     # will generate valid Kubernetes manifest files.
 templates/NOTES.txt # OPTIONAL: A plain text file containing short usage notes
 ```
 > https://docs.helm.sh/developing_charts/

The use of the `charts/` and `templates/` folders is reserved by Helm.

## Download the chart
First lets download the chart:

`helm fetch --untar stable/tomcat --version 0.2.0`{{execute}}

This created a folder called tomcat:

`ls tomcat`{{execute}}

## Inspecting the chart
To get a handle on how the chart works, the README is a good place to start.

`less tomcat/README.md`{{execute}}

The *Configuration* section has a table of all the parameters that may be set when running this chart. This allows us to configure our installation without modifying the chart itself. For example, to set the service type when installing the chart, we could run:

`helm install --name sample --set service.type=NodePort stable/tomcat`

But where do the defaults come from?

`less -N tomcat/values.yaml`{{execute}}

Looking at line 21, we can see the default for the service type. This is why we got a LoadBalancer when we deployed previously.

There is no setting to specify the NodePort in this values file, so lets update the chart to add our own!

## Modifying the chart
The `templates` folder holds the service and deployment definition.

`ls tomcat/templates/`{{execute}}

The YAMLs in this directory look very similar to kubernetes YAMLs, however they are templatized. The curly braces are replaced with values on a `helm install`. We are going to modify the service definition, `appsrv-svc.yaml`.

`vim tomcat/templates/appsrv-svc.yaml`{{execute}}

At line 15, add
```
{{if .Values.service.nodePort}}nodePort: {{.Values.service.nodePort}}{{end}}
```
*Note:* Indentation is important in YAMLs, ensure that the line above is indented to the same degree as the surrounding lines

This line will add:
```
  nodePort: <value of service.nodePort>
```
to the service definition if `.service.nodePort` is specified.

We could also add a default value for the `.service.nodePort` setting to `values.yaml`, but for our purposes we will skip that step.

## Deploy the chart
We have an updated version of the chart running locally, lets deploy it!

`helm install --name modified --set service.type=NodePort --set service.nodePort=30080 ./tomcat`{{execute}}

View the site: https://[[HOST_SUBDOMAIN]]-30080-[[KATACODA_HOST]].environments.katacoda.com/sample

## Clean up
`helm delete --purge modified`{{execute}}
