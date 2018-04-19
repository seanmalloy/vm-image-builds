#!/usr/bin/env groovy

properties(
  [
    parameters(
      [
        choice(name: 'IMAGE_NAME', choices: "centos7-base\ncentos7-jenkins\ncentos7-kvm", description: ''),
        choice(name: 'GCE_PREEMPT', choices: "true\nfalse", description: ''),
        choice(name: 'GCE_ZONE', choices: "us-central1-a\nus-central1-b\nus-central1-c\nus-central1-f", description: ''),
        choice(name: 'PACKER_VERSION', choices: "1.2.2\n1.2.0", description: '')
      ]
    )
  ]
)

node {
  checkout scm

  try {
    stage('Build') {
      sh "./build.sh ${params.IMAGE_NAME}"
    }

    stage('Test') {
      sh "./test.sh ${params.IMAGE_NAME}"
    }

    stage('Deploy') {
      if (currentBuild.result == null || currentBuild.result == 'SUCCESS') {
        echo 'deploy step ...'
      }
    }
  }
  catch (ex) {
    echo "ERROR: pipeline failed caught exception!!!"
    cleanWs()
    throw ex
  }
  finally {
    cleanWs()
  }
}
