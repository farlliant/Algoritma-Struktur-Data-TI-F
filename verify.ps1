$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$BuildRoot = Join-Path $Root ".build"

if (Test-Path $BuildRoot) {
    Remove-Item $BuildRoot -Recurse -Force
}

New-Item `
    -ItemType Directory `
    -Path $BuildRoot `
    -Force | Out-Null

$Ignored = "\\(\.git|\.build|\.run|\.vscode-java)\\"

$JavaFiles = @(
    Get-ChildItem `
        -Path $Root `
        -Recurse `
        -Filter "*.java" `
        -File |
    Where-Object {
        $_.FullName -notmatch $Ignored
    }
)

$Modules = @(
    $JavaFiles |
    Group-Object DirectoryName |
    Sort-Object Name
)

$Failed = @()

Write-Host ""
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host " ASD JAVA BUILD VERIFICATION" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Discovered Java modules: $($Modules.Count)" `
    -ForegroundColor Cyan

Write-Host ""

$Index = 0

foreach ($Module in $Modules) {

    $Index++

    $Directory = $Module.Name

    $Relative = $Directory.Substring(
        $Root.Length
    ).TrimStart("\", "/")

    $SafeName = (
        "{0:D2}_{1}" -f $Index,
        ($Relative -replace '[^A-Za-z0-9_-]', '_')
    )

    $OutputDir = Join-Path $BuildRoot $SafeName

    New-Item `
        -ItemType Directory `
        -Path $OutputDir `
        -Force | Out-Null

    Write-Host "[BUILD] $Relative" `
        -ForegroundColor Yellow

    $Arguments = @(
        "-encoding"
        "UTF-8"
        "-d"
        $OutputDir
    )

    foreach ($File in $Module.Group) {
        $Arguments += $File.FullName
    }

    & javac $Arguments

    if ($LASTEXITCODE -ne 0) {

        Write-Host "[FAIL] $Relative" `
            -ForegroundColor Red

        $Failed += $Relative

    }
    else {

        Write-Host "[ OK ] $Relative" `
            -ForegroundColor Green
    }

    Write-Host ""
}

Write-Host "==============================================" -ForegroundColor Cyan

if ($Failed.Count -gt 0) {

    Write-Host "BUILD FAILED" -ForegroundColor Red
    Write-Host ""

    foreach ($Name in $Failed) {
        Write-Host " - $Name" -ForegroundColor Red
    }

    exit 1
}

Write-Host "ALL MODULES COMPILED SUCCESSFULLY" `
    -ForegroundColor Green

Write-Host "==============================================" -ForegroundColor Cyan

exit 0