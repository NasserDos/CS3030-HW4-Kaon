#!/bin/bash - 
#===============================================================================
#
#          FILE: kaon_hw4_zip.sh
# 
#         USAGE: ./kaon_hw4_zip.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Jeremy Johnson (), jeremyjohnson7@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 02/23/2017 11:33
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

timestamp=`date +%Y_%m_%d_%H:%M`

zip "MOCK_DATA_FILTER_$timestamp.zip" *

exit 0

