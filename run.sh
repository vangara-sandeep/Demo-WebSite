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

# Copy only index.html to Apache2 web directory
print_green "Copying index.html to /var/www/html/..."
if [ -f index.html ]; then
    sudo cp index.html /var/www/html/
    if [ $? -ne 0 ]; then
        echo -e "\033[0;31mFailed to copy index.html. Exiting...\033[0m"
        exit 1
    fi
else
    echo -e "\033[0;31mindex.html not found in current directory. Exiting...\033[0m"
    exit 1
fi

# Change file permissions
print_green "Setting file permissions for index.html..." 
sudo chmod 644 /var/www/html/index.html
if [ $? -ne 0 ]; then
    echo -e "\033[0;31mFailed to change file permissions. Exiting...\033[0m"
    exit 1
fi

# Print completion message in green
print_green "Server setup completed successfully!"
