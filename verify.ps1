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

$Modules = @(

    @{
        Name = "ADT Array - Percobaan"
        Path = "ADT Array\Percobaan"
    },

    @{
        Name = "ADT Array - Latihan"
        Path = "ADT Array\Latihan"
    },

    @{
        Name = "ADT Array - Tugas 1"
        Path = "ADT Array\Tugas-Praktikum\Tugas-1"
    },

    @{
        Name = "ADT Array - Tugas 2"
        Path = "ADT Array\Tugas-Praktikum\Tugas-2"
    },

    @{
        Name = "SLL - Percobaan 1"
        Path = "ADT Single Linked List\Percobaan-1"
    },

    @{
        Name = "SLL - Percobaan 2 Tahap 1"
        Path = "ADT Single Linked List\Percobaan-2-Tahap-1"
    },

    @{
        Name = "SLL - Percobaan 2 Tahap 2"
        Path = "ADT Single Linked List\Percobaan-2-Tahap-2"
    },

    @{
        Name = "SLL - Latihan"
        Path = "ADT Single Linked List\Latihan"
    },

    @{
        Name = "SLL - Tugas Praktikum"
        Path = "ADT Single Linked List\Tugas-Praktikum"
    },

    @{
        Name = "DLL - Percobaan 1"
        Path = "ADT Double Linked List\Percobaan-1"
    },

    @{
        Name = "DLL - Percobaan 2 Tahap 1"
        Path = "ADT Double Linked List\Percobaan-2-Tahap-1"
    },

    @{
        Name = "DLL - Percobaan 2 Tahap 2"
        Path = "ADT Double Linked List\Percobaan-2-Tahap-2"
    },

    @{
        Name = "DLL - Latihan"
        Path = "ADT Double Linked List\Latihan"
    },

    @{
        Name = "DLL - Tugas Praktikum"
        Path = "ADT Double Linked List\Tugas-Praktikum"
    },

    @{
        Name = "Circular - Single Percobaan"
        Path = "ADT Circular Linked List\Percobaan-1-Circular-Single-Linked-List"
    },

    @{
        Name = "Circular - Double Percobaan"
        Path = "ADT Circular Linked List\Percobaan-2-Circular-Double-Linked-List"
    },

    @{
        Name = "Live Coding - Array"
        Path = "Live Coding\ADT Array - Tantangan Kartu Andi dan Budi"
    },

    @{
        Name = "Live Coding - SLL"
        Path = "Live Coding\ADT Single Linked List - Barisan Bebek Pak Dengklek"
    },

    @{
        Name = "Live Coding - DLL Kontainer"
        Path = "Live Coding\ADT Double Linked List - Jalur Kontainer Pelabuhan Budi"
    },

    @{
        Name = "Live Coding - DLL Gudang"
        Path = "Live Coding\ADT Double Linked List - Gudang Paket Dua Pintu"
    }

)

$Failed = @()

Write-Host ""
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host " ASD JAVA BUILD VERIFICATION" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""

foreach ($Module in $Modules) {

    $SourceDir = Join-Path $Root $Module.Path

    $SafeName = (
        $Module.Name -replace '[^A-Za-z0-9_-]', '_'
    )

    $OutputDir = Join-Path $BuildRoot $SafeName

    New-Item `
        -ItemType Directory `
        -Path $OutputDir `
        -Force | Out-Null

    $JavaFiles = @(
        Get-ChildItem `
            -Path $SourceDir `
            -Filter "*.java" `
            -File
    )

    if ($JavaFiles.Count -eq 0) {

        Write-Host "[SKIP] $($Module.Name) - no Java files" `
            -ForegroundColor DarkGray

        continue
    }

    Write-Host "[BUILD] $($Module.Name)" `
        -ForegroundColor Yellow

    $Arguments = @(
        "-encoding"
        "UTF-8"
        "-d"
        $OutputDir
    )

    foreach ($File in $JavaFiles) {
        $Arguments += $File.FullName
    }

    & javac $Arguments

    if ($LASTEXITCODE -ne 0) {

        Write-Host "[FAIL] $($Module.Name)" `
            -ForegroundColor Red

        $Failed += $Module.Name

    } else {

        Write-Host "[ OK ] $($Module.Name)" `
            -ForegroundColor Green
    }

    Write-Host ""
}

Write-Host "==============================================" -ForegroundColor Cyan

if ($Failed.Count -gt 0) {

    Write-Host "BUILD FAILED" -ForegroundColor Red
    Write-Host ""

    foreach ($ModuleName in $Failed) {
        Write-Host " - $ModuleName" -ForegroundColor Red
    }

    exit 1
}

Write-Host "ALL MODULES COMPILED SUCCESSFULLY" `
    -ForegroundColor Green

Write-Host "==============================================" -ForegroundColor Cyan

exit 0