# SSH Key Validation Script

This repository contains a Bash script designed to validate the format of SSH keys in an `authorized_keys` file.

## Overview

The script reads each line of the specified `authorized_keys` file, checks if the line contains a valid SSH key, and reports any lines with invalid key formats. It is particularly useful for system administrators who need to ensure the integrity of SSH keys in a multi-user environment.

## Features

- Validates the format of SSH keys in the specified `authorized_keys` file.
- Reports the line number and content of any invalid keys.
- Provides clear error messages if the file does not exist or contains invalid keys.
- Efficiently processes keys without creating temporary files.

## Prerequisites

- Ensure you have read access to the `authorized_keys` file.
- The `ssh-keygen` command must be available on your system.
- Make sure to update the path to your system keys to check before executing `validate_ssh_keys.sh`

## Usage

1. **Make the script executable:**
   ```bash
   chmod +x validate_ssh_keys.sh
   ```

2. **Run the script:**
   ```bash
   ./validate_ssh_keys.sh
   ```

### Script Details

The script will execute the following actions:

- Check if the `authorized_keys` file exists at the specified path.
- Read each line of the file and validate the SSH key format using `ssh-keygen`.
- Report any lines with invalid key formats, including the line number and content.

### Key Validation Method

The script uses the following command to validate each key:
```bash
echo "$line" | ssh-keygen -l -f /dev/stdin
```
This method efficiently checks the key format without creating temporary files.

## License

This project is open-source and available under the [MIT License](LICENSE).

## Contact

For any questions or issues, please contact Alvaro Gutierrez Araque at Alvaro.GutierrezAr@ext.esa.int.
