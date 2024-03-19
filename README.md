# RAM Flusher

This is a simple batch script for Windows that provides a menu of options for managing your system's resources.

## Features

1. **Flush DNS**: This option flushes the DNS cache to free up some memory.
2. **Reset IP/WINSOCK Catalog**: This option resets the IP configuration and Winsock Catalog to clear up some memory.
3. **Kill Task**: This option allows you to manually terminate a task by entering its PID or image name.
4. **Start Task**: This option allows you to manually start a task by entering its image name (for example, 'outlook.exe').
5. **Exit**: This option exits the script.

## Usage

To use this script, simply run it in the Command Prompt. You will be presented with a menu of options. Enter the number of the option you want to execute.

For example, if you want to flush the DNS, you would enter `1`.

## Notes

- Options 1, 2, and 3 may require administrative rights, depending on the specific tasks and your system's security settings.
- The script checks if the input is a number between 1 and 5. If an invalid input is entered, it will display an error message and prompt you to enter a valid option.
- For the "Kill Task" option, you will be asked to enter the PID or image name of the application you want to close. If an invalid PID or image name is entered, it will display an error message and prompt you to enter a valid PID or image name.
- For the "Start Task" option, you will be asked to enter the image name of the application you want to start. The application needs to be in the system's PATH for the `start` command to work. If the application is not in the PATH, you will need to enter the full path to the application's executable file.
- Always run scripts that modify system files with caution, and only when necessary. Misuse can lead to data loss or system instability. If you're unsure about any steps, it's best to seek professional help.

## Disclaimer

This script is provided as is, without warranty of any kind. Use of this script is at your own risk. The author is not responsible for any damage that might be caused due to its use.
