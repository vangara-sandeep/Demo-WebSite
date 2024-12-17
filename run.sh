#!/bin/bash

# Set Tomcat directory path
CATALINA_HOME="/usr/share/tomcat9"
TOMCAT_WEBAPPS="$CATALINA_HOME/webapps"

# Step 1: Build and deploy your application
# For this example, copy your project files to the Tomcat webapps folder.
cp -r /home/ubuntu/your-repository /usr/share/tomcat9/webapps/vtalent

# Step 2: Restart Tomcat to deploy the new app
sudo systemctl restart tomcat9

# Step 3: Expose the site on port 8080
echo "VTalent website is now running on http://<your-ec2-public-ip>:8080/vtalent"
