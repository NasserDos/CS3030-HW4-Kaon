#!/bin/bash - 
#===============================================================================
#
#          FILE: kaon_hw4_zip.sh
# 
#         USAGE: ./kaon_hw4_zip.sh 
# 
#   DESCRIPTION: Zips the final folder.
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Jeremy Johnson (), jeremyjohnson7@mail.weber.edu
#                Nasser Binshabeeb, nasserbinshabeeb@mail.weber.edu
#                Trevor Orgill, trevororgill@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 02/23/2017 11:33
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

timestamp=`date +%Y_%m_%d_%H:%M`

help(){
	echo "Usage $0 <file>"
	exit 1
}

if [[ $# -ne 1 ]]
then
	help
fi


zip temp/MOCK_DATA_FILTER_$timestamp.zip $1

exit 0

