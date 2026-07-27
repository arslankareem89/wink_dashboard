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
                sh '''
                flutter pub get
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                flutter test
                '''
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'sonar-scanner'

                    withSonarQubeEnv('sonarqube') {
                        sh """
                        ${scannerHome}/bin/sonar-scanner \
                        -Dsonar.projectKey=wink-dashboard \
                        -Dsonar.projectName=wink-dashboard \
                        -Dsonar.sources=.
                        """
                    }
                }
            }
        }

        stage('Build Flutter Web') {
            steps {
                sh '''
                flutter build web --release
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t wink-dashboard .
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                echo "Stopping old container..."

                docker stop wink-dashboard || true
                docker rm wink-dashboard || true

                echo "Starting new container..."

                docker run -d \
                  --name wink-dashboard \
                  -p 8081:80 \
                  wink-dashboard

                echo "Deployment completed successfully"
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                echo "Checking running containers..."
                docker ps

                echo ""
                echo "====================================="
                echo "Application URLs"
                echo "====================================="
                echo "Jenkins   : http://localhost:8080"
                echo "SonarQube : http://localhost:9000"
                echo "Flutter   : http://localhost:8081"
                echo "====================================="
                '''
            }
        }
    }

    post {

        success {
            echo '''
=====================================
BUILD SUCCESSFUL
=====================================

Jenkins:
http://localhost:8080

SonarQube:
http://localhost:9000

Flutter Dashboard:
http://localhost:8081

=====================================
'''
        }

        failure {
            echo '''
=====================================
BUILD FAILED
=====================================

Check the Jenkins console output.

=====================================
'''
        }
    }
}
