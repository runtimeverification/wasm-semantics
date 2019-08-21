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
    stage('Test') {
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
