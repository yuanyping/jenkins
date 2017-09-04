FROM ubuntu:16.04
ENV JENKINS_HOME /data/jenkins
ADD jenkins.war /opt/jenkins.war
#ADD source.list /etc/apt/sources.list
RUN chmod 644 /opt/jenkins.war && echo "Asia/Shanghai" > /etc/timezone &&  rm /etc/localtime  && apt update && apt install ansible  git -y
ADD Shanghai /etc/localtime
ADD java /usr/local/java
RUN echo "export JAVA_HOME=/usr/local/java" >> /etc/profile && echo "export PATH=$JAVA_HOME/bin:$PATH" >> /etc/profile && echo "export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> /etc/profile 
#RUN cd /tmp/ && wget  http://repo.saltstack.com/apt/ubuntu/16.04/amd64/2016.11/SALTSTACK-GPG-KEY.pub && apt-key add /tmp/SALTSTACK-GPG-KEY.pub
ADD  trusted.gpg /etc/apt/trusted.gpg
RUN apt install apt-transport-https -y
#RUN  echo "http://repo.saltstack.com/apt/ubuntu/16.04/amd64/2016.11/ xenial main" >> /etc/apt/sources.list && apt update && sudo apt-get install salt-master -y
RUN  echo "deb https://repo.saltstack.com/apt/ubuntu/16.04/amd64/2016.11/ xenial main" >> /etc/apt/sources.list && apt update && apt-get install salt-master -y
ADD master /etc/salt/master
RUN mkdir /srv/salt -p && mkdir /srv/pillar -p 
RUN apt install curl sshpass vim unzip -y
ADD start.sh /opt/start.sh
ADD ssh_config /etc/ssh/ssh_config
RUN chmod +x /opt/start.sh
RUN rm /etc/ansible/ansible.cfg
ADD ansible.cfg /etc/ansible/ansible.cfg
CMD ["bash","/opt/start.sh"]
