#!/usr/bin/env groovy

node {
  checkout scm

  try {
    stage('Build') {
      echo 'build step ...'
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
