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
            ./build wasm-java wasm-ocaml wasm-haskell
          '''
        }
      }
    }
    stage('Exec OCaml') {
      steps {
        ansiColor('xterm') {
          sh '''
            nprocs=$(nproc)
            [ "$nprocs" -gt '4' ] && nprocs=4
            ./build test-exec-ocaml -j"$nprocs"
          '''
        }
      }
    }
    stage('Exec Java') {
      steps {
        ansiColor('xterm') {
          sh '''
            nprocs=$(nproc)
            [ "$nprocs" -gt '4' ] && nprocs=4
            ./build test-exec-java -j"$nprocs"
          '''
        }
      }
    }
    stage('Proofs Java') {
      steps {
        ansiColor('xterm') {
          sh '''
            nprocs=$(nproc)
            [ "$nprocs" -gt '4' ] && nprocs=4
            ./build test-proofs-java -j"$nprocs"
          '''
        }
      }
    }
  }
}
