###########################################################################
# Dockerfile that provides the image for JBoss jBPM Server Full 7.17.0.Final
###########################################################################

####### BASE ############
FROM jboss/jbpm-server-full:7.17.0.Final

####### MAINTAINER ############
MAINTAINER "Leandro Alberto Lonardoni" "leandro.lonardoni@benner.com.br"

ENV JBOSS_BIND_ADDRESS 0.0.0.0
ENV KIE_SERVER_ID kie-server
ENV KIE_SERVER_LOCATION http://23.99.219.85:8080/kie-server/services/rest/server  
ENV KIE_SERVER_USER kieserver
ENV KIE_SERVER_PWD kieserver1!
# When using this image against jboss/jbpm-workbench-showcase use /jbpm-console/rest/controller
ENV KIE_SERVER_CONTROLLER http://52.173.146.231:8080/business-central/rest/controller
ENV KIE_SERVER_CONTROLLER_USER admin
ENV KIE_SERVER_CONTROLLER_PWD admin
ENV KIE_MAVEN_REPO http://52.173.146.231:8080/business-central/maven2    
ENV KIE_MAVEN_REPO_USER admin
ENV KIE_MAVEN_REPO_PASSWORD admin

RUN mkdir -p $HOME/.m2
ADD etc/start_jbpm-wb.sh $JBOSS_HOME/bin/start_jbpm-wb.sh
ADD etc/standalone-kie-server-full.xml $JBOSS_HOME/standalone/configuration/standalone-kie-server-full.xml
ADD etc/settings.xml $JBOSS_HOME/../.m2/settings.xml

USER root
RUN chown jboss:jboss $JBOSS_HOME/standalone/configuration/standalone-kie-server-full.xml && \
chown jboss:jboss $JBOSS_HOME/../.m2/settings.xml

####### CUSTOM JBOSS USER ############
# Switchback to jboss user
USER jboss

####### RUNNING JBPM-WB ############
WORKDIR $JBOSS_HOME/bin/
CMD ["./start_jbpm-wb.sh"]
