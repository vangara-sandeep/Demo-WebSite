#!/bin/bash

# Frontend Setup
echo "Building React Frontend..."
cd frontend
npm install
npm run build
echo "React Frontend build complete."
cd ..

# Backend Setup
echo "Building Spring Boot Backend..."
cd backend
mvn clean install
echo "Spring Boot Backend build complete."

# Run Backend
echo "Running Backend..."
mvn spring-boot:run &

# Run Frontend
echo "Running Frontend..."
cd frontend
npm start
