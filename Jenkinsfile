pipeline {
  agent {
    dockerfile {
      label 'docker'
      additionalBuildArgs '--build-arg K_COMMIT=$(cd deps/k && git tag --points-at HEAD | cut --characters=2-) --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)'
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
    stage('Master Release') {
      when { branch 'master' }
      environment { LONG_REV = """${sh(returnStdout: true, script: 'git rev-parse HEAD').trim()}""" }
      steps {
        build job: 'DevOps/master', propagate: false, wait: false                                                      \
            , parameters: [ booleanParam ( name: 'UPDATE_DEPS'         , value: true                                 ) \
                          , string       ( name: 'UPDATE_DEPS_REPO'    , value: 'runtimeverification/wasm-semantics' ) \
                          , string       ( name: 'UPDATE_DEPS_VERSION' , value: "${env.LONG_REV}"                    ) \
                          ]
      }
    }
  }
}
