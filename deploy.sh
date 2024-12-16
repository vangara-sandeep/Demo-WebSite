#!/bin/bash

# Ensure that Maven is installed
echo "Checking if Maven is installed..."
if ! command -v mvn &> /dev/null
then
    echo "Maven could not be found. Please install Maven."
    exit 1
fi

# Ensure that Java is installed
echo "Checking if Java is installed..."
if ! command -v java &> /dev/null
then
    echo "Java could not be found. Please install Java."
    exit 1
fi

# Ensure frontend setup
echo "Building React Frontend..."
cd frontend

# If `package.json` is missing, run this to create the React app
if [ ! -f package.json ]; then
    echo "React app not found. Creating a new React app..."
    npx create-react-app .
fi

# Install dependencies and build the React app
npm install
npm run build
echo "React Frontend build complete."
cd ..

# Backend Setup (Maven)
echo "Building Spring Boot Backend..."

# Check if `pom.xml` exists in the backend folder
if [ ! -f backend/pom.xml ]; then
    echo "pom.xml not found in the backend directory. Ensure that this file exists."
    exit 1
fi

cd backend
mvn clean install

# Check if build was successful
if [ $? -ne 0 ]; then
    echo "Maven build failed. Please check the error messages above."
    exit 1
fi

echo "Spring Boot Backend build complete."
cd ..

# Run Backend
echo "Running Backend..."
cd backend
mvn spring-boot:run &  # Run in background to allow frontend to start

# Run Frontend
echo "Running Frontend..."
cd frontend
npm start
