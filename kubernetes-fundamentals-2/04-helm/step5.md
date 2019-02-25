Now that we have our chart created and running, we should think about how we might upgrade it for future releases.

## Upgrading
The Helm CLI has an `upgrade` command, that acts much the same as the `install` command. Lets update the image repository to `httpd` and the tag to `latest` and test it out.

Helm upgrade will take the form

`helm upgrade --reuse-values --set <value1> --set <value2> <release name> ./path/to/chart`

*Note:* Specifying `--reuse-values` ensure that any values we set on the previous install command will be retained.

Use the release created in the previous step as the release name. All of the currently installed charts can be found using:

`helm list`{{execute}}

## Verifying
Using the same curl command as before, verify that the server is now running Apache.

Congratulations! You upgraded your first chart!


[//]: # (Instructor Note: `helm upgrade --reuse-values --set image.repository=httpd --set image.tag=latest my-chart ./my-chart`)
