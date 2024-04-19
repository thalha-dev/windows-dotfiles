<#
This script can be used to Create a ShortCut for an Exe File
C:\PS> C:\Script\Create_a_shortcut.ps1 C:\Program Files (x86)\Mozilla Firefox\firefox.exe C:\Users\gautam-2374\Desktop\Firefox.lnk
Create a ShortCut for an Exe File in Desktop.
#>

param ( [string]$ExePath, [string]$ShortcutPath )
#Use the New-Object cmdlet to create an instance of the Wscript.Shell object
$WshShell = New-Object -comObject WScript.Shell
#As soon as we have that object in hand we can then use the CreateShortcut method to create a new shortcut in memory
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $ExePath
$Shortcut.Save()
