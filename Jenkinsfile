pipeline {
  agent any
  stages {
    stage('init') {
      steps {
        sh '''cd tf-ubuntu-vm
terraform init'''
      }
    }

    stage('plan') {
      steps {
        sh 'terraform plan'
      }
    }

    stage('apply') {
      steps {
        sh 'terraform apply'
      }
    }

  }
}