In this section we will learn how to stop, start and remove containers.

- Run an Ubuntu:16.04 container docker in detached mode using the sleep function.
  - `docker run -idt --name sleepy ubuntu:16.04 sleep 60m`{{execute}}
  - `docker container ps`{{execute}}

- Now let's interact with the sleepy container terminal:
`docker container exec -it sleepy bash`{{execute}}

- Create a file and then exit out of the container terminal:
`touch TEST.txt && ls`{{execute}}
`exit`{{execute}}

- Stop the sleepy container and start it again:
  - `docker container stop sleepy`{{execute}}
  - `docker container ls`{{execute}}
  - `docker container start sleepy`{{execute}}

- Now let's interact with the sleepy container terminal again:
  - `docker container exec -it sleepy bash`{{execute}}
  - `ls`{{execute}}
  - `exit`{{execute}}

Notice that the TEST.txt file is still there. That is because we only stopped and started and are interacting with the same container we created the file on.

Now let's stop and remove the sleepy container:
  - `docker container stop sleepy`{{execute}}
  - `docker container ps`{{execute}}
  - `docker container ps -a`{{execute}}
  - `docker container rm sleepy`{{execute}}
  - `docker ps -a`{{execute}}