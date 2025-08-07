# Mentor Baba Quiz App - CI/CD Pipeline

## 🚀 Quick Setup Guide

### Prerequisites
- Docker installed
- Jenkins installed
- AWS CLI configured
- GitHub account

### Local Development
```bash
# Clone repository
git clone https://github.com/rishi0655/mentor-baba-quiz-app.git
cd mentor-baba-quiz-app

# Build and run with Docker
docker build -t quiz-app .
docker run -p 5000:5000 quiz-app
```

### CI/CD Pipeline Steps

1. **Code Push** → GitHub
2. **Jenkins Trigger** → Automatic build
3. **Docker Build** → Create container image
4. **Tests Run** → Automated testing
5. **Push to Registry** → Docker Hub
6. **Deploy to AWS** → EC2/ECS deployment

### Jenkins Setup
1. Install Docker Pipeline plugin
2. Add DockerHub credentials as 'dockerhub-credentials'
3. Configure webhook from GitHub
4. Update Jenkinsfile with your details

### AWS Deployment
- Update `deploy/deploy-to-ec2.sh` with your details
- Configure AWS credentials in Jenkins
- Set up EC2 instance with Docker

## 📁 Project Structure
```
├── app.py              # Main Flask application
├── requirements.txt    # Python dependencies
├── Dockerfile         # Container configuration
├── Jenkinsfile        # CI/CD pipeline
├── tests/             # Test files
├── deploy/            # Deployment scripts
├── static/            # CSS, JS files
└── templates/         # HTML templates
```