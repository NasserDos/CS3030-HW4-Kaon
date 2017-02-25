#!/bin/bash - 
#===============================================================================
#
#          FILE: kaon_hw4_wget.sh
# 
#         USAGE: ./kaon_hw4_wget.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#       AUTHORS: Jeremy Johnson, jeremyjohnson7@mail.weber.edu
#                Nasser Binshabeeb, nasserbinshabeeb@mail.weber.edu
#                Trevor Orgill, trevororgill@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 02/22/2017 21:27
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

help(){
	echo "Usage   ./kaon_hw4_wget.sh <input> "
	exit 1
}

if [[ $# -ne 1 ]]
then
	help
fi

if [[ $1 != 2015 && $1 != 2016 ]]
then
	echo "Invalid argument; must be 2015 or 2016" >&2
	exit 1
fi

target=http://icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_$1.tar.gz

#-q will silence the messages associated with wget 
# --spider will check if the file exists (200 OK if exists)
# && will execute if the test before it is true 
# || will execute if the test before it is false

# if file exists DOWNLOAD , PRINT CONFIRMATION , otherwise print it failed 


wget -q --spider $target && wget -q $target && echo File Downloaded successfully || echo File does not exist

exit 0
