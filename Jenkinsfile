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
            make deps  -B
            make build -B -j4
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
            make TEST_CONCRETE_BACKEND=ocaml test-execution -j"$nprocs"
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
            make TEST_CONCRETE_BACKEND=java test-execution -j"$nprocs"
          '''
        }
      }
    }
  }
}
