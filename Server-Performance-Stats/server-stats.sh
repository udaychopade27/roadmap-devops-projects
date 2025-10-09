#!/bin/bash
# =============================================
# System Resource Monitoring Script
# =============================================

echo "============================================="
echo "📊 SYSTEM RESOURCE REPORT - $(date)"
echo "============================================="

# --- OS and System Info ---
echo ""
echo "🖥️  SYSTEM INFORMATION"
echo "---------------------------------------------"
echo "Hostname: $(hostname)"
echo "OS Version: $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '\"')"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "Load Average: $(uptime | awk -F'load average:' '{ print $2 }')"
echo "Logged in Users: $(who | wc -l)"
echo ""

# --- CPU Usage ---
echo "💻 CPU USAGE"
echo "---------------------------------------------"
mpstat 1 1 | awk '/Average/ && $12 ~ /[0-9.]+/ {print "Total CPU Usage: " 100 - $12 "%"}'
echo ""

# --- Memory Usage ---
echo "🧠 MEMORY USAGE"
echo "---------------------------------------------"
free -h | awk '
/Mem:/ {
  total=$2; used=$3; free=$4;
  printf("Total Memory: %s\nUsed Memory: %s\nFree Memory: %s\n", total, used, free);
}
/Mem:/ {
  total=$2; used=$3;
  printf("Memory Used: %.2f%%\n", (used/total)*100);
}'
echo ""

# --- Disk Usage ---
echo "💾 DISK USAGE"
echo "---------------------------------------------"
df -h --total | awk '
/total/ {
  total=$2; used=$3; avail=$4; usep=$5;
  printf("Total Disk Space: %s\nUsed: %s\nAvailable: %s\nUsage: %s\n", total, used, avail, usep);
}'
echo ""

# --- Top 5 Processes by CPU ---
echo "🔥 TOP 5 PROCESSES BY CPU USAGE"
echo "---------------------------------------------"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo ""

# --- Top 5 Processes by Memory ---
echo "🧩 TOP 5 PROCESSES BY MEMORY USAGE"
echo "---------------------------------------------"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6
echo ""

# --- Stretch Goal: Failed Login Attempts (optional, requires root) ---
if [ "$EUID" -eq 0 ]; then
    echo "🚨 FAILED LOGIN ATTEMPTS (last 5)"
    echo "---------------------------------------------"
    lastb | head -n 5
    echo ""
fi

echo "============================================="
echo "✅ END OF REPORT"
echo "============================================="
