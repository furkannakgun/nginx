pipeline {
    agent any
    stages {
        stage('Clone repositories') {
            steps {
                git branch: 'main', credentialsId: 'github-creds', url: 'https://github.com/furkannakgun/nginx.git'
                git branch: 'main', credentialsId: 'github-creds', url: 'https://github.com/furkannakgun/nginx-config.git'
            }
        }
        stage('Build and push Docker image') {
            steps {
                sh 'docker build -t my-image:latest .'
                withCredentials([usernamePassword(credentialsId: 'docker-creds', passwordVariable: 'furkan1903', usernameVariable: 'furkanakgun')]) {
                    sh 'docker login -u furkanakgun -p furkan1903'
                    sh 'docker push my-image:latest'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                withKubeConfig([credentialsId: 'kubeconfig-creds', serverUrl: 'https://my-cluster-url']) {
                    sh 'kubectl create configmap my-configmap --from-file=nginx.conf'
                    sh 'kubectl apply -f my-deployment.yaml'
                    sh 'kubectl apply -f my-service.yaml'
                }
            }
        }
        stage('Test application') {
            steps {
                sh 'curl http://my-app-url'
            }
        }
    }
}
