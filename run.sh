#!/bin/bash

# Print a starting message
echo "Starting the server setup..."

# Update and upgrade the system packages
echo "Updating and upgrading system packages..."
sudo apt update -y && sudo apt upgrade -y
if [ $? -ne 0 ]; then
    echo "Package update and upgrade failed. Exiting..."
    exit 1
fi

# Install Apache2
echo "Installing Apache2 web server..."
sudo apt install apache2 -y
if [ $? -ne 0 ]; then
    echo "Apache2 installation failed. Exiting..."
    exit 1
fi

# Clean the Apache2 default directory
echo "Removing files from the default Apache web directory..."
sudo rm -rf /var/www/html/*
if [ $? -ne 0 ]; then
    echo "Failed to remove files from /var/www/html/. Exiting..."
    exit 1
fi

# Copy the current files to the Apache2 web directory
echo "Copying current files to /var/www/html/..."
sudo cp * /var/www/html/
if [ $? -ne 0 ]; then
    echo "Failed to copy files. Exiting..."
    exit 1
fi

# Change file permissions
echo "Setting file permissions for index.html and welcome.html..."
sudo chmod 666 /var/www/html/index.html
sudo chmod 666 /var/www/html/welcome.html
if [ $? -ne 0 ]; then
    echo "Failed to change file permissions. Exiting..."
    exit 1
fi

# Print completion message
echo "Server setup completed successfully!"
