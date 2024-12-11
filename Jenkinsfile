pipeline {
    agent any
    // agent {
    //     kubernetes {
    //         yaml """
    //         apiVersion: v1
    //         kind: Pod
    //         spec:
    //           containers:
    //           - name: jnlp
    //             image: jenkins/inbound-agent:latest
    //           - name: docker
    //             image: docker:dind
    //             securityContext:
    //               privileged: true
    //             volumeMounts:
    //             - name: docker-socket
    //               mountPath: /var/run/docker.sock
    //           volumes:
    //           - name: docker-socket
    //             hostPath:
    //               path: /var/run/docker.sock
    //               type: Socket
    //         """
    //     }
    // }
    environment {
        DOCKER_IMAGE = 'dlwpdnr213/gitops-test'
        DOCKER_TAG = 'latest'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: 'jenkins',branch: 'main', url: 'https://github.com/Leejeuk213/gitops_cicd.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'docker', url: 'https://index.docker.io/v1/']) {
                        sh 'docker push ${DOCKER_IMAGE}:${DOCKER_TAG}'
                    }
                }
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
