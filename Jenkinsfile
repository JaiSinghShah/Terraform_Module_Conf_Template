pipeline {
    agent any
    environment {
        TF_VAR_region = "ap-south-1"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/JaiSinghShah/Terraform_Module_Conf_Template.git'
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-Cred']]) {
                    bat 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-Cred']]) {
                    bat 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-Cred']]) {
                    script {
                        try {
                            bat 'terraform apply -auto-approve'
                        } catch (Exception e) {
                            currentBuild.result = 'FAILURE'
                            error 'Terraform apply failed, triggering rollback.'
                        }
                    }
                }
            }
        }

        stage('Terraform Destroy on Failure') {
            when {
                expression { currentBuild.result == 'FAILURE' }
            }
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-Cred']]) {
                    bat 'terraform destroy -auto-approve'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Terraform applied successfully!'
        }
        failure {
            echo 'Pipeline failed. Resources were rolled back.'
        }
    }
}
