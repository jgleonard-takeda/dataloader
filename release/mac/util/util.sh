#!/bin/bash

initVars() {
    DATALOADER_VERSION="@@FULL_VERSION@@"
    DATALOADER_SHORT_VERSION=$(echo ${DATALOADER_VERSION} | cut -d'.' -f 1)
    DATALOADER_UBER_JAR_NAME="dataloader-${DATALOADER_VERSION}-uber.jar"
    MIN_JAVA_VERSION=@@MIN_JAVA_VERSION@@
}

showBanner() {
    initVars
    echo ""
    echo "*************************************************************************"
    echo "**            ___  ____ ___ ____   _    ____ ____ ___  ____ ____       **"
    echo "**            |  \ |__|  |  |__|   |    |  | |__| |  \ |___ |__/       **"
    echo "**            |__/ |  |  |  |  |   |___ |__| |  | |__/ |___ |  \       **"
    echo "**                                                                     **"
    echo "**  Data Loader v${DATALOADER_SHORT_VERSION} is a Salesforce supported Open Source project to   **"
    echo "**  help you import data to and export data from your Salesforce org.  **"
    echo "**  It requires Java JRE ${MIN_JAVA_VERSION} or later to run.                           **"
    echo "**                                                                     **"
    echo "**  Github Project Url:                                                **"
    echo "**       https://github.com/forcedotcom/dataloader                     **"
    echo "**  Salesforce Documentation:                                          **"
    echo "**       https://help.salesforce.com/articleView?id=data_loader.htm    **"
    echo "**                                                                     **"
    echo "*************************************************************************"
    echo ""
}

checkJavaVersion() {
    initVars
    if [ ! -z "${DATALOADER_JAVA_HOME}" ]
    then
        JAVA_HOME=${DATALOADER_JAVA_HOME}
    fi
    
    PATH=${JAVA_HOME}/bin:${PATH}
    JAVA_VERSION=$(java -version 2>&1 | grep -i version | cut -d'"' -f 2 | cut -d'.' -f 1)
    if [ -z "${JAVA_VERSION}" ]
    then
        exitWithJavaDownloadMessage
    fi
    if [ ${JAVA_VERSION} \< ${MIN_JAVA_VERSION} ]
    then
        echo "Found Java JRE version ${JAVA_VERSION} whereas Data Loader requires Java JRE ${MIN_JAVA_VERSION} or later."
        exitWithJavaDownloadMessage
    fi
}

exitWithJavaDownloadMessage() {
        echo "Java JRE ${MIN_JAVA_VERSION} or later is not installed. For example, download and install Zulu OpenJDK ${MIN_JAVA_VERSION} or later JRE for macOS from https://www.azul.com/downloads/zulu/zulu-mac/"
        exit -1
}