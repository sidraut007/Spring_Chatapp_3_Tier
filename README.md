# Goldencat Chatroom

A real-time one to one chat web application built using Java 17, MySQL, Spring Boot, Spring Security, WebSocket, and Thymeleaf. This application allows users to chat with other users is a seperate environment, featuring a modern tech stack with a responsive user interface.


## Setup Instructions

### Prerequisites
- Java 17 or higher
- Maven 3.6+

### Steps to Run Locally

1. **Clone the Repository**:
   ```sh
   git clone https://github.com/Goldencat98/ChatApp.git
   cd ChatApp
   ```
   
2. Create MySQL database using [SQLScript](src/main/resources/static/sql-script/SQLScript.txt)

3. Update MySQL password in [application.properties](src/main/resources/application.properties)

4. # Containerisation

  **Build the Project**:
   ```sh
   docker build -t sidraut007/chatapp
   
   ```

  **Run MySQL Database**:

  ```
  
  docker run -itd --name mysql -e MYSQL_ROOT_PASSWORD=Test@1234 -e MYSQL_DATABASE=chatapp --network=chatapp mysql:5.7

  ```
  **Run the Application**:
  ```
  
    docker run -itd --name chatpp -e SPRING_DATASOURCE_USERNAME="root" -e SPRING_DATASOURCE_URL="jdbc:mysql://mysql:3306/chatapp?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC" -e SPRING_DATASOURCE_PASSWORD="Test@1234" --network=chatapp -p 8081:8080 sidraut007/chatapp

  ```

5. **Access the Application**:
   
    Open your browser and navigate to `http://<Server_IP>:8081`.


![Login Page](src/main/resources/static/screenshots/login_screenshot.png)
![Register Page](src/main/resources/static/screenshots/register_screenshot.png)
![Chat App Page](src/main/resources/static/screenshots/chatapp_screenshot.png)
