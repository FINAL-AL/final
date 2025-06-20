# 🚀 Lab 12 Final Project - Setup Instructions

## Quick Start Guide

### Prerequisites
- Docker and Docker Compose installed
- Git installed
- Your personal photo file named `Rushoford.jpg`

### 🎯 Step 1: Add Your Photo
1. **Add your personal photo** as `Rushoford.jpg` in the root directory
2. The photo should be a clear portrait image (recommended: 400x400px or larger)

### 🚀 Step 2: Deploy Locally
```bash
# Make deployment script executable
chmod +x deploy.sh

# Run deployment
./deploy.sh
```

### 🌐 Step 3: Access Applications
After successful deployment:
- **Personal Website**: http://localhost:8080
- **Todo Application**: http://localhost:8081  
- **Advanced Todo**: http://localhost:8082

## 🐙 GitHub Repository Setup

### Step 1: Create GitHub Repository
1. Create a new repository on GitHub
2. Name it: `lab12-final-project` (or your preferred name)
3. Set it to **Public** (required for assignment)

### Step 2: Push Code
```bash
git init
git add .
git commit -m "Lab 12: Complete project with Docker & GitHub Actions"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/REPOSITORY_NAME.git
git push -u origin main
```

### Step 3: Configure GitHub Secrets
For GitHub Actions to work, add these secrets in your repository:

**Settings → Secrets and variables → Actions → New repository secret**

| Secret Name | Description | Example Value |
|-------------|-------------|---------------|
| `DOCKERHUB_USERNAME` | Your Docker Hub username | `rushford123` |
| `DOCKERHUB_TOKEN` | Docker Hub Access Token | `dckr_pat_xxxx...` |
| `SERVER_HOST` | Your server IP address | `39.105.7.134` |
| `SERVER_USER` | Server username | `root` |
| `SERVER_SSH_KEY` | SSH private key for server | `-----BEGIN PRIVATE KEY-----...` |

#### How to get Docker Hub Token:
1. Login to [Docker Hub](https://hub.docker.com/)
2. Account Settings → Security → New Access Token
3. Copy the generated token

## ☁️ Cloud Deployment (Alibaba Cloud)

### Server Requirements
- **Instance**: ECS t5.large (2GB RAM minimum)
- **OS**: Ubuntu 20.04 LTS
- **Disk**: 40GB SSD
- **Ports**: 22, 80, 443, 8080, 8081, 8082

### Quick Server Setup
```bash
# Run this on your server
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clone and deploy
git clone https://github.com/YOUR_USERNAME/REPOSITORY_NAME.git
cd REPOSITORY_NAME
chmod +x deploy.sh
./deploy.sh
```

## 📋 Project Structure Overview

```
lab12-final-project/
├── profile.html              # Personal portfolio page
├── Rushoford.jpg            # Your photo (add this file!)
├── Dockerfile               # Container build instructions
├── docker-compose.yml       # Multi-service deployment
├── deploy.sh               # Local deployment script
├── README.md               # Project documentation
├── SETUP_INSTRUCTIONS.md   # This file
├── .gitignore             # Git ignore rules
├── .github/
│   └── workflows/
│       └── deploy.yml     # GitHub Actions CI/CD
└── todo-app/
    └── index.html         # Todo application
```

## 🔧 Troubleshooting

### Common Issues

1. **Port already in use**
   ```bash
   # Stop conflicting services
   sudo lsof -ti:8080 | xargs kill -9
   sudo lsof -ti:8081 | xargs kill -9
   sudo lsof -ti:8082 | xargs kill -9
   ```

2. **Docker permission denied**
   ```bash
   sudo usermod -aG docker $USER
   newgrp docker
   ```

3. **Images not building**
   ```bash
   docker system prune -a
   docker compose build --no-cache
   ```

4. **GitHub Actions failing**
   - Check that all secrets are correctly set
   - Verify Docker Hub credentials
   - Ensure server SSH access

### Useful Commands

```bash
# View application logs
docker compose logs -f

# Restart services
docker compose restart

# Update and rebuild
git pull
docker compose up -d --build

# Check resource usage
docker stats

# Clean up unused resources
docker system prune -a
```

## ✅ Assignment Submission Checklist

- [ ] Personal photo added as `Rushoford.jpg`
- [ ] All applications running locally
- [ ] GitHub repository created and set to public
- [ ] Code pushed to GitHub
- [ ] GitHub Actions configured and working
- [ ] Applications deployed to cloud server
- [ ] README.md contains all required information:
  - [ ] Name and surname: Rushford
  - [ ] Student ID: 20232066
  - [ ] Personal image displayed
  - [ ] Application URLs provided
- [ ] Repository URL submitted

## 🎯 Application URLs (Update these in README.md)

**Production URLs** (Update with your server IP):
- Todo Application: http://39.105.7.134:8081/
- Advanced Todo Application: http://39.105.7.134:8082/

**Local Development URLs**:
- Personal Website: http://localhost:8080
- Todo Application: http://localhost:8081
- Advanced Todo Application: http://localhost:8082

---

**Good luck with your Lab 12 submission! 🎉**

*If you encounter any issues, check the troubleshooting section above or review the Docker and GitHub Actions logs for detailed error information.* 