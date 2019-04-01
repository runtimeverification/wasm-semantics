pipeline {
  agent {
    label 'docker'
  }
  options { skipDefaultCheckout() }
  stages {
    stage("Init title") {
      when { changeRequest() }
      steps {
        script {
          currentBuild.displayName = "PR ${env.CHANGE_ID}: ${env.CHANGE_TITLE}"
        }
      }
    }
    stage('Makefile-based') {
      agent {
        dockerfile {
          additionalBuildArgs '--build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)'
        }
      }
      stages {
        stage('Build') {
          steps {
            ansiColor('xterm') {
              checkout scm
              sh '''
                make deps -B
                make build -B -j4
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
                make TEST_CONCRETE_BACKEND=ocaml test-execution -j"$nprocs"
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
                make TEST_CONCRETE_BACKEND=java test-execution -j"$nprocs"
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
                make test-proof -j"$nprocs"
              '''
            }
          }
        }
      }
    }
    stage('KNinja-based') {
      agent {
        dockerfile {
          additionalBuildArgs '--build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)'
        }
      }
      stages {
        stage('Build') {
          steps {
            ansiColor('xterm') {
              checkout scm
              sh '''
                ./build --opamroot ~/.opam wasm-java wasm-ocaml wasm-haskell
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
                ./build --opamroot ~/.opam -v test-exec-ocaml -j"$nprocs"
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
                ./build --opamroot ~/.opam -v test-exec-java -j"$nprocs"
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
                ./build --opamroot ~/.opam -v test-proofs-java -j"$nprocs"
              '''
            }
          }
        }
      }
    }
  }
}
