pipeline {
    agent any
    
    environment {
        TF_VAR_region = "ap-south-1"  // Set the AWS region for Terraform operations
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
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-Cred']]) {
                    bat 'terraform init'  // Use 'sh' for Linux agents
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-Cred']]) {
                    bat 'terraform plan'  // Use 'sh' for Linux agents
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-Cred']]) {
                    script {
                        try {
                            bat 'terraform apply -auto-approve'  // Run Terraform Apply
                        } catch (Exception e) {
                            currentBuild.result = 'FAILURE'
                            error "Terraform apply failed, rolling back changes"
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
                    bat 'terraform destroy -auto-approve'  // Rollback by destroying resources
                }
            }
        }
    }

    post {
        always {
            // Clean up and notify
            echo "Pipeline finished"
        }
        success {
            echo "Terraform applied successfully!"
        }
        failure {
            echo "Pipeline failed. Resources rolled back."
        }
    }
}
