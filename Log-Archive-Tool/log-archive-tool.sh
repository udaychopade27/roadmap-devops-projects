#!/bin/bash
# =============================================
# Log Archiving Tool            
# ============================================= 
# This script archives log files from a specified directory
# and compresses them into a tar.gz file.
# Usage: ./script.sh /path/to/logs /path/to/archive
# =============================================         

# Configuration
LOG_DIR="$1"
ARCHIVE_DIR="$2"

# Check if both arguments are provided
if [ -z "$LOG_DIR" ] || [ -z "$ARCHIVE_DIR" ]; then
  echo "❌ Usage: $0 <log_directory> <archive_directory>"
  exit 1
fi

# Check if source directory exists
if [ ! -d "$LOG_DIR" ]; then
  echo "❌ Error: Log directory '$LOG_DIR' does not exist."
  exit 1
fi

# Create archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Get current date for naming the archive
CURRENT_DATE=$(date +"%Y%m%d_%H%M%S")

# Archive log files in given folder
tar -czf "$ARCHIVE_DIR/logs_archive_${CURRENT_DATE}.tar.gz" -C "$LOG_DIR" .

# Confirmation
if [ $? -eq 0 ]; then
  echo "✅ Archive created successfully: $ARCHIVE_DIR/logs_archive_${CURRENT_DATE}.tar.gz"
else
  echo "❌ Archive creation failed."
fi
