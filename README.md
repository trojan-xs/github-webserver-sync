# github-webserver-sync
super inefficient webserver sync to github linux bash script






Example:
For prod.sh:
```
./prod.sh https://github.com/username/my-webpage.git /path/to-nginx-linked-volume-with-webpage
```
For dev.sh:
```
./dev.sh https://github.com/username/my-webpage.git /path/to-nginx-linked-volume-with-webpage
```



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