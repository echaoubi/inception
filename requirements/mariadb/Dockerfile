# Use debian:buster as the base image
FROM debian:buster

# Update and upgrade packages
RUN apt-get update -y && apt-get upgrade -y

# Install MariaDB server
RUN apt-get install -y mariadb-server

# Copy the custom MariaDB configuration
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the initialization script
COPY mariascript.sh /mariascript.sh
RUN chmod +x /mariascript.sh

# Define the entrypoint
ENTRYPOINT ["/mariascript.sh"]

