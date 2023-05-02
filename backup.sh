#!/bin/bash
# Set the path to the directory you want to copy
backup_source=/path/to/source

# Set the path to the directory where you want to create the backup
backup_destination=/path/to/destination

# Set the time when the script should run every day
backup_time="23:00"

# Set the date when the backup should start
backup_start_date="2023-05-03"

# Set the rsync options for copying files
rsync_options="-avzh --delete"

# Check if the backup has already been performed today
if [ $(date +%Y-%m-%d) == $backup_start_date ]; then
    echo "Backup already performed today"
else
    # Add a cron job to run the script every day at the specified time
    (crontab -l ; echo "$backup_time * * * rsync $rsync_options $backup_source $backup_destination") | crontab -

    echo "Backup task created successfully"
fi