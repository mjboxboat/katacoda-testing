We can deploy and modify charts from the community, but how do we go about creating our own?

## Creating a chart
Helm's command line has a `create` function which will generate a basic helm chart. Run the following to create a chart called `my-chart`:

`helm create my-chart`{{execute}}

We now have a `my-chart` folder, and a preconfigured chart. It should look very similar to the Tomcat chart we looked at.

What image will this chart deploy? Will you be able to reach the service once its deployed? If the service cannot be reached, are you able to change that?

Try installing the chart now and see if you were right! After it is installed, make sure you can curl against the service.

[//]: # (Instructor Note: `helm install --set service.type=NodePort --name my-chart ./my-chart`)
