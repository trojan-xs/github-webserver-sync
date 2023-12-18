# github-webserver-sync
super inefficient webserver sync to github linux bash script

## Overview
This script is designed to synchronize files from a GitHub repository with a Docker Nginx web server. It provides a convenient way to update the contents of a specified directory with the latest version of a GitHub repository.

## Prerequisites
**Bash Shell:** Ensure that you have a Bash shell environment available on your system.

**Git:** The script utilizes Git to clone the GitHub repository. Make sure Git is installed on your machine.


## Workflow
**Check Arguments:**
Usage:
``./sync_github_to_nginx.sh <GitHub_Repo_Link> <Global_Path_to_Directory>`
**Directory Check:**

Check if the specified directory exists.
If it exists, delete its contents.
If it doesn't exist, create the directory.
Clone GitHub Repository:

Clone the specified GitHub repository into the provided directory.
**Completion:**

Display a success message indicating that the process has been completed successfully.


## Example Usage:
**For prod.sh:**
```
./prod.sh https://github.com/username/my-webpage.git /path/to-nginx-linked-volume-with-webpage
```
**For dev.sh:**
```
./dev.sh https://github.com/username/my-webpage.git /path/to-nginx-linked-volume-with-webpage
```

'<GitHub_Repo_Link>': The link to the GitHub repository you want to sync.

'<Global_Path_to_Directory>': The global path to the directory where the GitHub repository will be cloned or updated.


# Scheduling
This script is used with crontab. Specify the frequency of execution through crontab.
```
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of the month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday 7 is also Sunday on some systems)
# │ │ │ │ │ ┌───────────── command to issue                               
# │ │ │ │ │ │
# │ │ │ │ │ │
# * * * * * /bin/bash {Location of the script} {Script flags}
```
stolen from K0p1-Git's cloudflare-ddns-updater