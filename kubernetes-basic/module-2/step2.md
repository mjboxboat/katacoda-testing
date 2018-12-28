The below commands will let you work with images.

-  List images `docker image ls`{{execute}}
  
-  Pull hello-world image from the container image registry (in this case, Docker Hub) `docker image pull hello-world`{{execute}}

- Pull the latest Alpine image from the container image registry `docker image pull alpine:latest`{{execute}}

-  List images on the local machine `docker image ls`{{execute}}

- Remove images stored locally `docker image rmi alpine:latest`{{execute}}

- List images again. Note that Alpine is no longer listed `docker image ls`{{execute}}
