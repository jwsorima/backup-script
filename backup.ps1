$DesktopPath = [Environment]::GetFolderPath("Desktop")
$DocumentsPath = [Environment]::GetFolderPath("MyDocuments")
$DownloadsPath = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
$MusicPath = [Environment]::GetFolderPath("MyMusic")
$PicturesPath = [Environment]::GetFolderPath("MyPictures")
$VideosPath = [Environment]::GetFolderPath("MyVideos")

Write-Host "Type folder location *Make sure it is empty`n(ex. D:\FilesBackup)" -NoNewline -ForegroundColor Cyan
$PasteTo = Read-Host " "

function Copy-Files {
    New-Item -Path $PasteTo -Name "Desktop" -ItemType "directory"
    New-Item -Path $PasteTo -Name "Documents" -ItemType "directory"
    New-Item -Path $PasteTo -Name "Downloads" -ItemType "directory"
    New-Item -Path $PasteTo -Name "Music" -ItemType "directory"
    New-Item -Path $PasteTo -Name "Pictures" -ItemType "directory"
    New-Item -Path $PasteTo -Name "Videos" -ItemType "directory"

    robocopy $DesktopPath "$PasteTo\Desktop" /copy:DAT /e /dcopy:T
    robocopy $DocumentsPath "$PasteTo\Documents" /copy:DAT /e /dcopy:T
    robocopy $DownloadsPath "$PasteTo\Downloads" /copy:DAT /e /dcopy:T
    robocopy $MusicPath "$PasteTo\Music" /copy:DAT /e /dcopy:T
    robocopy $PicturesPath "$PasteTo\Pictures" /copy:DAT /e /dcopy:T
    robocopy $VideosPath "$PasteTo\Videos" /copy:DAT /e /dcopy:T
}

if (Test-Path -Path $PasteTo) {
    Write-Output "`nThis will create folders at $PasteTo and copy files from 
    $DesktopPath  -->  $PasteTo\Desktop
    $DocumentsPath  -->  $PasteTo\Documents
    $DownloadsPath  -->  $PasteTo\Downloads
    $MusicPath  -->  $PasteTo\Music
    $PicturesPath  -->  $PasteTo\Pictures
    $VideosPath  -->  $PasteTo\Videos"

    while ($true) {
        Write-Host "continue? (y/n)" -NoNewline -ForegroundColor Cyan
        $UserInput = Read-Host "".ToLower()
        if (($UserInput -eq "y") -or ($UserInput -eq "n")) {
            break
        } else {
            Write-Host "Invalid Input" -ForegroundColor Red
        }
    }
    if ($UserInput -eq "y") {
        Copy-Files
    } else {
        Write-Output "Exit..."
        Start-Sleep -Seconds 2
        Exit
    }

} else {
    Write-Host "Location not found`nExit..." -ForegroundColor Red
    Start-Sleep -Seconds 2
    Exit
}

Write-Host -NoNewline "`nPress any key to exit..." -ForegroundColor Green
[void][System.Console]::ReadKey($true)