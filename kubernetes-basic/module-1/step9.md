Run Ghost, a free and open source blogging platform written in JavaScript. Docker Hub Link: https://hub.docker.com/_/ghost/

The following command will run Ghost on port 3001:
  - `docker run -d --name some-ghost -p 3001:2368 ghost`{{execute}}
  - Visit the Ghost web page here: https://[[HOST_SUBDOMAIN]]-3001-[[KATACODA_HOST]].environments.katacoda.com/

Run Portainer. Portainer is a simple management solution for Docker. Easily manage your Docker hosts and Docker Swarm clusters via Portainer web user interface. https://portainer.io/

The following command will run Portainer on port 9000:
  - `docker volume create portainer_data`{{execute}}
  - `docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer`{{execute}}
  - Visit the Portainer admin page here and add a password: https://[[HOST_SUBDOMAIN]]-9000-[[KATACODA_HOST]].environments.katacoda.com/

Containers and Docker are a powerful tools and you should gain a solid foundation in containers and Docker before moving on to running Kubernetes in production.

If your organization needs help developing, implementing or deploying your software in containers, container orchestration, DevOps guidance, or Docker/Kubernetes training, please reach out to us at [BoxBoat](https://boxboat.com).
