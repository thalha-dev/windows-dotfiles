# syncdown.ps1
# Sync Google Drive art -> current directory (Drive -> local)
$RemoteArt    = "gdrive:art"
$LogFolder    = Join-Path $env:USERPROFILE "rclone-sync-logs"
$Dest         = (Get-Location).Path

if (-not (Get-Command rclone -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: rclone not found in PATH. Install rclone first." -ForegroundColor Red
    exit 1
}

function Save-Log($name, $content) {
    if (-not (Test-Path $LogFolder)) { New-Item -Path $LogFolder -ItemType Directory | Out-Null }
    $file = Join-Path $LogFolder ("$name-" + (Get-Date -Format "yyyyMMdd-HHmmss") + ".log")
    $content | Out-File -FilePath $file -Encoding utf8
    return $file
}

Write-Host "Destination (local) = $Dest" -ForegroundColor Cyan
$dryArgs = @("sync", $RemoteArt, $Dest, "--dry-run", "--progress")
Write-Host "DRY-RUN: what would change (drive -> local)" -ForegroundColor Cyan
$dryOut = & rclone @dryArgs 2>&1
Write-Host $dryOut
$dryLog = Save-Log "syncdown-dry" $dryOut
Write-Host "Dry-run saved: $dryLog" -ForegroundColor Yellow

do {
    $ans = Read-Host "Proceed with actual sync (this WILL update local to match Drive)? (y/n)"
    $ans = $ans.Trim().ToLower()
} while ($ans -ne 'y' -and $ans -ne 'n')

if ($ans -eq 'y') {
    $realArgs = @("sync", $RemoteArt, $Dest, "--progress")
    Write-Host "Running actual sync..." -ForegroundColor Green
    $realOut = & rclone @realArgs 2>&1
    Write-Host $realOut
    $realLog = Save-Log "syncdown-real" $realOut
    Write-Host "Sync complete. Log: $realLog" -ForegroundColor Yellow
} else {
    Write-Host "Aborted. No changes were made." -ForegroundColor Magenta
}

