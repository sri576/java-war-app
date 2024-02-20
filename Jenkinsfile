pipeline
{
    agent any
    tools
    {
        maven 'M2_HOME'
    }
    stages
    {
        stage('Start Process')
        {
            steps
            {
                echo 'now start CICD Complite process '
            }
        }
        stage('CheckOut')
        {
            steps
            {
                checkout scmGit(branches: [[name: '*/sri']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sri576/java-war-app.git']])
            }
        }
        stage('Maven Build ')
        {
            steps
            {
                sh 'mvn clean install package'
            }
        }
        stage('Build Image')
        {
            steps
            {
                script
                {
                sh 'docker build -t priya576/app  .'
                }
            }
        }
        stage('Push Image')
        {
            steps
            {
               withCredentials([string(credentialsId: 'srikanthpwd', variable: 'srikanthpwd')])
                {
                    sh 'docker login -u priya576 -p ${srikanthpwd}'
                }
                sh ' docker push priya576/app '
            }
        }
        stage('Deploy War file')
        {
            steps
            {
                deploy adapters: [tomcat9(credentialsId: 'admin', path: '', url: 'http://13.233.224.40:8080/')], contextPath: null, war: '**/*.war'
            }
        }
        stage('Quality Check')
        {
            steps
            {
               sh ' mvn clean verify sonar:sonar -Dsonar.projectKey=java-war-app  -Dsonar.host.url=http://43.204.29.54:9000 -Dsonar.login=sqp_0c48f7004f881dc9c7ba2d7da706ebc51f915b41' 
            }
        }
        stage('Successfully Deploys')
        
        {
            
            steps
            {
                echo 'project is sucessfully deployed'
            }
        }
    }
}
