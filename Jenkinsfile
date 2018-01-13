#!/usr/bin/env groovy

//properties(
//  [
//    parameters(
//      [choiceParam(name: 'IMAGE_NAME', options: ['centos-base', 'centos-jenkins'], description: 'Image to Build')]
//    )
//  ]
//)

properties(
  [
    parameters(
      [
        choice(name: 'IMAGE_NAME', choices: "centos7-base\ncentos7-jenkins", description: ''),
        choice(name: 'GCE_PREEMPT', choices: "true\nfalse", description: ''),
        choice(name: 'GCE_ZONE', choices: "us-central1-a\nus-central1-b\nus-central1-c\nus-central1-f", description: ''),
        choice(name: 'PACKER_VERSION', choices: "1.1.3", description: '')
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
      echo 'test step ...'
    }

    stage('Deploy') {
      if (currentBuild.result == null || currentBuild.result == 'SUCCESS') {
        echo 'deploy step ...'
      }
    }
  }
  catch (ex) {
    // TODO: add notification, slack?
    echo "failed caught exception ..."
    cleanWs()
  }
  finally {
    // TODO: add notification, slack?
    cleanWs()
  }
}
