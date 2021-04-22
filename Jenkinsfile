pipeline {
    agent any
    environment {
        registry = "jorgegongora/dockergradle"
        registryCredential = 'dockerhub'
    }
     stages {
        stage('Running untit'){
            steps{
                echo '===============Running untit==============='
                sh 'chmod +x ./gradlew'
                sh './gradlew clean test --no-daemon'
            }
        }
        stage('Running app'){
            steps{
                echo "===============Running app==============="
                sh './gradlew build'
            }
        }
        stage('Building image') {
            steps{
                script {
                    docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
    }
    
}