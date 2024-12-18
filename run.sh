#!/bin/bash

# Function to print messages in green
print_green() {
    echo -e "\033[0;32m$1\033[0m"
}

# Print a starting message
print_green "Starting the server setup..."

# Update and upgrade the system packages
print_green "Updating and upgrading system packages..."
sudo apt update -y && sudo apt upgrade -y
if [ $? -ne 0 ]; then
    print_green "Package update and upgrade failed. Exiting..."
    exit 1
fi

# Install Apache2
print_green "Installing Apache2 web server..."
sudo apt install apache2 -y
if [ $? -ne 0 ]; then
    print_green "Apache2 installation failed. Exiting..."
    exit 1
fi

# Clean the Apache2 default directory
print_green "Removing files from the default Apache web directory..."
sudo rm -rf /var/www/html/*
if [ $? -ne 0 ]; then
    print_green "Failed to remove files from /var/www/html/. Exiting..."
    exit 1
fi

# Copy the current files to the Apache2 web directory
print_green "Copying current files to /var/www/html/..."
sudo cp * /var/www/html/
if [ $? -ne 0 ]; then
    print_green "Failed to copy files. Exiting..."
    exit 1
fi

# Change file permissions
print_green "Setting file permissions for index.html and welcome.html..."
sudo chmod 666 /var/www/html/index.html
sudo chmod 666 /var/www/html/welcome.html
if [ $? -ne 0 ]; then
    print_green "Failed to change file permissions. Exiting..."
    exit 1
fi

# Print completion message
print_green "Server setup completed successfully!"
