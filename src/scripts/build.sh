#/***********************************************************************
# *
# *    (C) Copyright IBM Corp. 2015. All rights Reserved.
# *    This file and all associated works are owned by IBM Corporation
# *    and protected by Australian Copyright laws and international
# *    treaty provisions.
# *
# ***********************************************************************
# *
# * PROJECTS 
# *    IIB (API)
# *
# * PURPOSE
# *    Build packaging shell executables.
# *
# * DEVELOPED BY
# *    AD&I DevOps Competency - Global Business Services,
# *    IBM Australia Limited.
# *
# * CREATED BY
# *    Rajesh Ramasamy
# *
# * CREATE DATE
# *    22/03/2016
# *
# /*


. src/resources/system.properties

BARNAME=$1
PROJNAME=$2

echo "SHELL==========> date ${iibtools}/mqsicreatebar -data ../../../src -b "${BARNAME}.bar" -p ${PROJNAME} -o '${PROJNAME}/gen/${PROJNAME}.msgflow'"
pwd
${iibtools}/mqsicreatebar -data ../src -b "target/${PROJNAME}-${BARNAME}.bar" -p ${PROJNAME} -o ${PROJNAME}/gen/${PROJNAME}.msgflow
#mvn deploy versions:set -DnewVersion="${BRANCH}" -P Release
