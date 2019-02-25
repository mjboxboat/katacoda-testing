Next, you need to create the Result microservice, which will present the results of the vote to end-users. 

The application requires a recent version of the Result microservice, specifically `dockersamples/examplevotingapp_result:before`. Result should be accessible by other microservices behind your firewall. In addition, it should be accessible to end-users via port 31001. 

Other microservices expect to reach the Result microservice with the name "result" via port 5001; however, the actual application listens on port 80.