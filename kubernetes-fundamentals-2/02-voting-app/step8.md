Now that the application has been deployed, the developers have a few patches. The Vote microservice should be upgraded to the following version:

`dockersamples/examplevotingapp_vote:after`

In addition, the result microservice has an update:

`dockersamples/examplevotingapp_result:after`

Now that the application has been updated, you need to prepare for the launch of the application. There will be many end-users, so the frontend should be scaled up to 3 total replicas.

At this point, you've successfully deployed the Voting App, congratulations!