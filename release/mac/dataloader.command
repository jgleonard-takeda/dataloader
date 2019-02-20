#!/bin/bash

echo ""
echo "***************************************************************************"
echo "**            ___  ____ ___ ____   _    ____ ____ ___  ____ ____         **"
echo "**            |  \ |__|  |  |__|   |    |  | |__| |  \ |___ |__/         **"
echo "**            |__/ |  |  |  |  |   |___ |__| |  | |__/ |___ |  \         **"
echo "**                                                                       **"
echo "**  Dataloder vDATALOADER_SHORT_VERSION_PLACEHOLDER is a Salesforce supported Open Source project to help  **"
echo "**  Salesforce user to import and export data with Salesforce platform.  **"
echo "**  It requires Zulu OpenJDK 11 or higher to run.                        **"
echo "**                                                                       **"
echo "**  Github Project Url:                                                  **"
echo "**       https://github.com/forcedotcom/dataloader                       **"
echo "**  Salesforce Documentation:                                            **"
echo "**       https://help.salesforce.com/articleView?id=data_loader.htm      **"
echo "**                                                                       **"
echo "***************************************************************************"
echo ""

export JAVA_HOME=$(/usr/libexec/java_home -v 11)

if [ -z "$JAVA_HOME" ]
then
    echo "Please download Zulu Openjdk 11+ for mac here: https://www.azul.com/downloads/zulu/zulu-mac/"
else
    echo "$JAVA_HOME"
    cd DATALODER_WORK_DIRECTORY_PLACEHOLDER   #change to your own customized directory
    java -XstartOnFirstThread -jar DATALOADER_UBER_JAR_NAME_PLACEHOLDER salesforce.config.dir=DATALODER_WORK_DIRECTORY_PLACEHOLDER/configs
fi
