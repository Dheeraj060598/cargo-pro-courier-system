pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'cargo-pro-courier-system-php'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Dheeraj060598/cargo-pro-courier-system.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container in detached mode
                    sh 'docker run -d -p 80:80 --name cargo-pro-container ${DOCKER_IMAGE}:${DOCKER_TAG}'
                }
            }
        }
        stage('Clean Up') {
            steps {
                script {
                    // Optional: Clean up containers and images
                    sh 'docker rm -f cargo-pro-container || true'
                    sh 'docker rmi ${DOCKER_IMAGE}:${DOCKER_TAG} || true'
                }
            }
        }
    }

    post {
        success {
            echo 'Build and deployment succeeded!'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}
