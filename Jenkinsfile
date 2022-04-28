pipeline {
  agent any
  environment {
      vsphere_user     = credentials('vsphere_user')
      vsphere_password = credentials('vsphere_password')
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