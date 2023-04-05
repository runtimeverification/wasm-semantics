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
