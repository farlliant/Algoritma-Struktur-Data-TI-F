$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$Source = Join-Path $Root "Solution.java"

$Build = Join-Path `
    $env:TEMP `
    "asd-array-public-test"

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
6
10 4 7 1 13 16
"@

    $Expected = @"
3 5
1 4
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
