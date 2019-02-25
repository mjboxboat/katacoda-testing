Next, you need to create the Vote microservice, which will allow end-users to vote for their favorite pet.

The application requires a recent version of the Vote microservice, specifically `dockersamples/examplevotingapp_vote:before`. Vote should be accessible by other microservices behind your firewall, specifically those that are part of the Voting App. In addition, it should be accessible to end-users via port 31000. 

Other microservices expect to reach the Vote microservice with the name "vote" via port 5000; however, the actual listens on port 80.