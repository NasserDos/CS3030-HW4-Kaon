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

# Clean up temporary files
clean() {
	./kaon_hw4_clean.sh
	if [[ $? -ne 0 ]]
	then
		echo "There was an error cleaning the mess." >&2
		exit 2
	fi
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
	
	if [[ $? -ne 0 ]]
	then
		echo "There was an error retrieving the file from wget." >&2
		clean
		exit 2
	fi
	
	./kaon_hw4_wget.sh $year2
	
	if [[ $? -ne 0 ]]
	then
		echo "There was an error retrieving the file from wget." >&2
		clean
		exit 2
	fi
else
	year2=2015
	./kaon_hw4_wget.sh $year
	
	if [[ $? -ne 0 ]]
	then
		echo "There was an error retrieving the file from wget." >&2
		clean
		exit 2
	fi
	
	./kaon_hw4_wget.sh $year2

	if [[ $? -ne 0 ]]
	then
		echo "There was an error retrieving the file from wget." >&2
		clean
		exit 2
	fi
fi


# Expand Files
./kaon_hw4_expand.sh

if [[ $? -ne 0 ]]
then
	echo "There was an error expanding the files." >&2
	clean
	exit 2
fi


#Loop for filtering Files
ts=`date +%Y_%m_%d_%H:%M`
for i in temp/*
do
	./kaon_hw4.awk $i >> temp/MOCK_DATA_FILTER_$ts.txt

	if [[ $? -ne 0 ]]
	then
		echo "There was an error filtering the files." >&2
		clean
		exit 2
	fi
done


#Zip the Final File
./kaon_hw4_zip.sh temp/MOCK_DATA_FILTER_$ts.txt

if [[ $? -ne 0 ]]
then
	echo "There was an error zipping the file." >&2
	clean
	exit 2
fi


#FTP to server.
pushd temp

if [[ ! -z $user && ! -z $passwd ]]
then
	../kaon_hw4_ftp.sh -f MOCK_DATA_FILTER_$ts.zip -u $user -p $passwd

	if [[ $? -ne 0 ]]
	then
		echo "There was an error FTPing to the server." >&2
		popd
		clean
		exit 2
	fi
else
	../kaon_hw4_ftp.sh -f MOCK_DATA_FILTER_$ts.zip

	if [[ $? -ne 0 ]]
	then
		echo "There was an error FTPing to the server." >&2
		popd
		clean
		exit 2
	fi
fi

popd


#Email success message to disignated email address
ftpServ="192.137.190.19.91"
echo "Sending email to $email"
mail -s "Successful!" $email << END_MAIL
Successfully transferred file to FTP $ftpServ server
END_MAIL

if [[ $? -ne 0 ]]
then
	echo "There was an error sending the email." >&2
	clean
	exit 2
fi


#Very Last Thing Cleans the Mess
clean


exit 0

