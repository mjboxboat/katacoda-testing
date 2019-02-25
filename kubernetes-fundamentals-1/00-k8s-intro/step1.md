Welcome to the BoxBoat Bootcamp! For our labs, we utilize Katacoda. Katacoda is
a platform that enables you to run Docker and Kubernetes in your web browser.
Each lab has multiple steps where we'll explain concepts and how you can utilize
them in Kubernetes. In the future, if you want to experiment with Kubernetes,
you should check out Katacoda's
[Kubernetes playground](https://www.katacoda.com/courses/kubernetes/playground).

Our Katacoda environment is a lightweight Linux distribution where we can run pretty much whatever we want. Katacoda simplifies the process by allowing you to click on commands to execute them. For example:

`ls`{{execute}}

You can click on that, and it will execute `ls` inside the environment.

You can also view open ports, and even edit files. We will be using this platform for the all of our Kubernetes labs.

**We strongly recommend that you use a text editor on your host to edit and
save files ( [VS Code](https://code.visualstudio.com/) and
[Atom](https://atom.io/) are excellent and free ). You will receive a copy of
all lab files we use at the conclusion of the training**.

Each session has multiple hosts. Your current host is a `master` node that lets
us run the cluster. You also have another host that is a `worker`, which runs
workloads.

We generally keep files for labs in `./resources/`. We also store all of your
old work from previous sessions in `/old/` on this host.

Let's begin.
