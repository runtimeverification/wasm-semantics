pipeline {
  agent {
    label 'docker'
  }
  options {
    skipDefaultCheckout()
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
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Makefile-based') {
      agent {
        dockerfile {
          additionalBuildArgs '--build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)'
          reuseNode true
        }
      }
      stages {
        stage('Build') {
          steps {
            checkout scm
            sh '''
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
              make TEST_CONCRETE_BACKEND=ocaml test-execution -j"$nprocs"
            '''
          }
        }
        stage('Exec Java') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              make TEST_CONCRETE_BACKEND=java test-execution -j"$nprocs"
            '''
          }
        }
        stage('Proofs Java') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              make test-proof -j"$nprocs"
            '''
          }
        }
      }
    }
    stage('KNinja-based') {
      agent {
        dockerfile {
          additionalBuildArgs '--build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)'
          reuseNode true
        }
      }
      stages {
        stage('Build') {
          steps {
            checkout scm
            sh '''
              ./build wasm-java wasm-ocaml wasm-haskell
            '''
          }
        }
        stage('Exec OCaml') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              ./build -v test-exec-ocaml -j"$nprocs"
            '''
          }
        }
        stage('Exec Java') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              ./build -v test-exec-java -j"$nprocs"
            '''
          }
        }
        stage('Proofs Java') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              ./build -v test-proofs-java -j"$nprocs"
            '''
          }
        }
      }
    }
  }
}
