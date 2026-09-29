$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$Source = Join-Path $Root "Solution.java"

$Build = Join-Path `
    $env:TEMP `
    "asd-cdll-playlist-test"

if (Test-Path $Build) {
    Remove-Item `
        $Build `
        -Recurse `
        -Force
}

New-Item `
    -ItemType Directory `
    -Path $Build `
    -Force | Out-Null

try {

    & javac `
        -encoding UTF-8 `
        -d $Build `
        $Source

    if ($LASTEXITCODE -ne 0) {
        throw "Compilation failed."
    }

    $Cases = @(

        @{
            Name = "CDLL1"
            FailMessage = "Contoh utama operasi Circular Doubly Linked List"
            Input = @"
10
BELAKANG 10
BELAKANG 20
DEPAN 5
BELAKANG 10
HAPUS_BELAKANG 10
DEPAN 7
HAPUS_DEPAN 10
HAPUS_BELAKANG 99
BELAKANG 30
HAPUS_DEPAN 7
"@
            Expected = @"
3 1
5 20 30
30 20 5
"@
        },

        @{
            Name = "CDLL2"
            FailMessage = "Periksa penghapusan data duplikat dari arah berbeda"
            Input = @"
9
BELAKANG 4
BELAKANG 7
BELAKANG 4
BELAKANG 7
DEPAN 9
HAPUS_DEPAN 4
HAPUS_BELAKANG 7
HAPUS_BELAKANG 4
HAPUS_DEPAN 9
"@
            Expected = @"
1 0
7
7
"@
        },

        @{
            Name = "CDLL3"
            FailMessage = "Periksa perintah gagal pada list kosong dan data yang tidak ditemukan"
            Input = @"
7
HAPUS_DEPAN 10
HAPUS_BELAKANG 20
DEPAN 5
HAPUS_BELAKANG 9
BELAKANG 6
HAPUS_DEPAN 7
HAPUS_BELAKANG 5
"@
            Expected = @"
1 4
6
6
"@
        },

        @{
            Name = "CDLL4"
            FailMessage = "Periksa penghapusan seluruh node hingga list kosong"
            Input = @"
8
DEPAN 10
BELAKANG 20
DEPAN 5
HAPUS_DEPAN 5
HAPUS_BELAKANG 20
HAPUS_BELAKANG 10
HAPUS_DEPAN 10
HAPUS_BELAKANG 5
"@
            Expected = @"
0 2
KOSONG
KOSONG
"@
        },

        @{
            Name = "CDLL5"
            FailMessage = "Periksa nilai negatif, nol, duplikat, dan traversal dua arah"
            Input = @"
10
BELAKANG -5
DEPAN 0
BELAKANG -10
DEPAN -5
HAPUS_BELAKANG -5
BELAKANG 0
HAPUS_DEPAN 0
HAPUS_BELAKANG -5
HAPUS_DEPAN 99
DEPAN 7
"@
            Expected = @"
3 1
7 -10 0
0 -10 7
"@
        },

        @{
            Name = "CDLL6"
            FailMessage = "Periksa penghapusan head, tail, dan node tengah"
            Input = @"
11
BELAKANG 1
BELAKANG 2
BELAKANG 3
BELAKANG 2
BELAKANG 4
HAPUS_DEPAN 2
HAPUS_BELAKANG 2
HAPUS_DEPAN 1
HAPUS_BELAKANG 4
DEPAN 8
BELAKANG 9
"@
            Expected = @"
3 0
8 3 9
9 3 8
"@
        },

        @{
            Name = "CDLL7"
            FailMessage = "Periksa perubahan head dan tail ketika jumlah node sedikit"
            Input = @"
8
DEPAN 100
BELAKANG 200
HAPUS_DEPAN 200
BELAKANG 300
HAPUS_BELAKANG 100
DEPAN 400
HAPUS_BELAKANG 300
HAPUS_DEPAN 400
"@
            Expected = @"
0 0
KOSONG
KOSONG
"@
        },

        @{
            Name = "CDLL8"
            FailMessage = "Periksa seluruh node bernilai sama dan penghapusan dari dua arah"
            Input = @"
10
BELAKANG 5
BELAKANG 5
DEPAN 5
BELAKANG 5
HAPUS_DEPAN 5
HAPUS_BELAKANG 5
HAPUS_BELAKANG 5
HAPUS_DEPAN 5
HAPUS_DEPAN 5
HAPUS_BELAKANG 5
"@
            Expected = @"
0 2
KOSONG
KOSONG
"@
        },

        @{
            Name = "CDLL9"
            FailMessage = "Periksa nilai batas dan penghapusan data duplikat"
            Input = @"
9
DEPAN 100000
BELAKANG -100000
DEPAN -100000
BELAKANG 100000
HAPUS_DEPAN 100000
HAPUS_BELAKANG -100000
HAPUS_BELAKANG 100000
HAPUS_DEPAN -100000
BELAKANG 0
"@
            Expected = @"
1 0
0
0
"@
        },

        @{
            Name = "CDLL10"
            FailMessage = "Periksa kombinasi operasi kompleks dan traversal dua arah"
            Input = @"
15
BELAKANG 10
DEPAN 20
BELAKANG 30
DEPAN 10
BELAKANG 20
HAPUS_DEPAN 10
HAPUS_BELAKANG 20
BELAKANG 40
DEPAN 50
HAPUS_BELAKANG 10
HAPUS_DEPAN 99
HAPUS_BELAKANG 50
DEPAN 60
HAPUS_DEPAN 40
HAPUS_BELAKANG 20
"@
            Expected = @"
2 1
60 30
30 60
"@
        }
    )

    $Passed = 0
    $Failed = 0

    foreach ($Case in $Cases) {

        $ProcessInfo =
            New-Object System.Diagnostics.ProcessStartInfo

        $ProcessInfo.FileName = "java"
        $ProcessInfo.Arguments = "-cp `"$Build`" Solution"

        $ProcessInfo.UseShellExecute = $false
        $ProcessInfo.RedirectStandardInput = $true
        $ProcessInfo.RedirectStandardOutput = $true
        $ProcessInfo.RedirectStandardError = $true
        $ProcessInfo.CreateNoWindow = $true

        $Process =
            New-Object System.Diagnostics.Process

        $Process.StartInfo = $ProcessInfo

        [void]$Process.Start()

        $Process.StandardInput.Write($Case.Input)
        $Process.StandardInput.Close()

        $Actual =
            $Process.StandardOutput.ReadToEnd()

        $ErrorOutput =
            $Process.StandardError.ReadToEnd()

        $Process.WaitForExit()

        if ($Process.ExitCode -ne 0) {

            Write-Host `
                "[FAIL] $($Case.Name)" `
                -ForegroundColor Red

            Write-Host $Case.FailMessage

            if ($ErrorOutput) {
                Write-Host $ErrorOutput
            }

            $Failed++
            continue
        }

        $Actual =
            ($Actual.Trim() -replace "`r", "")

        $Expected =
            ($Case.Expected.Trim() -replace "`r", "")

        if ($Actual -eq $Expected) {

            Write-Host `
                "[PASS] $($Case.Name)" `
                -ForegroundColor Green

            $Passed++

        } else {

            Write-Host `
                "[FAIL] $($Case.Name)" `
                -ForegroundColor Red

            Write-Host $Case.FailMessage

            Write-Host ""
            Write-Host "Expected:"
            Write-Host $Expected

            Write-Host ""
            Write-Host "Actual:"
            Write-Host $Actual
            Write-Host ""

            $Failed++
        }
    }

    Write-Host ""
    Write-Host "Passed : $Passed"
    Write-Host "Failed : $Failed"

    if ($Failed -gt 0) {
        throw "$Failed CDLL test(s) failed."
    }

    Write-Host ""
    Write-Host `
        "ALL CDLL TESTS PASSED" `
        -ForegroundColor Green

}
finally {

    Remove-Item `
        $Build `
        -Recurse `
        -Force `
        -ErrorAction SilentlyContinue
}