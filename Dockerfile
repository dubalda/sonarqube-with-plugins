FROM sonarqube:8.5.1-community

ARG BRANCH_PLUGIN_VERSION=1.6.0
ARG BRANCH_PLUGIN_FILE=sonarqube-community-branch-plugin-${BRANCH_PLUGIN_VERSION}.jar

RUN set -ex && \
    wget -P ${SONARQUBE_HOME}/extensions/plugins https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/${BRANCH_PLUGIN_VERSION}/${BRANCH_PLUGIN_FILE} && \
    chown sonarqube:sonarqube ${SONARQUBE_HOME}/extensions/plugins/${BRANCH_PLUGIN_FILE} && \
    cp ${SONARQUBE_HOME}/extensions/plugins/${BRANCH_PLUGIN_FILE} ${SONARQUBE_HOME}/lib/common/ && \
    chown sonarqube:sonarqube ${SONARQUBE_HOME}/lib/common/${BRANCH_PLUGIN_FILE} && \
    ls -l ${SONARQUBE_HOME}/extensions/plugins/ && \
    ls -l ${SONARQUBE_HOME}/lib/common/ | grep ${BRANCH_PLUGIN_FILE}
