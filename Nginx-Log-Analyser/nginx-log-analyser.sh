#!/bin/bash

# Path to the log file
# add path of log file as first argument
LOG_FILE=$1  

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
  echo "Error: Log file '$LOG_FILE' not found!"
  exit 1
fi

echo "================================================="
echo "NGINX LOG ANALYZER"
echo "Analyzing: $LOG_FILE"
echo "================================================="

# Top 5 IP addresses
echo -e "\nTop 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'

# Top 5 most requested paths
echo -e "\nTop 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'

# Top 5 response status codes
echo -e "\nTop 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'

# Top 5 user agents
echo -e "\nTop 5 user agents:"
awk -F'"' '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'

echo "================================================="
