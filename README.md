# Spring-Chatroom
## End-to-End Chat Application Deployment using DevSecOps on AWS EKS
A real-time one to one chat web application built using Java 17, MySQL, Spring Boot, Spring Security, WebSocket, and Thymeleaf. This application allows users to chat with other users is a seperate environment, featuring a modern tech stack with a responsive user interface.

![Login Page](src/main/resources/static/screenshots/login_screenshot.png)
![Register Page](src/main/resources/static/screenshots/register_screenshot.png)
![Chat App Page](src/main/resources/static/screenshots/chatapp_screenshot.png)

## Setup Instructions

### PRE-REQUISITES FOR THIS PROJECT:
- AWS Account
- AWS Ubuntu EC2 instance (t2.medium)
- Install Docker
- Install docker compose

### DEPLOYMENT:
| Deployments    | Paths |
| -------- | ------- |
| Deployment using Docker and Networking | <a href="#Docker">Click me </a>     |
| Deployment using Docker Compose | <a href="#dockercompose">Click me </a>     |
| Deployment using Kubernetes | <a href="#Kubernetes">Click me </a>     |

### STEPS TO IMPLEMENT THE PROJECT
  #
  - Move to the cloned repository
  ```bash
  cd Spring_Chatapp_3_Tier 
  ```
  #

- Create MySQL database using [SQLScript](src/main/resources/static/sql-script/SQLScript.txt)

- Update MySQL password in [application.properties](src/main/resources/application.properties)


## Containerisation
- ### **<p id="Docker">Deployment using Docker</p>**
 
  #
  - Install docker, docker compose and provide neccessary permission
  ```bash
  sudo apt update -y

  sudo apt install docker.io -y

  sudo usermod -aG docker $USER && newgrp docker
  ``` 

  **Build the Project**:
   ```sh
   docker build -t sidraut007/chatapp
   
   ```
  
  **Create a docker network**
  ```bash
  docker network create chatapp
  ```

  **Run MySQL Database**:

  ```
  
  docker run -itd --name mysql -e MYSQL_ROOT_PASSWORD=Test@1234 -e MYSQL_DATABASE=chatapp --network=chatapp mysql:5.7

  ```
  **Run the Application**:
  ```
  
    docker run -itd --name chatpp -e SPRING_DATASOURCE_USERNAME="root" -e SPRING_DATASOURCE_URL="jdbc:mysql://mysql:3306/chatapp?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC" -e SPRING_DATASOURCE_PASSWORD="Test@1234" --network=chatapp -p 8081:8080 sidraut007/chatapp

  ```

**Access the Application**:
   
    Open your browser and navigate to http://<Server_IP>:8081

 ### Congratulations, you have deployed the application using Docker 
  #
- ### **<p id="dockercompose">Deployment using Docker compose</p>**
- Install docker compose

```bash
sudo apt update
sudo apt install docker-compose-v2 -y
```
#
- Run docker-compose file present in the root directory of a project
```bash
docker compose up -d
```
#
- Access it on port 8080
```bash
  http://<public-ip>:8080
```

#
- ### **<p id="Kubernetes">Deployment using Kubernetes</p>**

- Move to the K8s/manifest
  ```bash
  cd Spring_Chatapp_3_Tier/K8s/manifest
  ```

#### STEP1: MYSQL SETUP

- Deploy MYSQL Backend

```bash
kubectl apply -f mysql-secret.yaml

kubectl apply -f mysql-deploy.yaml

kubectl apply -f mysql-service.yaml
```

#### STEP2: ChatApp SETUP

- Deploy Chatapp deployment

```bash
kubectl apply -f chatapp-secret.yaml

kubectl apply -f chatapp-configmap.yaml

kubectl apply -f chatapp-service.yaml

kubectl apply -f chatapp-deploy.yaml
```

- How To Access it over Internet

```bash
kubectl get svc

kubectl port-forward svc/chatapp-service 8080:80
```

### HOW TO ACCESS

- This steps is required only who are using everything on laptop

```bash
  http://localhost:80
```

- If you are using EC2:
  create nodeport type service
```bash
  http://<server-ip>:nodeport
```

### Congratulations, you have deployed the application using Kubernetes Cluster 
