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

zip temp/MOCK_DATA_FILTER_$timestamp.zip temp/MOCK_DATA_FILTER_$timestamp.txt

exit 0

