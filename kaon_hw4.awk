#!/usr/bin/awk -f


#this script goes over a file and returns the firstName lastName email of Canadian females in that file

BEGIN {FS = ","} 
{
if ( $5 == "Female" && $6 == "Canada" ) { 
if ( ! $4 ) { $4="waldo@weber.edu" } 
print $2 " " $3 " " $4
}

}
