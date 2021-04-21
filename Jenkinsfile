pipeline {
    agent any

     stages {
        stage('===============Running untit==============='){
            steps{
                sh 'chmod +x ./gradlew'
                sh './gradlew clean test --no-daemon'
            }
        }
        stage('===============Running app==============='){
            steps{
                sh './gradlew build'
            }
        }
    }
}