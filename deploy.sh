#!/bin/bash

# Ensure frontend setup
echo "Building React Frontend..."
cd frontend

# If `package.json` is missing, run this to create the React app
if [ ! -f package.json ]; then
    echo "React app not found. Creating a new React app..."
    npx create-react-app .
fi

npm install
npm run build
echo "React Frontend build complete."
cd ..

# Backend Setup (Maven)
echo "Building Spring Boot Backend..."
cd backend
mvn clean install
echo "Spring Boot Backend build complete."
cd ..

# Run Backend
echo "Running Backend..."
cd backend
mvn spring-boot:run &

# Run Frontend
echo "Running Frontend..."
cd frontend
npm start
