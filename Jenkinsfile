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
        sh '''cd tf-ubuntu-vm
terraform plan'''
      }
    }

    stage('apply') {
      steps {
        sh '''cd tf-ubuntu-vm
terraform apply'''
      }
    }

  }
}