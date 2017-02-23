#!/bin/bash -f 
#===============================================================================
#
#          FILE: kaon_hw4_expand.sh
# 
#         USAGE: ./kaon_hw4_expand.sh 
# 
#   DESCRIPTION: Takes MOCK_DATA and expands them in a folder named temp 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: --- 
#       AUTHORS: Jeremy Johnson, jeremyjohnson7@mail.weber.edu
#                Nasser Binshabeeb, nasserbinshabeeb@mail.weber.edu
#                Trevor Orgill, __USERNAME__@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 02/23/2017 09:57
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error


usage(){
	echo "Usage $0"
	echo "Takes mock data unzips and expands it."
	exit 1
}

if [[ $1 == "--help" ]]
then
	usage
fi
target=MOCK_DATA_2015.tar.gz
target2=MOCK_DATA_2016.tar.gz

if [[ ! -e $target || ! -e $target2 ]]
then
	echo "One or more file did not exist"
	usage
fi

mkdir temp
tar -xzf $target -C temp
tar -xzf $target2 -C temp

exit 0

