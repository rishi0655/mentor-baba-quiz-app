pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/YOUR_USERNAME/mentor-baba-quiz-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("mentorbaba-quiz-app")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker rm -f quizapp || true"
                    sh "docker run -d -p 5000:5000 --name quizapp mentorbaba-quiz-app"
                }
            }
        }
    }
}
