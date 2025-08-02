pipeline {
    agent any

    environment {
        FLASK_APP = "app.py"
        FLASK_ENV = "development"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/rishi0655/mentor-baba-quiz-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Flask App') {
            steps {
                sh '''
                    . venv/bin/activate
                    nohup python3 app.py > output.log 2>&1 &
                '''
            }
        }
    }
}

