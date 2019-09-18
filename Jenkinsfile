pipeline {
  agent {
    dockerfile {
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
    stage('Dependencies') {
      steps {
        sh '''
          make deps
        '''
      }
    }
    stage('Build') {
      steps {
        sh '''
          make build -j4
        '''
      }
    }
    stage('Test Simple') {
      options { timeout(time: 5, unit: 'MINUTES') }
      parallel {
        stage('Exec OCaml') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              make TEST_CONCRETE_BACKEND=ocaml test-simple -j"$nprocs"
            '''
          }
        }
        stage('Exec Java (Floating Point)') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              make TEST_CONCRETE_BACKEND=java test-simple-float -j"$nprocs"
            '''
          }
        }
        stage('Exec LLVM') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              make TEST_CONCRETE_BACKEND=llvm test-simple -j"$nprocs"
            '''
          }
        }
      }
    }
    stage('Test Conformance') {
      options { timeout(time: 15, unit: 'MINUTES') }
      parallel {
        stage('Parse') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '2' ] && nprocs=2
              make test-conformance-parse -j"$nprocs"
            '''
          }
        }
        stage('Exec OCaml') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              make TEST_CONCRETE_BACKEND=ocaml test-conformance-supported -j"$nprocs"
            '''
          }
        }
        stage('Exec LLVM') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              make TEST_CONCRETE_BACKEND=llvm test-conformance-supported -j"$nprocs"
            '''
          }
        }
      }
    }
    stage('Test Proofs') {
      options { timeout(time: 5, unit: 'MINUTES') }
      parallel {
        stage('Proofs Java') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              make test-prove -j"$nprocs"
            '''
          }
        }
        stage('KLab Proofs Java') {
          steps {
            sh '''
              nprocs=$(nproc)
              [ "$nprocs" -gt '4' ] && nprocs=4
              make test-klab-prove -j"$nprocs"
            '''
          }
        }
      }
    }
  }
}
