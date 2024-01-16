#!/bin/bash
 
# Source the prancer-lib shell script to call all pr-* library functions.
source shlib/prancer-lib.sh
 
# generate a hello alert, pass the target like: "https://brokencrystals.com/"
# output=`pr_hello_world_alert "$1"`
#
# # Capture the URL passed as an argument
url="$1"
 
# Use curl to fetch data from the modified URL and store the HTTP response code in a variable
code=$(curl --write-out '%{http_code}' --silent --output /dev/null "$url")
 
if [ $code -eq 200 ]; then
  output=`pr_hello_world_alert "$1"`
  echo $output
else
  echo "Site is not existing.... valid"
fi
