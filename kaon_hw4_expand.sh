#!/bin/bash - 
#===============================================================================
#
#          FILE: kaon_hw4_expand.sh
# 
#         USAGE: ./kaon_hw4_expand.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Nasser Binshabeeb (), 
#  ORGANIZATION: 
#       CREATED: 02/23/2017 10:16
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error



#create temp directory if it doens't exit
if [[ -z ./temp  ]]
then
	mkdir temp
fi

#for every .tar file in current directory, expand them into temp
for f in *tar.gz
do
	tar -xf $f -C ./temp
done


exit 0

