To review what we did yesterday with Deployments, we'll repeat the Minecraft lab that we did yesterday. Use the configuration provided below, in addition to what a Deployment needs to deploy Minecraft as a Deployment. Reference the included `nginx` and `tutum` Deployment files for assistance. Make sure you work in groups of 2-3.

Create your base file: `touch ./resources/minecraft.yaml`{{execute}}

Now, you need to configure the following values, in addition to everything else necessary to create a Deployment:

1. replicase = 1
2. image = `itzg/minecraft-server`
3. environment variables: `EULA="true"`
4. container port = 25565
5. volume: Pod local = `/data`, use an `emptyDir` for the actual storage

There are many more scaffolding requirements for this Deployment, such as `apiVersion`. Refer back to your notes from yesterday, and additional resources in this lab. 

Once you've deployed it, how can you check?