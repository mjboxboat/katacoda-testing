At this point, you can access WordPress via HTTP on port 80. If you cannot access it, you need to debug the installation.

1. Double-check your YAML files
2. Verify all Services and Deployments are running
3. Read pod logs

As a tip, check the logs on MySQL first. If the MySQL Pod lives for about 30 seconds and then dies, it is misconfigured, most likely from the Deployment YAML file. If that works properly, check out the logs on the WordPress Pod. The most common errors will be that the mysql password is incorrect.