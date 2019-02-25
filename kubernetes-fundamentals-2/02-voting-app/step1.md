You have been tasked with deploying the Docker Voting app for your organization.

![Docker Voting App Architecture](https://raw.githubusercontent.com/dockersamples/example-voting-app/master/architecture.png "Docker Voting App Architecture")

The overall structure of the application is straightforward. End-users interact with the application via the "voting-app" microservice. Redis receives the vote, and passes it along to the Worker microservice. The Worker microservice stores the vote into PostgreSQL, and the results are viewable to the end-user via the "result-app" microservice.

Your job is to translate application requirements into Kubernetes objects, so you can deploy the entire application.