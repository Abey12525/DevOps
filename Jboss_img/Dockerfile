# ### Set the base image  
# FROM jboss/base-jdk:8 
 
# ### File Author / Maintainer 
# MAINTAINER "abeyrhurtis@cs.ajce.in"
 
# ### Install EAP 7.0.0 
# ADD jboss-eap-7.0.0.zip /tmp/ 
# RUN unzip /tmp/jboss-eap-7.0.0.zip 
 
# ### Set Environment 
# ENV JBOSS_HOME /opt/jboss/jboss-eap-7.0.0

# # RUN $JBOSS_HOME/bin/add-user "admin" "admin"
# # RUN chown -R jboss:jboss /opt/rh

# EXPOSE 8080 

# ADD sample.war "$JBOSS_HOME/standalone/deployments/"
# ENTRYPOINT #JBOSS_HOME/bin/standalone.bat -c standalone.xml

# # CMD ["/opt/jboss/jboss-eap-7.0.0/bin/standalone.bat -c standalone", "-b", "0.0.0.0"]




### Set the base image  
FROM jboss/base-jdk:8 
 
### File Author / Maintainer 
MAINTAINER "abeyrhurtis@cs.ajce.in"
 
### Install EAP 7.0.0 
ADD jboss-eap-7.0.0.zip /tmp/ 
RUN unzip /tmp/jboss-eap-7.0.0.zip 
 
### Set Environment 
ENV JBOSS_HOME /opt/jboss/jboss-eap-7.0...
EXPOSE 8080