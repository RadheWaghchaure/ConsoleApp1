# Create the target build output directory if it doesn't exist
if (!(Test-Path $env:TARGET_DIR)) {
    New-Item -Path $env:TARGET_DIR -ItemType Directory -Force
}

# Create the release directory if it doesn't exist
if (!(Test-Path $env:RELEASE_DIR)) {
    New-Item -Path $env:RELEASE_DIR -ItemType Directory -Force
}

# Copy compiled files to the target output directory
Copy-Item -Path "$env:BUILD_DIR\*" -Destination "$env:TARGET_DIR" -Recurse -Force

# Also copy to release archive (optional)
Copy-Item -Path "$env:BUILD_DIR\*" -Destination "$env:RELEASE_DIR" -Recurse -Force

Write-Host "Post-build deployment completed successfully."
