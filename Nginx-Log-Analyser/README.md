# 🧾 Nginx Log Analyzer

A simple yet powerful **Bash script** to analyze Nginx access logs directly from the command line.  
It extracts and summarizes key metrics like top IPs, requested paths, response codes, and user agents — helping you quickly understand traffic patterns and potential issues.

---

## 🚀 Features

This script provides:

- 🔹 **Top 5 IP addresses** with the most requests  
- 🔹 **Top 5 most requested paths (URLs)**  
- 🔹 **Top 5 HTTP response status codes**  
- 🔹 **Top 5 user agents (browsers, crawlers, etc.)**

All results are sorted in descending order (most frequent first).

---

## 🛠️ Prerequisites

Make sure the following are installed (they are usually preinstalled in most Linux distributions):

- `bash`
- `awk`
- `sort`
- `uniq`
- `head`
- `grep`
- `sed` (optional for text processing)

---

## 📂 Log Format

This script assumes your Nginx access log follows the **default Nginx combined log format**, typically found at:

/var/log/nginx/access.log


Example log entry:
```t
45.76.135.253 - - [10/Oct/2025:13:55:36 +0000] "GET /api/v1/users HTTP/1.1" 200 612 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
```

---

## ⚙️ Usage

### 1️⃣ Make the script executable
```bash
chmod +x nginx_log_analyzer.sh
```
```bash
2️⃣ Run the script with the log file as argument
./nginx_log_analyzer.sh /path/to/access.log
```
```bash
Example:
./nginx_log_analyzer.sh /var/log/nginx/access.log
```

## 🧩 Example Output
=================================================
NGINX LOG ANALYZER
Analyzing: /var/log/nginx/access.log
=================================================

Top 5 IP addresses with the most requests:
45.76.135.253 - 1000 requests
142.93.143.8 - 600 requests
178.128.94.113 - 50 requests
43.224.43.187 - 30 requests
178.128.94.113 - 20 requests

Top 5 most requested paths:
/api/v1/users - 1000 requests
/api/v1/products - 600 requests
/api/v1/orders - 50 requests
/api/v1/payments - 30 requests
/api/v1/reviews - 20 requests

Top 5 response status codes:
200 - 1000 requests
404 - 600 requests
500 - 50 requests
401 - 30 requests
304 - 20 requests

Top 5 user agents:
Mozilla/5.0 (Windows NT 10.0; Win64; x64) - 1500 requests
curl/7.68.0 - 100 requests
Googlebot/2.1 - 80 requests
Wget/1.21.1 - 50 requests
PostmanRuntime/7.32.3 - 30 requests
=================================================

🧠 How It Works
| Step | Command                                    | Description                            |
| ---- | ------------------------------------------ | -------------------------------------- |
| 1    | `awk '{print $1}'`                         | Extracts IP addresses                  |
| 2    | `awk '{print $7}'`                         | Extracts request paths                 |
| 3    | `awk '{print $9}'`                         | Extracts response codes                |
| 4    | `awk -F'"' '{print $6}'`                   | Extracts user agents                   |
| 5    | `sort \| uniq -c \| sort -nr \| head -n 5` | Counts, sorts, and lists top 5 entries |

# 🎯 Stretch Goals

Try alternative approaches to practice your shell skills:

Use grep and sed instead of awk for filtering and parsing.

Add colorized output (using tput or echo -e with ANSI codes).

Save results to a report file with timestamps.

Include error or warning detection (e.g., highlight 4xx or 5xx errors).
