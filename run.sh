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
    echo -e "\033[0;31mPackage update and upgrade failed. Exiting...\033[0m"
    exit 1
fi

# Install Apache2
print_green "Installing Apache2 web server..."
sudo apt install apache2 -y
if [ $? -ne 0 ]; then
    echo -e "\033[0;31mApache2 installation failed. Exiting...\033[0m"
    exit 1
fi

# Clean the Apache2 default directory
print_green "Removing files from the default Apache web directory..."
sudo rm -rf /var/www/html/*
if [ $? -ne 0 ]; then
    echo -e "\033[0;31mFailed to remove files from /var/www/html/. Exiting...\033[0m"
    exit 1
fi

# Copy the current files to the Apache2 web directory
print_green "Copying current files to /var/www/html/..."
sudo cp * /var/www/html/
if [ $? -ne 0 ]; then
    echo -e "\033[0;31mFailed to copy files. Exiting...\033[0m"
    exit 1
fi

# Set permissions safely
print_green "Setting file permissions for index.html and welcome.html..."

for file in index.html welcome.html; do
    if [ -f "/var/www/html/$file" ]; then
        sudo chmod 666 "/var/www/html/$file"
    else
        echo -e "\033[0;33mWarning: $file not found in /var/www/html/.\033[0m"
    fi
done

# Print completion message in green
print_green "Server setup completed successfully!"
