
pipeline {
    agent any

    environment {
        IMAGE_NAME = "mentor-baba-quiz-app"
        CONTAINER_NAME = "mentor-baba-quiz-app"
        ENV_PATH = "/home/ubuntu/mentor-baba-quiz-app/.env"
    }

    stages {
        stage('Clone Repository') {
            steps {
               git branch: 'main', url: 'https://github.com/rishi0/mentor-baba-quiz-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:latest ."
                }
            }
        }
        
        stage("Push to Docker Hub"){
            steps {
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId: 'dockerHub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                        echo \$DOCKER_PASS | docker login -u \$DOCKER_USER --password-stdin
                        docker tag ${IMAGE_NAME}:latest \$DOCKER_USER/mntor-baba-quiz-app:latest
                        docker push \$DOCKER_USER/mentor-baba-quiz-app:latest
                    """
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
                        --env-file=${ENV_PATH} \\
                        --name ${CONTAINER_NAME} ${IMAGE_NAME}:latest
                    """
                }
            }
        }
    }
}
