### **Backup and Recovery Automation**

**Goal:** Create an automated backup and recovery system using `tar` and `cronjob`.

**Requirements:**

1. Set up a Docker container with a directory containing mock data files.
2. Write a script to compress the data using `tar` and store it in a backup directory.
3. Schedule the script to run automatically using a `cronjob`.
4. Create a recovery script to extract the backup and restore the files to their original location.
5. Log all backup and recovery actions for later review.

   **let's begin"'**
   clone this repository to your terminal
   
   ```sh
   git clone https://github.com/Guy-Ghis/Script_Backup_and_Recovery_Automation.git
   ```
   change your working directory to the repository

   ```sh
   cd Script_Backup_and_Recovery_Automation
   ```

   To set up dokcer container with a direcotry containing mock data files:
   study and execute the script in generating_mock_files.sh
   ```sh
   ./generating_mock_files.sh
   ```
To compress the data using `tar` and store it in a backup directory, study and run the script in backup.sh
```sh
./backup.sh
```
To schedule the script to ru automatically with cron job:
open your crontab file using the following command
```sh
crontab -e
```
paste the following code snippet
```sh
* * * * * /path/backup.sh source_dir dest_dir
```
save it and exit

To recover backed up files, study and run the script in restore.sh
```sh
./restore.sh
```

**Team:**

Derick(abonghoderick@gmail.com)

Ghislain(tissongguyghislain001@gmail.com)

Ju-Nine(chojuninengu@gmail.com)
