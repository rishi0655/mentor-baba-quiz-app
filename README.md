# Mentor Baba Quiz App - DevOps CI/CD Pipeline

## Project Overview
Complete DevOps implementation with CI/CD pipeline for Flask Quiz Application using Jenkins, Docker, and AWS.

## Architecture
- **Frontend**: Flask with HTML/CSS/JS
- **Backend**: Python Flask
- **Database**: MySQL
- **Containerization**: Docker
- **CI/CD**: Jenkins Pipeline
- **Deployment**: AWS EC2
- **Registry**: Docker Hub

## Pipeline Stages
1. **Checkout** - Pull code from GitHub
2. **Build** - Install dependencies
3. **Test** - Run unit tests
4. **Docker Build** - Create container image
5. **Docker Push** - Push to Docker Hub
6. **Deploy** - Deploy to AWS EC2

## Setup Instructions

### 1. Local Development
```bash
pip install -r requirements.txt
python app.py
```

### 2. Docker Setup
```bash
docker build -t mentor-baba-quiz-app .
docker run -p 5000:5000 mentor-baba-quiz-app
```

### 3. Docker Compose
```bash
docker-compose up -d
```

### 4. Jenkins Setup
1. Install Jenkins on EC2
2. Install required plugins:
   - Docker Pipeline
   - GitHub Integration
   - Email Extension
3. Configure Docker Hub credentials
4. Create pipeline job with GitHub webhook

### 5. AWS Free Tier Setup
- **EC2 t2.micro** (750 hours/month free)
- **Security Groups**: Port 80, 22, 5000
- **Docker Installation** on EC2

## Files Structure
```
├── app.py              # Main Flask application
├── Dockerfile          # Container configuration
├── Jenkinsfile         # CI/CD pipeline
├── docker-compose.yml  # Multi-container setup
├── deploy.sh           # AWS deployment script
├── init.sql            # Database initialization
├── requirements.txt    # Python dependencies
├── tests/              # Unit tests
├── templates/          # HTML templates
└── static/             # CSS/JS files
```

## Pipeline Demo
1. Push code to GitHub
2. Jenkins automatically triggers
3. Pipeline runs all stages
4. Docker image built and pushed
5. Application deployed to AWS
6. Email notification sent

## Monitoring
- Jenkins build logs
- Docker container logs
- AWS CloudWatch (optional)

## Security
- Credentials stored in Jenkins
- Environment variables for secrets
- Docker image scanning

## Cost Optimization
- AWS Free Tier usage
- Container resource limits
- Automated scaling policies