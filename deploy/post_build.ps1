param (
    [string]$buildDir = "C:\JenkinsWorkspace\MyApp\src\bin\Release",
    [string]$targetDir = "E:\Build Output\MyUser",
    [string]$releaseDir = "E:\Release Data\MyUser"
)

# Create directories if not exist
New-Item -Path $targetDir -ItemType Directory -Force
New-Item -Path $releaseDir -ItemType Directory -Force

# Copy DLLs
Copy-Item "$buildDir\*" -Destination $targetDir -Recurse -Force

# Run the executable
Start-Process "$targetDir\MyApp.exe" -NoNewWindow -Wait

# Zip the build
$timestamp = Get-Date -Format "yyyyMMddHHmmss"
$zipPath = "$releaseDir\MyApp_$timestamp.zip"
Compress-Archive -Path "$targetDir\*" -DestinationPath $zipPath

# Retain only last 5 builds
$zipFiles = Get-ChildItem -Path $releaseDir -Filter "*.zip" | Sort-Object LastWriteTime -Descending
$zipFiles | Select-Object -Skip 5 | Remove-Item

Write-Output "Post-build tasks completed."
