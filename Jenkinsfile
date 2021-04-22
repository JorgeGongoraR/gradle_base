pipeline {
    agent any
    // environment {
    //     registry = "jorgegongora/dockergradle"
    //     registryCredential = 'dockerhub'
    // }
     stages {
        // stage('Running untit'){
        //     steps{
        //         echo '===============Running untit==============='
        //         sh 'chmod +x ./gradlew'
        //         sh './gradlew clean test --no-daemon'
        //     }
        // }
        // stage('Running app'){
        //     steps{
        //         echo "===============Running app==============="
        //         sh './gradlew build'
        //     }
        // }
        stage('Clone repository'){
            echo '=============== Cloning repository ==============='
            checkout scm
        }
        stage('Build image') {
            echo '================= Building image ================='
            customImage = docker.build("dockergradle:${env.BUILD_ID}")
        }
        stage('Push image to docker hub'){
            echo '========== Pushing image to docker hub ==========='
            docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            customImage = docker.build("dockergradle:${env.BUILD_ID}")
            customImage.push()
            }
        }
    }
    
}