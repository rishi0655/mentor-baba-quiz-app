pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/rishi0655/mentor-baba-quiz-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'python3 -m pip install --break-system-packages -r requirements.txt'
            }
        }

        stage('Run Flask App') {
            steps {
                sh 'fuser -k 5000/tcp || true'
                sh 'nohup python3 app.py > output.log 2>&1 &'
            }
        }
    }
}

