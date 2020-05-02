pipeline {
  agent {
    dockerfile {
      label 'docker'
      additionalBuildArgs '--build-arg K_COMMIT=$(cd deps/k && git rev-parse --short=7 HEAD)'
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
        stage('Build') { steps { sh 'make build -j4' } }
        stage('Test') {
          options { timeout(time: 25, unit: 'MINUTES') }
          parallel {
            stage('Simple')            { steps { sh 'make TEST_CONCRETE_BACKEND=llvm test-simple -j4'                } }
            stage('Conformance Parse') { steps { sh 'make test-conformance-parse -j3'                                } }
            stage('Conformance')       { steps { sh 'make TEST_CONCRETE_BACKEND=llvm test-conformance-supported -j4' } }
            stage('Proofs')            { steps { sh 'make test-prove -j2'                                            } }
          }
        }
      }
    }
    stage('Master Release') {
      when { branch 'master' }
      steps {
        build job: 'rv-devops/master', propagate: false, wait: false                                                   \
            , parameters: [ booleanParam(name: 'UPDATE_DEPS_SUBMODULE', value: true)                                   \
                          , string(name: 'PR_REVIEWER', value: 'ehildenb')                                             \
                          , string(name: 'UPDATE_DEPS_REPOSITORY', value: 'runtimeverification/polkadot-verification') \
                          , string(name: 'UPDATE_DEPS_SUBMODULE_DIR', value: 'deps/wasm-semantics')                    \
                          ]
        build job: 'rv-devops/master', propagate: false, wait: false                                    \
            , parameters: [ booleanParam(name: 'UPDATE_DEPS_SUBMODULE', value: true)                    \
                          , string(name: 'PR_REVIEWER', value: 'hjorthjort')                            \
                          , string(name: 'UPDATE_DEPS_REPOSITORY', value: 'kframework/ewasm-semantics') \
                          , string(name: 'UPDATE_DEPS_SUBMODULE_DIR', value: 'deps/wasm-semantics')     \
                          ]
      }
    }
  }
}
