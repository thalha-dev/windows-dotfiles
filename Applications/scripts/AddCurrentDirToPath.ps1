# Get the current directory
$currentDir = Get-Location

# Get the current PATH
$path = [Environment]::GetEnvironmentVariable("PATH", "User")

# Append the current directory to the PATH
$path = $path + ";" + $currentDir

# Set the new PATH
[Environment]::SetEnvironmentVariable("PATH", $path, "User")

# Output the new PATH
Write-Output "New PATH: $path"
