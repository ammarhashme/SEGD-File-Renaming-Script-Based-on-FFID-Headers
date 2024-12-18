# SEGD File Renaming Script Based on FFID Headers

## Description
This Bash script automates the renaming of SEGD files based on the **FFID (Field File Identification)** extracted from their file headers. The script reads the first 32 bytes of each file, identifies the FFID, converts it to hexadecimal format, and renames the file as `FFID<FFID>.segd`.

## Features
- Automated renaming of SEGD files.
- Reads FFID directly from file headers.
- Supports batch renaming within a specified directory.
- Includes error handling for invalid directories and missing files.

## Prerequisites
- Bash (Linux/Mac)
- `xxd` utility (to read file headers). Install it using:
  ```bash
  sudo apt-get install xxd

