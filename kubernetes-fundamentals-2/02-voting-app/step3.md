Next, you need to create Redis, which will collect new votes for the application.

The application requires the most recent minimal version of Redis. Redis should only be accessible by other microservices behind your firewall. It listens for connections on port 6379. Redis stores its data in `/data`. It doesn't require network-based persistent storage, a local directory mount will do.

Finally, other microservices expect to reach this microservice with the name "redis" on port 6379.