# creates a layer from the jenkins:lts Docker image
FROM jenkins/jenkins:lts # sets user to root (because Docker always runs as root and Jenkins needs to know this)
  USER root
 
 # add and install all the necessary dependencies
 RUN apt-get update && \
 apt-get install -qy \
   apt-utils \
   libyaml-dev \
   build-essential \
   python-dev \
   libxml2-dev \
   libxslt-dev \
   libffi-dev \
   libssl-dev \
   default-libmysqlclient-dev \
   python-mysqldb \
   python-pip \
   libjpeg-dev \
   zlib1g-dev \
   libblas-dev\
   liblapack-dev \
   libatlas-base-dev \
   apt-transport-https \
   ca-certificates \
   zip \
   unzip \
   gfortran && \
 rm -rf /var/lib/apt/lists/*
 
 # install docker
 RUN curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
 
 # install docker compose
 RUN curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
     chmod +x /usr/local/bin/docker-compose # install pip for python
 RUN pip install cffi --upgrade
 RUN pip install pip2pi ansible==2.0
 
 # copy groovy executors and plugins for jenkins and run the plugins
 COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
 COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
 RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
 
 # add the jenkins user to the docker group so that sudo is not required to run docker commands
 RUN groupmod -g 1026 docker && gpasswd -a jenkins docker
 USER jenkins
