#!/bin/bash

# Step 1: Compile Java servlet
javac -classpath /path/to/servlet-api.jar -d /path/to/output /path/to/your/LoginServlet.java

# Step 2: Start the Java web server (e.g., Tomcat)
# Change the path below to point to your Tomcat installation
export CATALINA_HOME=/path/to/tomcat
$CATALINA_HOME/bin/startup.sh

# Step 3: Expose the site on port 8080
echo "VTalent website is now running on http://localhost:8080"
