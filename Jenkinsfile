pipeline {
         agent any
         stages {
             stage('Checkout') {
                 steps {
                     git branch: 'develop', url: 'https://github.com/abhayrgit/user-management.git'
                 }
             }
             stage('Build Docker Image') {
                 steps {
                     sh 'docker build -t user-management:latest .'
                 }
             }
             stage('Deploy with Docker Compose') {
                 steps {
                     sh 'docker-compose down || true'
                     sh 'docker-compose up -d'
                 }
             }
         }
         post {
             always {
                 echo 'Pipeline completed!'
             }
         }
     }