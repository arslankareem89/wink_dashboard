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

        stage('Deploy Container') {
            steps {
                sh '''
                docker stop wink-dashboard || true
                docker rm wink-dashboard || true

                docker run -d \
                --name wink-dashboard \
                -p 8081:80 \
                wink-dashboard
                '''
            }
        }
    }
}
