pipeline {
    agent any

    environment {
        IMAGE_NAME = "rishi0655/mentorbaba-quiz-app"
        CONTAINER_NAME = "quiz-app"
    }

    stages {
        stage('Clone Repository') {
            steps {
               git branch: 'main', url: 'https://github.com/rishi0655/mentor-baba-quiz-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -f Dockerfile_simple -t ${IMAGE_NAME}:simple ."
                }
            }
        }

        stage('Stop Old Container (if running)') {
            steps {
                script {
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                }
            }
        }

        stage('Run New Container') {
            steps {
                script {
                    sh """
                        docker run -d -p 5000:5000 \\
                        --name ${CONTAINER_NAME} ${IMAGE_NAME}:simple
                    """
                }
            }
        }
    }
}