pipeline {
    agent any

    environment {
        // Only include AWS credentials from Jenkins secrets
        AWS_CREDENTIALS = 'AWS-Cred'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the Terraform repository from GitHub
                git branch: 'main', url: 'https://github.com/JaiSinghShah/Terraform_Module_Conf_Template.git'
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: AWS_CREDENTIALS]]) {
                    bat 'terraform init'  // Initialize Terraform (use 'sh' for Linux agents)
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: AWS_CREDENTIALS]]) {
                    bat 'terraform plan'  // Run Terraform Plan (use 'sh' for Linux agents)
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: AWS_CREDENTIALS]]) {
                    script {
                        try {
                            bat 'terraform apply -auto-approve'  // Apply Terraform changes
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
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: AWS_CREDENTIALS]]) {
                    bat 'terraform destroy -auto-approve'  // Rollback if apply fails
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
