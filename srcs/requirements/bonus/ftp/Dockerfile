# Use Debian Bookworm as the base image
FROM debian:bookworm

# Set the working directory
WORKDIR /app

# Copy the script to the container
COPY run.sh /app/

# Make the script executable
RUN chmod +x run.sh

# Install vsftpd and other dependencies (if not already installed in the Debian Bookworm image)
RUN apt-get update && \
    apt-get install -y vsftpd

# Expose FTP ports
EXPOSE 21 

# Start vsftpd service when the container runs
CMD ["/app/run.sh"]
