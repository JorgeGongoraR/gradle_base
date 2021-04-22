// pipeline {
//     agent any
//     // environment {
//     //     registry = "jorgegongora/dockergradle"
//     //     registryCredential = 'dockerhub'
//     // }
//     stages {
//         stage('Clone repository'){
//             echo '=============== Cloning repository ==============='
//             checkout scm
//         }
//         stage('Build image') {
//             echo '================= Building image ================='
//             customImage = docker.build("dockergradle:${env.BUILD_ID}")
//         }
//         stage('Push image to docker hub'){
//             echo '========== Pushing image to docker hub ==========='
//             docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
//             customImage = docker.build("dockergradle:${env.BUILD_ID}")
//             customImage.push()
//             }
//         }
//     }
    
// }
// environment{
//     registry = "jorgegongora/dockergradle"
//     resistryCredential = 'dockerhub'
// }
// stages{
//     stage('Clone repository'){
//         steps{
//             echo '=============== Cloning repository ==============='
//             checkout scm
//         }
//     }
//     stage('Build image'){
//         steps{
//             echo '================= Building image ================='
//             docker.build registry + ":$BUILD_ID"
//         }
//     }
// }
pipeline{
    environment{
        registry = "jorgegongora/dockergradle"
        resistryCredential = 'dokcerhub'
    }
    agent any

    stages{
        stage('Clone repository'){
            steps{
                echo '=============== Cloning repository ==============='
                checkout scm
            }
        }
        stage('Build image'){
            steps{
                script{
                    echo '================= Building image ================='
                    dockerImage = docker.build registry + ":$BUILD_ID"
                }
            }
        }
        stage('Deploy image'){
            steps{
                script{
                    echo '================= Deplying image ================='
                    docker.withRegistry('', resistryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}