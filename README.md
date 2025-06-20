# Lab 12 - Final Project Assignment

## Student Information

**Name and Surname:** Rushford  
**Student ID:** 20232066  
**School:** North Minzu University, Software Engineering

## Personal Image
![Rushford](Rushoford.jpg)

## Application URLs

- **Todo Application**: http://39.105.7.134:8081/
- **Advanced Todo Application**: http://39.105.7.134:8082/

---

## Project Overview

This repository contains the final project for Lab 12, which includes:

### 1. Personal Profile Website
- **Description:** Responsive website showcasing personal information, skills, and educational background
- **Tech Stack:** HTML5, CSS3, Bootstrap 5
- **Deployment:** Dockerized with Nginx

### 2. Todo Application
- **Description:** Full-featured todo management application
- **Features:**
  - ✅ Add, edit, delete todo items
  - ✅ Mark completion status
  - ✅ Local data storage
  - ✅ Responsive design
  - ✅ Statistics functionality
- **Tech Stack:** HTML5, CSS3, JavaScript (ES6+), Bootstrap 5
- **Deployment:** Dockerized web application

### 3. Advanced Todo Application
- **Description:** Enhanced todo management system using Vikunja
- **Features:**
  - 📊 Advanced project management
  - 👥 Team collaboration
  - 📅 Calendar integration
  - 🔔 Notifications
- **Tech Stack:** Vikunja (Go-based application)
- **Deployment:** Docker container with SQLite database

## Technical Implementation

### 🐳 Containerization
- **Docker:** Application containerization
- **Docker Compose:** Multi-service orchestration
- **Nginx:** Web server for static content

### 🚀 Deployment
- **Platform:** Alibaba Cloud ECS
- **Operating System:** Ubuntu 20.04 LTS
- **Server IP:** 39.105.7.134
- **Ports:**
  - 8081: Todo Application
  - 8082: Advanced Todo Application

### 🛡️ Security Features
- UFW Firewall configuration
- Fail2Ban for SSH protection
- Docker security best practices
- Isolated container networks

## Project Structure

```
lab12-final-project/
├── profile.html              # Personal profile page
├── Rushoford.jpg            # Personal photo
├── Dockerfile               # Docker build configuration
├── docker-compose.yml       # Multi-container setup
├── todo-app/
│   └── index.html          # Todo application frontend
├── .github/
│   └── workflows/
│       └── deploy.yml      # CI/CD pipeline
└── README.md               # Project documentation
```

## Deployment Information

### Local Development
```bash
# Clone repository
git clone https://github.com/YOUR_USERNAME/lab12-final-project.git
cd lab12-final-project

# Build and run containers
docker-compose up -d --build

# Access applications
# Personal Website: http://localhost:8080
# Todo App: http://localhost:8081
# Advanced Todo: http://localhost:8082
```

### Production Deployment
- **Cloud Provider:** Alibaba Cloud
- **Instance Type:** ECS (Elastic Compute Service)
- **Deployment Method:** Docker Compose
- **Access URLs:**
  - Todo Application: http://39.105.7.134:8081/
  - Advanced Todo Application: http://39.105.7.134:8082/

## Features Completed

### ✅ Requirements Fulfilled
- [x] Personal website creation with individual information
- [x] Docker containerization of applications
- [x] Docker Compose for multi-service deployment
- [x] GitHub repository with public access
- [x] Todo application integration
- [x] Cloud deployment on Alibaba Cloud
- [x] README with required information

### 🎯 Additional Features
- Responsive design for mobile devices
- Modern UI with Bootstrap framework
- Real-time todo management
- Data persistence
- Professional deployment setup
- Security hardening

## Technologies Used

- **Frontend:** HTML5, CSS3, JavaScript (ES6+), Bootstrap 5
- **Containerization:** Docker, Docker Compose
- **Web Server:** Nginx
- **Database:** SQLite (for advanced todo app)
- **Cloud Platform:** Alibaba Cloud ECS
- **CI/CD:** GitHub Actions
- **Security:** UFW, Fail2Ban

## Contact Information

- **Email:** 274170836@qq.com
- **WeChat:** child
- **GitHub:** [Repository Link]

---

**Project Status:** ✅ **COMPLETED**

*This project successfully fulfills all requirements for Lab 12, including personal website development, Docker containerization, cloud deployment, and todo application integration.* 