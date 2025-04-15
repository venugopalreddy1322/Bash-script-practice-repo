# 🌀 Log Rotation Script

**Author:** Venugopal Reddy  
**Purpose:** Automate the process of rotating, compressing, and cleaning up log files in a given directory.

## 📋 Description

This Bash script is designed to:

- Rotate log files by moving them from a specified `logs` directory to a `backup` directory.
- Append a timestamp to each log file during rotation.
- Compress the rotated log files using `gzip`.
- Delete old compressed log files based on a defined retention period (default is 1 day).

## 📂 Directory Structure

By default, the script expects the following:

```
.
├── log_rotate.sh         # The main script file
├── logs/                 # Directory containing original log files (.log)
└── backup/               # Directory to store rotated and compressed log files
```

You can modify `LOG_DIR` and `BACKUP_DIR` inside the script as needed.

## ⚙️ Configuration

Inside the script, the following default values are set:

```bash
LOG_DIR=logs            # Path to your log files
BACKUP_DIR=backup       # Destination for archived logs
RETENTION_DAYS=1        # Number of days to keep compressed logs
```

You may uncomment and use the `read` line if you want user input for `LOG_DIR`.

## 🚀 How to Use

### 1. Prepare your environment

Make sure you have a `logs` folder containing `.log` files. (For testing purpose)

### 2. Make the script executable
Give executable permissions

```bash
chmod +x log_rotate.sh
```

### 3. Run the script

```bash
./log_rotate.sh
```

### 4. Check results

- Rotated logs will appear in the `backup` directory with a timestamp.
- They will be compressed as `.gz` files.
- Old compressed logs older than 1 day will be deleted automatically.

## 🧠 What the Script Does

### Step 1: Read User Input
Here we assigned the values to the variables, instead we can pass the values as arguements at runtime.

```bash
LOG_DIR=logs
BACKUP_DIR=backup
RETENTION_DAYS=1
```

These are default values, customizable in the script.

### Step 2: Setup Directories

- Checks if `logs/` exists. If not, exits with an error.
- Creates `backup/` directory if it doesn't exist.

### Step 3: Rotate Logs

- Iterates over all `.log` files in `logs/`.
- Adds a timestamp suffix.
- Moves them to the `backup/` directory.

Example:  
`app.log` → `app_20250415_121530.log`

### Step 4: Compress Logs

- Compresses `.log` files in the `backup/` folder using `gzip`.

### Step 5: Cleanup Old Logs

- Deletes compressed `.gz` log files older than `RETENTION_DAYS`.

```bash
find $BACKUP_DIR -type f -name "*.gz" -mtime +$RETENTION_DAYS -exec rm -f {} \;
```

## 🛠️ Sample Output

```
Logs directory(logs) exists
Archived logs/app.log
Compressing log files in Backup Directory
Done with Compression
Cleaning up backup logs older than 1 Day(s)...
Log Rotation completed Successfully ..
```

## 🧪 Tips for Testing

Replace `-mtime` with `-mmin` in the cleanup command to test with files just minutes old:

```bash
find $BACKUP_DIR -type f -name "*.gz" -mmin +2 -exec rm -f {} \;
```

## 📎 License

This script is free to use, modify, and distribute.

## 🙋‍♂️ Questions?

Feel free to reach out or open an issue if you need help using or modifying this script.
