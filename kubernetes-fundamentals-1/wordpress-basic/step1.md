WordPress has 3 core components:

1. Frontend (PHP)
2. Webserver
3. Database (MySQL)

These core components have been packaged into two Docker images. The first Docker image contains all of the core WordPress code and is bundled with a webserver. The second Docker image runs the MySQL database.

We will create Deployments for each of these images to deploy WordPress. In addition, we will also create services so Pods in each Deployment can communicate, and so that end-users can also access the WordPress frontend.
