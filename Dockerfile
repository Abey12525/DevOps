FROM centos

MAINTAINER abeyhurtis@gmail.com 

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.57/bin/apache-tomcat-8.5.57.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.57/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/conf
RUN curl -O https://raw.githubusercontent.com/Abey12525/JenkinsRepo/master/tomcat-users.xml
WORKDIR /opt/tomcat/webapps/manager/META-INF
RUN curl -O https://raw.githubusercontent.com/Abey12525/JenkinsRepo/master/context.xml 
EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]