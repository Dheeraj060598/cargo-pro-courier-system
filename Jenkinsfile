pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'cargo-pro-courier-system-php'
        DOCKER_TAG = 'latest'
        CONTAINER_NAME = 'cargo-pro-container'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Dheeraj060598/cargo-pro-courier-system.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }

        stage('Stop Previous Container') {
            steps {
                script {
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker run -d --name ${CONTAINER_NAME} -p 80:80 ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
    }

    post {
        success {
            echo '✅ Application deployed successfully on EC2!'
        }
        failure {
            echo '❌ Deployment failed. Check logs.'
        }
    }
}
