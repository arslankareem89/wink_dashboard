pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Getting Flutter source code'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Running flutter pub get'
            }
        }

        stage('Test') {
            steps {
                echo 'Running Flutter tests'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image'
            }
        }
    }
}
