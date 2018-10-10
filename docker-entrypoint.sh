#!/bin/bash
set -eo pipefail

##########################################################
# la valeur de $1 indique le fichier de config à utiliser
# docker-entrypoint.sh moodle31-uqam.yml
# equivaut à
# docker run -it --rm nmolleruq/builder moodle31-uqam.yml
#########################################################

WORKSPACE='/home/uqamena'

config_file="$1"

if [ ! -z "$2"  ]; then 
	only="--only=$2"
fi

if [ "$1" == "--" ]; then
	config_file='moodle35-uqam.yml'
fi

[ -d "$WORKSPACE/test01" ] && rm -rf "$WORKSPACE/test01" || echo 'Start'
[ -d "$WORKSPACE/build/moodle" ] && rm -rf "$WORKSPACE/build/moodle" || echo 'Start'
git clone git@bitbucket.org:uqam/appbuilder.git test01
php ${WORKSPACE}/test01/bin/builder.php gitStuff -r -l -k ${WORKSPACE}/test01/config/${config_file} ${only}
mv *.log build/moodle35