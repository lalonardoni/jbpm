#!/usr/bin/env bash

# Start Wildfly with the given arguments.
echo "Update database connection setup"
./update_db_config.sh

export KIE_MAVEN_REPO="http://52.173.146.231:8080/business-central/maven2"

echo "Running jBPM Server Full on JBoss Wildfly..."
exec ./standalone.sh -b $JBOSS_BIND_ADDRESS $EXTRA_OPTS -Dorg.kie.server.location=$KIE_SERVER_LOCATION -Dorg.kie.server.id=$KIE_SERVER_ID -Dorg.kie.server.user=$KIE_SERVER_USER -Dorg.kie.server.pwd=$KIE_SERVER_PWD -Dorg.kie.server.controller=$KIE_SERVER_CONTROLLER -Dorg.kie.server.controller.user=$KIE_SERVER_CONTROLLER_USER -Dorg.kie.server.controller.pwd=$KIE_SERVER_CONTROLLER_PWD
exit $?
