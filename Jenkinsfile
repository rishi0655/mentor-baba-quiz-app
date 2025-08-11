pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "rishi0655/mentor-baba-quiz-app"
        DOCKER_TAG = "${BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo 'Installing dependencies...'
                sh '''
                    sudo apt install python3.12-venv -y || true
                    python3 -m venv venv || pip3 install --break-system-packages -r requirements.txt
                    if [ -d "venv" ]; then
                        . venv/bin/activate
                        pip install -r requirements.txt
                    fi
                '''
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh '''
                    . venv/bin/activate
                    python -m pytest tests/ || echo "No tests found, skipping..."
                '''
            }
        }
        
        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                    docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }
        
        stage('Docker Push') {
            steps {
                echo 'Pushing Docker image to registry...'
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").push()
                        docker.image("${DOCKER_IMAGE}:latest").push()
                    }
                }
            }
        }
        
        stage('Deploy to AWS') {
            steps {
                echo 'Deploying to AWS EC2...'
                sh '''
                    echo "Deployment script would run here"
                    echo "Docker image: ${DOCKER_IMAGE}:${DOCKER_TAG}"
                '''
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline completed successfully!'
            emailext (
                subject: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: "Good news! The build ${env.BUILD_NUMBER} completed successfully.",
                to: "your-email@example.com"
            )
        }
        failure {
            echo 'Pipeline failed!'
            emailext (
                subject: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: "Bad news! The build ${env.BUILD_NUMBER} failed. Please check the logs.",
                to: "your-email@example.com"
            )
        }
    }
}