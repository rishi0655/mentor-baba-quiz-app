pipeline {
    agent any

    stages {
        stage('Clone Code') {
            steps {
                git 'https://github.com/rishi0655/mentor-baba-quiz-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t mentorbabaa-app .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -d -p 8081:8080 --name mentorbabaa mentorbabaa-app || true'
                }
            }
        }
    }
}
