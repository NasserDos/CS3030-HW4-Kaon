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
#                Trevor Orgill, trevororgill@mail.weber.edu
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
if [[ $year != 2015 && $year != 2016 ]]
then
	echo "Incorrect year, input 2015 or 2016"
	usage
fi
if [[ $year == 2015 ]]
then
	year2=2016
	./kaon_hw4_wget.sh $year
	./kaon_hw4_wget.sh $year2
else
	year2=2015
	./kaon_hw4_wget.sh $year
	./kaon_hw4_wget.sh $year2
fi

if [[ ! $? ]]
then
	echo "There was an error retrieving the file from wget." >&2
	exit 2
fi


# Expand Files
./kaon_hw4_expand.sh

if [[ ! $? ]]
then
	echo "There was an error expanding the files." >&2
	exit 2
fi

#Loop for shortening Files
ts=`date +%Y_%m_%d_%H:%M`
for i in temp/*
do
	./kaon_hw4.awk $i >> temp/MOCK_DATA_FILTER_$ts.txt
done
if [[ ! $? ]]
then
	echo "There was an error shortening the files." >&2
	exit 2
fi

#Zip the Final File
./kaon_hw4_zip.sh
if [[ ! $? ]]
then
	echo "There was an error zipping the file." >&2
	exit 2
fi

#FTP to server.
if [[ ! -z $user && ! -z $passwd ]]
then
	./kaon_hw4_ftp.sh -f temp/MOCK_DATA_FILTER_$ts.zip -u $user -p $passwd
else
	./kaon_hw4_ftp.sh -f temp/MOCK_DATA_FILTER_$ts.zip
fi

if [[ ! $? ]]
then
	echo "There was an error FTPing to the server." >&2
	exit 2
fi

#Email success message to disignated email address
ftpServ=`hostname`
echo "Sending email to $email"
mail -s "Successful!" $email << END_MAIL
Successfully transferred file to FTP $ftpServ server
END_MAIL

#Very Last Thing (Commented out so we can test other files) Cleans the Mess
./kaon_hw4_clean.sh
if [[ ! $? ]]
then
	echo "There was an error cleaning the mess." >&2
	exit 2
fi

exit 0

