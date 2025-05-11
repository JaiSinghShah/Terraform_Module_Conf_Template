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

        stage('Terraform Init/Plan/Apply') {
            steps {
                script {
                    try {
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-Cred']]) {
                            bat 'terraform init'
                            bat 'terraform plan'
                            bat 'terraform apply -auto-approve'
                        }
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        echo "Terraform Apply failed. Initiating rollback..."
                        // Rollback operation if apply fails
                        bat 'terraform destroy -auto-approve'
                        throw e  // Rethrow the exception to fail the pipeline properly
                    }
                }
            }
        }
    }
    post {
        success {
            echo 'Terraform deployment successful'
        }
        failure {
            echo 'Terraform deployment failed. Rollback complete if apply fails.'
        }
    }
}
