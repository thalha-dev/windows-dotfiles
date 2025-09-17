Set-PSReadlineOption -EditMode Vi


# ALIASES

# copy path to clipboard
function cpath {
    pwd | rg \\ | clip
}

#fetch sys info
function fsf {
    fastfetch --logo Windows
}


# download youtube video with id
function ytd {
    param (
        [string]$Id,
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$Arguments
    )

    yt-dlp -f $Id $Arguments
}


# get youtube video format list
function ytl {
    param (
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$Arguments
    )

    yt-dlp --list-formats $Arguments
}

function n {
    param (
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$Arguments
    )

    nvim $Arguments
}

# Regularly used in linux, but now for Windows
function which { param($bin) Get-Command $bin }

# fuzzy find open
function ffo {
    $file = Get-ChildItem -Path . | Select-Object -ExpandProperty FullName | fzf
    if ($file) {
        Start-Process -FilePath $file
    } else {
        Write-Host "No file selected."
    }
}

# fuzzy find recursive open
function ffro {
    $file = Get-ChildItem -Path . -Recurse | Select-Object -ExpandProperty FullName | fzf
    if ($file) {
        Start-Process -FilePath $file
    } else {
        Write-Host "No file selected."
    }
}

# fuzzy find nvim open
function ffno {
    $file = Get-ChildItem -Path . | Select-Object -ExpandProperty FullName | fzf
    if ($file) {
        nvim $file
    } else {
        Write-Host "No file selected."
    }
}

# fuzzy find nvim recursive open
function ffnro {
    $file = Get-ChildItem -Path . -Recurse | Select-Object -ExpandProperty FullName | fzf
    if ($file) {
        nvim $file
    } else {
        Write-Host "No file selected."
    }
}


# yazi

function f {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}


## VISUAL STUDIO

# function Invoke-VSIXInstaller {
#   $ErrorActionPreference = 'Stop'
#
#   $path = vswhere -latest -prerelease -products * -property enginePath | Join-Path -ChildPath 'VSIXInstaller.exe'
#
#   if (Test-Path $path) {
#     & $path $args
#   }
# }
#
# function Invoke-VSTest {
#   $ErrorActionPreference = 'Stop'
#
#   $path = vswhere -latest -products * -requires Microsoft.VisualStudio.Workload.ManagedDesktop Microsoft.VisualStudio.Workload.Web -requiresAny -property installationPath
#   $path = join-path $path 'Common7\IDE\CommonExtensions\Microsoft\TestWindow\vstest.console.exe'
#
#   if (test-path $path) {
#     & $path $args
#   }
# }


## OTHERS

# Set-PSReadLineOption -PredictionViewStyle ListView
# Import-Module posh-git

# accept prediction 
Set-PSReadLineKeyHandler -Chord "Ctrl+l" -Function AcceptSuggestion


fnm env --use-on-cd | Out-String | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })
