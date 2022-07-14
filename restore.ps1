$DesktopPath = [Environment]::GetFolderPath("Desktop")
$DocumentsPath = [Environment]::GetFolderPath("MyDocuments")
$DownloadsPath = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
$MusicPath = [Environment]::GetFolderPath("MyMusic")
$PicturesPath = [Environment]::GetFolderPath("MyPictures")
$VideosPath = [Environment]::GetFolderPath("MyVideos")

$BackupFolder = Read-Host "Type backup folder location (ex. D:\FilesBackup)" -ForegroundColor Cyan

function Restore-Files {
    robocopy "$BackupFolder\Desktop" $DesktopPath /copy:DAT /e /dcopy:T
    robocopy "$BackupFolder\Documents" $DocumentsPath /copy:DAT /e /dcopy:T
    robocopy "$BackupFolder\Downloads" $DownloadsPath /copy:DAT /e /dcopy:T
    robocopy "$BackupFolder\Music" $MusicPath /copy:DAT /e /dcopy:T
    robocopy "$BackupFolder\Pictures" $PicturesPath /copy:DAT /e /dcopy:T
    robocopy "$BackupFolder\Videos" $VideosPath /copy:DAT /e /dcopy:T
}

if (-Not (Test-Path -Path $BackupFolder)) {
    Write-Host "Folder not found." -ForegroundColor Red
    return
}

if (Test-Path -Path "$BackupFolder\Desktop") {Write-Output "$BackupFolder\Desktop --> $DesktopPath"} 
    else {
        Write-Host "Desktop not found." -ForegroundColor Red 
        return
    }
if (Test-Path -Path "$BackupFolder\Documents") {Write-Output "$BackupFolder\Documents --> $DocumentsPath"} 
    else {
        Write-Host "Documents not found." -ForegroundColor Red 
        return
    }
if (Test-Path -Path "$BackupFolder\Downloads") {Write-Output "$BackupFolder\Downloads --> $DownloadsPath"} 
    else {
        Write-Host "Downloads not found." -ForegroundColor Red
        return
    }
if (Test-Path -Path "$BackupFolder\Music") {Write-Output "$BackupFolder\Music --> $MusicPath"} 
    else {
        Write-Host "Music not found." -ForegroundColor Red
        return
    }
if (Test-Path -Path "$BackupFolder\Pictures") {Write-Output "$BackupFolder\Pictures --> $PicturesPath"} 
    else {
        Write-Host "Pictures not found." -ForegroundColor Red 
        return
    }
if (Test-Path -Path "$BackupFolder\Videos") {Write-Output "$BackupFolder\Videos --> $VideosPath"} 
    else {
        Write-Host "Videos not found." -ForegroundColor Red 
        return
    }

while ($true) {
    $UserInput = Read-Host "continue? (y/n)".ToLower()
    if (($UserInput -eq "y") -or ($UserInput -eq "n")) {
        break
    } else {
        Write-Output "Invalid Input"
    }
}
Restore-Files
Write-Host "Done." -ForegroundColor Green