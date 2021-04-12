// Jenkinsfile
String credentialsId = 'awsCredentials'

try {
  
  stage('GIT checkout') {
    node {
      cleanWs()
      checkout scm
    }
  }

  // Run terraform init
  stage('Terraform Init') {
    node {
      withAWS(credentials: 'aws_creds', region: 'us-east-1') {
        ansiColor('xterm') {
          sh '/usr/local/bin/terraform init'
        }
      }
    }
  }

  // Run terraform plan
  stage('Terraform Plan') {
    node {
      withAWS(credentials: 'aws_creds', region: 'us-east-1') {
        ansiColor('xterm') {
          sh '/usr/local/bin/terraform plan'
        }
      }
    }
  }

  stage('Apply Approval Input') {
      input 'Approve Terraform apply?'

    }

 // if (env.BRANCH_NAME == 'master') {

    // Run terraform apply
    stage('Terraform Apply') {
      node {
        withAWS(credentials: 'aws_creds', region: 'us-east-1') {
          ansiColor('xterm') {
            sh '/usr/local/bin/terraform apply -auto-approve'
          }
        }
      }
    }

    // Run terraform show
    stage('Terraform Show') {
      node {
        withAWS(credentials: 'aws_creds', region: 'us-east-1') {
          ansiColor('xterm') {
            sh '/usr/local/bin/terraform show'
          }
        }
      }
    }
 // }
    stage('Destroy Approval Input') {
      input 'Approve Terraform destroy?'

    }
    // Run terraform destroy
    stage('Terraform Destroy') {
      node {
        withAWS(credentials: 'aws_creds', region: 'us-east-1') {
          ansiColor('xterm') {
            sh '/usr/local/bin/terraform destroy -auto-approve'
          }
        }
      }
    }

  currentBuild.result = 'SUCCESS'
}
catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException flowError) {
  currentBuild.result = 'ABORTED'
}
catch (err) {
  currentBuild.result = 'FAILURE'
  throw err
}
finally {
  if (currentBuild.result == 'SUCCESS') {
    currentBuild.result = 'SUCCESS'
  }
}
