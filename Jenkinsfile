pipeline {
  agent {
    dockerfile {
      additionalBuildArgs '--build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)'
    }
  }
  stages {
    stage("Init title") {
      when { changeRequest() }
      steps {
        script {
          currentBuild.displayName = "PR ${env.CHANGE_ID}: ${env.CHANGE_TITLE}"
        }
      }
    }
    stage('Build') {
      steps {
        ansiColor('xterm') {
          sh '''
            ./build wasm-ocaml wasm-java
          '''
        }
      }
    }
    stage('Java Backend') {
      steps {
        ansiColor('xterm') {
          sh '''
            nprocs=$(nproc)
            [ "$nprocs" -gt '4' ] && nprocs=4
            ./build test-exec -j"$nprocs"
          '''
        }
      }
    }
    stage('Test Proofs') {
      steps {
        ansiColor('xterm') {
          sh '''
            nprocs=$(nproc)
            [ "$nprocs" -gt '4' ] && nprocs=4
            ./build test-proofs -j"$nprocs"
          '''
        }
      }
    }
    stage('OCaml Backend') {
      steps {
        ansiColor('xterm') {
          sh '''
            nprocs=$(nproc)
            [ "$nprocs" -gt '4' ] && nprocs=4
            false # TODO: FIXME
          '''
        }
      }
    }
  }
}
