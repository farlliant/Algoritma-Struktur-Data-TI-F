param(
    [Parameter(Mandatory = $true)]
    [ValidateSet(
        "array-latihan",
        "array-tugas1",
        "array-tugas2",
        "sll-latihan",
        "sll-tugas",
        "dll-latihan",
        "dll-tugas",
        "circular-single",
        "circular-double",
        "lc-array",
        "lc-sll",
        "lc-dll-kontainer",
        "lc-dll-gudang"
    )]
    [string]$Program
)

$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path

$Programs = @{
    "array-latihan" = @{
        Path = "ADT Array\Latihan"
        Main = "LatihanArray"
    }

    "array-tugas1" = @{
        Path = "ADT Array\Tugas-Praktikum\Tugas-1"
        Main = "Tugas1Array"
    }

    "array-tugas2" = @{
        Path = "ADT Array\Tugas-Praktikum\Tugas-2"
        Main = "Main"
    }

    "sll-latihan" = @{
        Path = "ADT Single Linked List\Latihan"
        Main = "Main"
    }

    "sll-tugas" = @{
        Path = "ADT Single Linked List\Tugas-Praktikum"
        Main = "Main"
    }

    "dll-latihan" = @{
        Path = "ADT Double Linked List\Latihan"
        Main = "Main"
    }

    "dll-tugas" = @{
        Path = "ADT Double Linked List\Tugas-Praktikum"
        Main = "Main"
    }

    "circular-single" = @{
        Path = "ADT Circular Linked List\Percobaan-1-Circular-Single-Linked-List"
        Main = "CircularSingleLinkedList"
    }

    "circular-double" = @{
        Path = "ADT Circular Linked List\Percobaan-2-Circular-Double-Linked-List"
        Main = "CircularDoubleLinkedList"
    }

    "lc-array" = @{
        Path = "Live Coding\ADT Array - Tantangan Kartu Andi dan Budi"
        Main = "Solution"
    }

    "lc-sll" = @{
        Path = "Live Coding\ADT Single Linked List - Barisan Bebek Pak Dengklek"
        Main = "Solution"
    }

    "lc-dll-kontainer" = @{
        Path = "Live Coding\ADT Double Linked List - Jalur Kontainer Pelabuhan Budi"
        Main = "Solution"
    }

    "lc-dll-gudang" = @{
        Path = "Live Coding\ADT Double Linked List - Gudang Paket Dua Pintu"
        Main = "Solution"
    }
}

$Config = $Programs[$Program]

$SourceDir = Join-Path $Root $Config.Path
$OutputDir = Join-Path $Root ".run\$Program"

if (Test-Path $OutputDir) {
    Remove-Item $OutputDir -Recurse -Force
}

New-Item `
    -ItemType Directory `
    -Path $OutputDir `
    -Force | Out-Null

$Files = @(
    Get-ChildItem `
        -Path $SourceDir `
        -Filter "*.java" `
        -File
)

if ($Files.Count -eq 0) {
    throw "Tidak ditemukan source Java pada $($Config.Path)"
}

$Arguments = @(
    "-encoding"
    "UTF-8"
    "-d"
    $OutputDir
)

foreach ($File in $Files) {
    $Arguments += $File.FullName
}

& javac $Arguments

if ($LASTEXITCODE -ne 0) {
    throw "Compile gagal untuk $Program"
}

& java `
    -cp $OutputDir `
    $Config.Main

exit $LASTEXITCODE