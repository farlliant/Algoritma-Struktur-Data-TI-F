$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$Source = Join-Path $Root "Solution.java"

$Build = Join-Path `
    $env:TEMP `
    "asd-dll-gudang-public-test"

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
MASUK_KANAN P1
MASUK_KANAN P2
MASUK_KIRI P0
MASUK_KANAN P1
KELUAR_KANAN P1
MASUK_KIRI P3
KELUAR_KIRI P2
KELUAR_KANAN PX
MASUK_KANAN P4
KELUAR_KIRI P3
"@

    $Expected = @"
3 1
P0 P1 P4
P4 P1 P0
"@

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

    $Process.StandardInput.Write($InputData)
    $Process.StandardInput.Close()

    $Actual =
        $Process.StandardOutput.ReadToEnd()

    $ErrorOutput =
        $Process.StandardError.ReadToEnd()

    $Process.WaitForExit()

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
