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



LOCAL=`find . -name "*.zip" | tail -1`
echo ${LOCAL}
FILE=${LOCAL##*/}
curl -u admin:password -X PUT -T ${LOCAL} "http://localhost:8081/artifactory/ext-release-local/${FILE}"

