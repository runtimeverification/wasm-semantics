pipeline {
  agent {
    dockerfile {
      label 'docker'
      additionalBuildArgs '--build-arg K_COMMIT=$(cat deps/k_release) --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)'
    }
  }
  options { ansiColor('xterm') }
  stages {
    stage('Init title') {
      when { changeRequest() }
      steps { script { currentBuild.displayName = "PR ${env.CHANGE_ID}: ${env.CHANGE_TITLE}" } }
    }
    stage('Build and Test') {
      when { changeRequest() }
      stages {
        stage('Build') { steps { sh 'make build -j4 RELEASE=true' } }
        stage('Test') {
          environment { K_OPTS = '-Xmx8G' }
          options { timeout(time: 25, unit: 'MINUTES') }
          parallel {
            stage('Simple')            { steps { sh 'make TEST_CONCRETE_BACKEND=llvm test-simple -j4'                } }
            stage('Binary Parse')      { steps { sh 'make TEST_CONCRETE_BACKEND=llvm test-binary-parser -j4'         } }
            stage('Conformance Parse') { steps { sh 'make test-conformance-parse -j3'                                } }
            stage('Conformance')       { steps { sh 'make TEST_CONCRETE_BACKEND=llvm test-conformance-supported -j4' } }
            stage('Proofs')            { steps { sh 'make test-prove -j2'                                            } }
          }
        }
      }
    }
  }
}
