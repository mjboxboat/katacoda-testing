You first need to create the Database that will store the votes for the application.

The application requires Postgres version 9.4. The database should only be accessible by other microservices behind your firewall. It listens for connections on port 5432. The database stores its data in `/var/lib/postgresql/data`, and it needs to persist. It doesn't require network-based persistent storage, a local directory mount will do.

Finally, other microservices expect to reach this microservice with the name "db" on port 5432.