# Spring-Chatroom
## End-to-End Bank Application Deployment using DevSecOps on AWS EKS
A real-time one to one chat web application built using Java 17, MySQL, Spring Boot, Spring Security, WebSocket, and Thymeleaf. This application allows users to chat with other users is a seperate environment, featuring a modern tech stack with a responsive user interface.


## Setup Instructions

### PRE-REQUISITES FOR THIS PROJECT:
- AWS Account
- AWS Ubuntu EC2 instance (t2.medium)
- Install Docker
- Install docker compose
- Java 17 or higher
- Maven 3.6+

### STEPS TO IMPLEMENT THE PROJECT
- **<p id="Docker">Deployment using Docker</p>**
 
  - Clone the repository
  ```bash
  git clone 
  ```
  #
  - Install docker, docker compose and provide neccessary permission
  ```bash
  sudo apt update -y

  sudo apt install docker.io docker-compose-v2 -y

  sudo usermod -aG docker $USER && newgrp docker
  ``` 
  #
  - Move to the cloned repository
  ```bash
  cd ChatApp
  ```
  #
 
2. Create MySQL database using [SQLScript](src/main/resources/static/sql-script/SQLScript.txt)

3. Update MySQL password in [application.properties](src/main/resources/application.properties)


## Containerisation

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
   
    Open your browser and navigate to `http://<Server_IP>:8081`.

 ### Congratulations, you have deployed the application using Docker 
  #
- **<p id="dockercompose">Deployment using Docker compose</p>**
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


![Login Page](src/main/resources/static/screenshots/login_screenshot.png)
![Register Page](src/main/resources/static/screenshots/register_screenshot.png)
![Chat App Page](src/main/resources/static/screenshots/chatapp_screenshot.png)
