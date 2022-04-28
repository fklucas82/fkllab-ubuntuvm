pipeline {
  agent any
  environment {
      vsphere_user     = credentials('1d31e24f-4905-4f72-a69b-0ea447d44f40')
  }
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
terraform apply -auto-approve'''
      }
    }

  }
}