$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$Source = Join-Path $Root "Solution.java"

$Build = Join-Path `
    $env:TEMP `
    "asd-dll-kontainer-public-test"

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

    $InputData = @"
10
TIMUR 10
TIMUR 20
BARAT 5
TIMUR 10
AMBIL_TIMUR 10
BARAT 7
AMBIL_BARAT 10
AMBIL_TIMUR 99
TIMUR 30
AMBIL_BARAT 7
"@

    $Expected = @"
3 1
5 20 30
30 20 5
"@

    $InputFile = Join-Path $Build "input.txt"
    $OutputFile = Join-Path $Build "output.txt"
    $ErrorFile = Join-Path $Build "error.txt"

    $Utf8NoBom = New-Object System.Text.UTF8Encoding($false)

    [System.IO.File]::WriteAllText(
        $InputFile,
        ($InputData.Trim() + "`n"),
        $Utf8NoBom
    )

    $JavaArguments = "-cp `"$Build`" Solution"

    $Process = Start-Process `
        -FilePath "java" `
        -ArgumentList $JavaArguments `
        -RedirectStandardInput $InputFile `
        -RedirectStandardOutput $OutputFile `
        -RedirectStandardError $ErrorFile `
        -NoNewWindow `
        -Wait `
        -PassThru

    $Actual =
        [System.IO.File]::ReadAllText($OutputFile)

    $ErrorOutput =
        [System.IO.File]::ReadAllText($ErrorFile)

    if ($Process.ExitCode -ne 0) {
        Write-Host "[FAIL] PUBLIC SAMPLE" -ForegroundColor Red

        if ($ErrorOutput) {
            Write-Host $ErrorOutput
        }

        throw "Program execution failed."
    }

    $Actual =
        ($Actual.Trim() -replace "`r", "")

    $Expected =
        ($Expected.Trim() -replace "`r", "")

    if ($Actual -ne $Expected) {

        Write-Host "[FAIL] PUBLIC SAMPLE" -ForegroundColor Red

        Write-Host ""
        Write-Host "Expected:"
        Write-Host $Expected

        Write-Host ""
        Write-Host "Actual:"
        Write-Host $Actual

        throw "Public sample test failed."
    }

    Write-Host "[PASS] PUBLIC SAMPLE" -ForegroundColor Green
    Write-Host ""
    Write-Host "ALL PUBLIC TESTS PASSED" -ForegroundColor Green

}
finally {

    Remove-Item `
        $Build `
        -Recurse `
        -Force `
        -ErrorAction SilentlyContinue
}
