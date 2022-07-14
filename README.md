# Backup and Restore

Backup %USERPROFILE% folders Desktop, Documents, Downloads, Music, Pictures, and Videos in windows using [Robocopy](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy).

# How to use
Open Powershell then paste the script

## Backup
```
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/jwsorima/backup-script/main/backup.ps1'))
```
## Restore
```
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/jwsorima/backup-script/main/restore.ps1'))
```
