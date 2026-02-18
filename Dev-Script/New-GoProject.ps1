param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectName
)

$ReposDirectory = "C:\Users\zombi\source\repos"

if (-not (Test-Path $ReposDirectory)) {
    Write-Host "Creating repos directory: $ReposDirectory"
    New-Item -ItemType Directory -Path $ReposDirectory -Force
}

$ProjectPath = Join-Path $ReposDirectory $ProjectName

if (Test-Path $ProjectPath) {
    Write-Host "Project directory already exists: $ProjectPath"
    exit 1
}

Write-Host "Creating Go project: $ProjectName"
New-Item -ItemType Directory -Path $ProjectPath -Force

Set-Location $ProjectPath

Write-Host "Initializing Go module..."
go mod init $ProjectName

Write-Host "Creating main.go..."
@"
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
"@ | Out-File -FilePath "main.go" -Encoding UTF8

Write-Host "Go project '$ProjectName' created successfully at: $ProjectPath"
Write-Host "Run 'cd $ProjectPath' and then 'go run main.go' to test"