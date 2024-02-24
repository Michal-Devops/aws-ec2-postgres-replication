#!/bin/bash

echo "Installing PostgreSQL on Red Hat..."

# Update the system
sudo dnf update -y

# Install PostgreSQL 13 from RPM package
# Remove the following line if you want to install PostgreSQL 15 instead
sudo dnf install -y postgresql-server

# Install PostgreSQL 15 by selecting stream (version) 15 from the postgresql module and specifying the server profile
# Uncomment the following lines if you prefer to install PostgreSQL 15 instead of PostgreSQL 13
# sudo dnf module disable -y postgresql
# sudo dnf module enable -y postgresql:15
# sudo dnf module install -y postgresql:15/server

# The postgres superuser is created automatically

# Initialize the database cluster
echo "Initializing the database cluster..."
sudo postgresql-setup --initdb

# Red Hat recommends storing the data in the default /var/lib/pgsql/data directory

# Start the postgresql service
echo "Starting the PostgreSQL service..."
sudo systemctl start postgresql.service

# Enable the postgresql service to start at boot
echo "Setting the PostgreSQL service to start at boot..."
sudo systemctl enable postgresql.service

echo "PostgreSQL installation completed successfully."
