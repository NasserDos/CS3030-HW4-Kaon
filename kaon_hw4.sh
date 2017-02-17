#!/bin/bash - 
#===============================================================================
#          FILE: kaon_hw4.sh
# 
#         USAGE: ./kaon_hw4.sh -y <year> -e <email> [-u <user> -p <passwd>] 
# 
#   DESCRIPTION: CS 3030 Bash Assignment 4
# 
#       AUTHORS: Jeremy Johnson, jeremyjohnson7@mail.weber.edu
#                Nasser Binshabeeb, nasserbinshabeeb@mail.weber.edu
#                Trevor Orgill, __USERNAME__@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 02/17/2017 13:46
#      REVISION:  ---
#===============================================================================


# Usage information
usage() {
	echo "Usage $0 -y <year> -e <email> [-u <user> -p <passwd>] "
	echo "    -y    The year of the file (required)"
	echo "    -e    The e-mail address to send the final notification to (required)"
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
while getopts ":y:e:u:p:" opt
do
	case $opt in
		y)	year=$OPTARG
			;;
		e)	email=$OPTARG
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


# Get file from wget
bash kaon_hw4_wget.sh $year

if [[ $? -eq 0 ]]
then
	echo "There was an error retrieving the file from wget" >&2
else
	echo "File retreived successfully"
fi


exit 0

