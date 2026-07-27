pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out Flutter project'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'flutter pub get'
            }
        }

        stage('Test') {
            steps {
                sh 'flutter test'
            }
        }

        stage('Build Flutter Web') {
            steps {
                sh 'flutter build web --release'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t wink-dashboard .'
            }
        }

    }
}
