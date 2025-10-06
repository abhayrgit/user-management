pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/abhayrgit/user-management.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t nestjs-app .'
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'docker stop nestjs-app || true'
                sh 'docker rm nestjs-app || true'
                sh 'docker run -d -p 3000:3000 --name nestjs-app nestjs-app'
            }
        }
    }
}