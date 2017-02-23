#!/bin/bash - 
#===============================================================================
#
#          FILE: kaon_hw4_ftp.sh
# 
#         USAGE: ./kaon_hw4_ftp.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Jeremy Johnson (), jeremyjohnson7@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 02/23/2017 12:46
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

# Usage information
usage() {
	echo "Usage $0 -f <file> [-u <user> -p <passwd>] "
	echo "    -f    The name of the file to upload"
	echo "    -u    The FTP username"
	echo "    -p    The FTP password"
	exit 1
}

# Help parameter
if [[ $1 == "--help" ]]
then
	usage
fi

# Get command-line options
while getopts ":u:p:" opt
do
	case $opt in
		f)	file=$OPTARG
			;;
		u)	user=$OPTARG
			;;
		p)	passwd=$OPTARG
			;;
		# Checks for illegal options
		\?)	usage
			exit 1
			;;
	esac
done

# Check for required arguments
if [[ -z $year || -z $email ]]
then
	usage
fi



exit 0

