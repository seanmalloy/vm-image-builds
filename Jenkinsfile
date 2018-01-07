#!/usr/bin/env groovy

node {
  checkout scm

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
