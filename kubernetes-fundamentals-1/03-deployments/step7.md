Next, we will deploy software many of probably has heard of, the Minecraft server. The Minecraft server is free to run, and many people have made businesses out of hosting other people's servers. We'll do this with Kubernetes.

The configuration is relatively simple. Create your base file: `touch ./resources/minecraft.yaml`{{execute}}

Now, you need to configure the following values, in addition to everything else necessary to create a Deployment:

1. replicase = 1
2. image = `itzg/minecraft-server`
3. environment variables: `EULA="true"`
4. container port = 25565
5. volume: Pod local = `/data`, use an `emptyDir` for the actual storage

There are many more scaffolding requirements for this Deployment, such as `apiVersion`. Refer back to your notes, and you may need to check out what you've previously done in the Pod lab. You can find old files that you've previously worked on in the `/old/` directory on this host.

Once you've deployed it, it should be pretty easy to verify that everything is working correctly.

Deploying applications is really easy with Kubernetes. If any of you have softare running on a server in your home, I can almost guarantee someone is currently maintaining a Deployment Manifest for it on GitHub.