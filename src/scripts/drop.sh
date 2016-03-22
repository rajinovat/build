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
# *    drop packaging shell executables.
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



echo "---------->${iibtools}/mqsicreatebar -data ../${WORKSPACE}/src -b "${BARNAME}.bar" -p ${PROJNAME} -o '${PROJNAME}/gen/${PROJNAME}.msgflow'"
${iibtools}/mqsicreatebar -data ../${WORKSPACE}/src -b "target/${BARNAME}.bar" -p ${PROJNAME} -o ${PROJNAME}/gen/${PROJNAME}.msgflow
#mvn deploy versions:set -DnewVersion="${BRANCH}" -P Release
