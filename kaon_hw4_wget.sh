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
#        AUTHOR: Nasser Binshabeeb 
#  ORGANIZATION: 
#       CREATED: 02/22/2017 21:27
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

help(){
 echo "Usage   ./kaon_hw4_wget.sh <input> "

}

#-q will silence the messages associated with wget 
# --spider will check if the file exists (200 OK if exists)
# && will execute if the test before it is true 
# || will execute if the test before it is fails

# if file exists DOWNLOAD , PRINT CONFIRMATION , otherwise print it failed 

wget -q --spider http://icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_$1.tar.gz && wget -q http://icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_$1.tar.gz && echo File Downloaded successfully || echo File does not exits

exit 0
