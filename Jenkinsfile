pipeline {
    agent any

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
    }
}

node {
    checkout scm
    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub'){
        def customImage = docker.build("jorgegongora/dockerglade")

        customImage.push()
    }
}