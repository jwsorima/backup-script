$DesktopPath = [Environment]::GetFolderPath("Desktop")
$DocumentsPath = [Environment]::GetFolderPath("MyDocuments")
$DownloadsPath = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
$MusicPath = [Environment]::GetFolderPath("MyMusic")
$PicturesPath = [Environment]::GetFolderPath("MyPictures")
$VideosPath = [Environment]::GetFolderPath("MyVideos")

$BackupFolder = Read-Host "Type backup folder location (ex. D:\FilesBackup)"

function Find-Folders($Src) {
    if (-Not (Test-Path -Path $Src)) {
        Write-Host "Folder not found." -ForegroundColor Red
        Exit
    } else {
        if (Test-Path -Path "$Src\Desktop") {Write-Output "$Src\Desktop --> $DesktopPath"} 
            else {
                Write-Host "Desktop not found." -ForegroundColor Red 
                Exit
            }
        if (Test-Path -Path "$Src\Documents") {Write-Output "$Src\Documents --> $DocumentsPath"} 
            else {
                Write-Host "Documents not found." -ForegroundColor Red 
                Exit
            }
        if (Test-Path -Path "$Src\Downloads") {Write-Output "$Src\Downloads --> $DownloadsPath"} 
            else {
                Write-Host "Downloads not found." -ForegroundColor Red
                Exit
            }
        if (Test-Path -Path "$Src\Music") {Write-Output "$Src\Music --> $MusicPath"} 
            else {
                Write-Host "Music not found." -ForegroundColor Red
                Exit
            }
        if (Test-Path -Path "$Src\Pictures") {Write-Output "$Src\Pictures --> $PicturesPath"} 
            else {
                Write-Host "Pictures not found." -ForegroundColor Red 
                Exit
            }
        if (Test-Path -Path "$Src\Videos") {Write-Output "$Src\Videos --> $VideosPath"} 
            else {
                Write-Host "Videos not found." -ForegroundColor Red 
                Exit
            }
    }
}
function Restore-Files {
    robocopy "$BackupFolder\Desktop" $DesktopPath /copy:DAT /e /dcopy:T
    robocopy "$BackupFolder\Documents" $DocumentsPath /copy:DAT /e /dcopy:T
    robocopy "$BackupFolder\Downloads" $DownloadsPath /copy:DAT /e /dcopy:T
    robocopy "$BackupFolder\Music" $MusicPath /copy:DAT /e /dcopy:T
    robocopy "$BackupFolder\Pictures" $PicturesPath /copy:DAT /e /dcopy:T
    robocopy "$BackupFolder\Videos" $VideosPath /copy:DAT /e /dcopy:T
}
Find-Folders($BackupFolder)
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