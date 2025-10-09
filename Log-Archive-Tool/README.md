# Log Archiving Tool
A simple Bash script to **archive log files** from a specified directory and compress them into a timestamped `.tar.gz` file.

---

## 📋 Features
- Archives all files from a given log directory.
- Creates a **timestamped archive** in the format:  
  `logs_archive_YYYYMMDD_HHMMSS.tar.gz`
- Saves the archive to a specified destination directory.
- Automatically creates the archive directory if it doesn't exist.
- Simple and lightweight Bash script, requires no extra dependencies.
---

## ⚙️ Requirements

- Linux or macOS system
- Bash shell
- `tar` utility (usually pre-installed)
---

## 💻 Usage

1. Clone or download the script:
```bash
git clone <your-repo-url>
cd <repo-folder>
```
2. Make the script executable:
```bash
chmod +x log_archive.sh
```
3. Run the script:
```bash
./log_archive.sh <log_directory> <archive_directory>
```
<log_directory>: Path of the directory containing logs to archive.
<archive_directory>: Path where the compressed archive should be saved.


This project can be found on https://roadmap.sh/projects/log-archive-tool



