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
        string(name: 'IMAGE_NAME', defaultValue: '', description: 'Image to Build'),
        booleanParam(name: 'GCE_PREEMPT', defaultValue: true, description: '')
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
