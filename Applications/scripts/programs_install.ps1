# check for winget presence
if (-Not (Get-Command "winget" -errorAction SilentlyContinue)) {
  Write-Error -Message "Please install winget"
  exit 1
}

# Check Permissions
if ( -Not( (New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) ){
    Write-Error -Message "Script needs Administrator permissions"
    exit 1
}

# scoop installation
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# chocolatey installation
if (-Not (Get-Command "choco" -errorAction SilentlyContinue)) {
   Set-ExecutionPolicy Bypass -Scope Process -Force
   [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
   iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# dont need to give confirmantion after this
choco feature enable -n=allowGlobalConfirmation


# ----------------------------------------------------
#                   WINGET PROGRAMS
# ----------------------------------------------------

winget install -e --id Google.Chrome --silent
winget install -e --id Mozilla.Firefox.DeveloperEdition --silent
winget install -e --id Microsoft.PowerShell --silent
winget install -e --id TheDocumentFoundation.LibreOffice --silent
winget install -e --id SumatraPDF.SumatraPDF --silent
winget install -e --id VideoLAN.VLC --silent
winget install -e --id BleachBit.BleachBit --silent
winget install -e --id Balena.Etcher --silent
winget install -e --id Rufus.Rufus --silent
winget install -e --id voidtools.Everything --silent
winget install -e --id Microsoft.WindowsTerminal.Preview --silent
winget install -e --id Git.Git --silent
winget install -e --id Microsoft.VisualStudioCode --silent
winget install -e --id Microsoft.PowerBI --silent
winget install -e --id LGUG2Z.komorebi --silent

# ----------------------------------------------------
#                  CHOCOLATEY PROGRAMS
# ----------------------------------------------------


choco install keypirinha
choco install 7zip
choco install fzf
choco install mpv
choco install gimp
choco install krita
choco install inkscape 
choco install lazygit
choco install less
choco install mdcat
choco install jq
choco install curl
choco install wget
choco install yt-dlp
choco install virtualbox
choco install bat
choco install chezmoi
choco install delta
choco install gsudo
choco install lf
choco install neovim
choco install vim
choco install ripgrep
choco install vifm
choco install inkscape
choco install zoxide
choco install grep
choco install localsend
choco install openssl
choco install make
choco install autohotkey
choco install postman
choco install winrar


# ----------------------------------------------------
#                     SCOOP PROGRAMS
# ----------------------------------------------------

scoop install main/eza
scoop install main/kondo
scoop install main/fastfetch
scoop install main/unzip
