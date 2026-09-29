$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$LiveCodingRoot = Join-Path $Root "Live Coding"

if (-not (Test-Path $LiveCodingRoot)) {
    throw "Folder Live Coding tidak ditemukan."
}

$Tests = @(
    Get-ChildItem `
        -Path $LiveCodingRoot `
        -Recurse `
        -Filter "test.ps1" `
        -File |
    Sort-Object FullName
)

if ($Tests.Count -eq 0) {
    throw "Tidak ditemukan public test pada folder Live Coding."
}

$Passed = 0
$Failed = 0

Write-Host ""
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host " ASD LIVE CODING PUBLIC TESTS" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Discovered public tests: $($Tests.Count)" `
    -ForegroundColor Cyan

Write-Host ""

foreach ($Test in $Tests) {

    $Relative = $Test.FullName.Substring(
        $Root.Length
    ).TrimStart("\", "/")

    Write-Host "----------------------------------------------" `
        -ForegroundColor DarkGray

    Write-Host "[TEST] $Relative" `
        -ForegroundColor Yellow

    Write-Host ""

    try {

        & $Test.FullName

        $Passed++

        Write-Host ""
        Write-Host "[ OK ] $Relative" `
            -ForegroundColor Green

    }
    catch {

        $Failed++

        Write-Host ""
        Write-Host "[FAIL] $Relative" `
            -ForegroundColor Red

        Write-Host $_.Exception.Message `
            -ForegroundColor Red
    }

    Write-Host ""
}

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "PUBLIC TEST SUMMARY" -ForegroundColor Cyan
Write-Host ""
Write-Host "Passed : $Passed"
Write-Host "Failed : $Failed"
Write-Host "Total  : $($Tests.Count)"
Write-Host ""

if ($Failed -gt 0) {
    Write-Host "LIVE CODING PUBLIC TESTS FAILED" `
        -ForegroundColor Red

    Write-Host "==============================================" `
        -ForegroundColor Cyan

    exit 1
}

Write-Host "ALL LIVE CODING PUBLIC TESTS PASSED" `
    -ForegroundColor Green

Write-Host "==============================================" `
    -ForegroundColor Cyan

exit 0
