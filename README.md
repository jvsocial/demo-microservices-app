# demo-microservices-app

simplest microservices architecture with two services: a frontend service and a backend service. Both services are designed to run in containers, and there's a Jenkinsfile for continuous integration and deployment.

We broken monolithic application in to a web server and another microservice component using Node.js.
Node.js microservice serves as an additional component to demonstrate a simple microservices architecture. The purpose of including a Node.js microservice in this context is to illustrate the separation of concerns and the use of microservices to perform specific tasks independently.

Here's a breakdown of the components in the repository and their purposes:

Web Server:

Location: frontend/
Purpose: Serves a basic HTML page.
Technology: Nginx (configured with a simple index.html).

Microservice:

Location: backend/
Purpose: Provides a simple Node.js-based microservice.
Technology: Node.js with Express.
The inclusion of the Node.js microservice demonstrates the idea of a microservices architecture, where different components of an application are developed and deployed independently, communicating with each other through well-defined interfaces (APIs).

In a more complex real-world scenario, a microservice might be responsible for handling specific business logic, data processing, or interacting with external services. Microservices are designed to be modular, independently deployable, and scalable. They allow teams to work on different parts of an application without being tightly coupled to each other.

In summary, the Node.js microservice in this example serves as a representation of a microservices-based approach, showcasing how different components with different technologies can work together in a loosely coupled manner within a larger system.

Usage:

- Ensure you have Docker, Jenkins, and an EC2 instance with Ubuntu 20.04 installed and configured.
- Create a new pipeline job in Jenkins and configure it to use the Jenkinsfile in your repository.
- When the Jenkins pipeline runs, it will build Docker images for the web server and microservice and deploy them on your EC2 instance.

This is a minimal example for demonstration purposes, and you may need to adapt it based on your specific requirements and security considerations, especially regarding Docker deployment on EC2.

The code for the frontend is in the frontend folder, and the code for the backend is in the backend folder. The Jenkinsfile remains at the root of the repository for CI/CD purposes. This separation allows for a more organized and modular codebase for each microservice.

## Services

### Frontend Service

The frontend service is a lightweight web server using Nginx. It displays a simple HTML page and communicates with the backend service to fetch and display a greeting.

#### Build and Run

```bash
cd frontend
docker build -t demo-microservices-app-frontend:latest .
docker run -d -p 80:80 demo-microservices-app-frontend:latest
```
## Stop micro service 
```
sh 'docker stop $(docker ps -q --filter ancestor=frontend:latest)'
sh 'docker stop $(docker ps -q --filter ancestor=backend:latest)'
sh 'docker rm $(docker ps -a -q --filter ancestor=frontend:latest)'
sh 'docker rm $(docker ps -a -q --filter ancestor=backend:latest)'

```
