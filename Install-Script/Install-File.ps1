param(
    [Parameter(Mandatory=$true)]
    [string[]]$Files
)
#.\Install-Files.ps1 -Files "myapp.exe", "config.json", "readme.txt"

# 1. Validate that all files exist in the current directory
foreach ($file in $Files) {
    if (-not (Test-Path -LiteralPath $file)) {
        throw "File '$file' does not exist in the current directory: $(Get-Location)"
    }
}

# 2. Identify the executable among the list
$exe = $Files | Where-Object { $_.ToLower().EndsWith(".exe") }

if ($exe.Count -ne 1) {
    throw "Exactly one .exe file must be provided. Found: $($exe.Count)"
}

# 3. Build the directory path in Local/AppData
$exeName = [System.IO.Path]::GetFileNameWithoutExtension($exe)
$targetDir = Join-Path $env:LOCALAPPDATA $exeName

# 4. Create the directory if it doesn't exist
if (-not (Test-Path -LiteralPath $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir | Out-Null
}

# 5. Copy all files into the new directory
foreach ($file in $Files) {
    Copy-Item -LiteralPath $file -Destination $targetDir -Force
}

Write-Host "Copied $($Files.Count) files to $targetDir"