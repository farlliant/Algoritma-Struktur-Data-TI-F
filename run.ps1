[CmdletBinding(DefaultParameterSetName = "Alias")]
param(

    [Parameter(
        Mandatory = $true,
        Position = 0,
        ParameterSetName = "Alias"
    )]
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
    [string]$Program,

    [Parameter(
        Mandatory = $true,
        ParameterSetName = "Path"
    )]
    [string]$Path,

    [Parameter(
        Mandatory = $false,
        ParameterSetName = "Path"
    )]
    [string]$Main
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

if ($PSCmdlet.ParameterSetName -eq "Alias") {

    $Config = $Programs[$Program]

    $SourceDir = Join-Path $Root $Config.Path
    $MainClass = $Config.Main
    $RunName = $Program

}
else {

    $SourceDir = Join-Path $Root $Path

    if (-not (Test-Path $SourceDir)) {
        throw "Folder tidak ditemukan: $Path"
    }

    $RunName = (
        $Path -replace '[^A-Za-z0-9_-]', '_'
    )

    if ($Main) {

        $MainClass = $Main

    }
    else {

        $Candidates = @(
            Get-ChildItem `
                -Path $SourceDir `
                -Filter "*.java" `
                -File |
            Where-Object {
                [System.IO.File]::ReadAllText(
                    $_.FullName
                ) -match `
                'public\s+static\s+void\s+main\s*\('
            }
        )

        if ($Candidates.Count -eq 0) {
            throw "Tidak ditemukan method main(). Gunakan -Main <NamaClass>."
        }

        if ($Candidates.Count -gt 1) {

            Write-Host "Ditemukan beberapa main class:" `
                -ForegroundColor Yellow

            foreach ($Candidate in $Candidates) {
                Write-Host " - $($Candidate.BaseName)"
            }

            throw "Gunakan -Main <NamaClass>."
        }

        $MainClass = $Candidates[0].BaseName
    }
}

$OutputDir = Join-Path $Root ".run\$RunName"

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
    throw "Tidak ada source Java di $SourceDir"
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
    throw "Compile gagal."
}

Write-Host ""
Write-Host "Running: $MainClass" `
    -ForegroundColor Cyan

Write-Host ""

& java `
    -cp $OutputDir `
    $MainClass

exit $LASTEXITCODE