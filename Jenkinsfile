pipeline {
  agent {
    dockerfile {
      additionalBuildArgs '--build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)'
      reuseNode true
    }
  }
  options {
    ansiColor('xterm')
  }
  stages {
    stage('Init title') {
      when { changeRequest() }
      steps {
        script {
          currentBuild.displayName = "PR ${env.CHANGE_ID}: ${env.CHANGE_TITLE}"
        }
      }
    }
    stage('Makefile-based') {
      stages {
        stage('Build') {
          steps {
            checkout scm
            sh '''
              git clean -dffx
              make clean
              make deps -B
              make build -B -j4
            '''
          }
        }
        stage('Exec OCaml') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              make TEST_CONCRETE_BACKEND=ocaml test-exec -j"$nprocs"
            '''
          }
        }
        stage('Exec Java') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              make TEST_CONCRETE_BACKEND=java test-exec -j"$nprocs"
            '''
          }
        }
        stage('Proofs Java') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              make test-prove -j"$nprocs"
            '''
          }
        }
      }
    }
    stage('KNinja-based') {
      stages {
        stage('Build') {
          steps {
            checkout scm
            sh '''
              git clean -dffx
              ./build clean
              ./build wasm-java wasm-ocaml wasm-haskell
            '''
          }
        }
        stage('Exec OCaml') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              ./build -v test-simple-ocaml -j"$nprocs"
            '''
          }
        }
        stage('Exec Java') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              ./build -v test-simple-java -j"$nprocs"
            '''
          }
        }
        stage('Proofs Java') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              ./build -v test-prove-java -j"$nprocs"
            '''
          }
        }
      }
    }
  }
}
