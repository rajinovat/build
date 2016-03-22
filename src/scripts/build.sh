#/***********************************************************************
# *
# *    (C) Copyright IBM Corp. 2014. All rights Reserved.
# *    This file and all associated works are owned by IBM Corporation
# *    and protected by Australian Copyright laws and international
# *    treaty provisions.
# *
# ***********************************************************************
# *
# * PROJECTS Power
# *    Datapower (RTI)
# *
# * PURPOSE
# *    Build packaging shell executable.
# *
# * DEVELOPED BY
# *    AD&I DevOps Competency - Global Business Services,
# *    IBM Australia Limited.
# *
# * CREATED BY
# *    Rajesh Ramasamy
# *
# * CREATE DATE
# *    25/09/2015
# *
# /*

if [ $USER != "rtibuild" ]; then
        echo "Must run this script as rtibuild"
        exit 1
fi

if [ -z "$1" ]; then
echo "Must pass environment name"
        exit 1
fi

#       This script builds Data power deployment assets for the specified environment
ENV=$1
BRANCH=$2;

 array=$(echo $ENV | tr ":" "\n"| sort | uniq)
        for str in $array
                    do
                #Invoke Ant build for each env
               
         if  [[ $BRANCH != feature* ]]; then
                    ant -Denv="${str}"
        fi
        done           
 

# Copy self-installer assets
   
if  [[ $BRANCH == feature* ]]; then
    rsync -av --exclude='src/main/scripts/compile.sh' --exclude='src/main/scripts/build.sh' src stage   
    chmod -R 755 stage/src
    cp build.xml stage/
    cp buildDP.xml stage/
else
    mkdir -p stage/src/main/scripts stage/src/main/resources
    cp src/main/scripts/install.sh stage/src/main/scripts
    cp src/main/resources/system.properties stage/src/main/resources
    chmod -R 755   stage/src
fi   

mvn deploy versions:set -DnewVersion="${BRANCH}" -P Release
