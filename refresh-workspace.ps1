$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$WorkspacePath = Join-Path $Root "Algoritma-Struktur-Data-TI-F.code-workspace"

function Get-RelativePath {
    param(
        [string]$Base,
        [string]$Target
    )

    $BaseUri = New-Object System.Uri(
        ($Base.TrimEnd("\") + "\")
    )

    $TargetUri = New-Object System.Uri(
        ($Target.TrimEnd("\") + "\")
    )

    return [Uri]::UnescapeDataString(
        $BaseUri.MakeRelativeUri($TargetUri).ToString()
    ).Replace("/", "\")
}

$Ignored = "\\(\.git|\.build|\.run|\.vscode-java)\\"

$JavaDirectories = @(
    Get-ChildItem `
        -Path $Root `
        -Recurse `
        -Filter "*.java" `
        -File |
    Where-Object {
        $_.FullName -notmatch $Ignored
    } |
    ForEach-Object {
        $_.DirectoryName
    } |
    Sort-Object -Unique
)

$Folders = @()

if (Test-Path (Join-Path $Root "Algoritma")) {
    $Folders += [ordered]@{
        name = "01 - Algoritma"
        path = "Algoritma"
    }
}

foreach ($Directory in $JavaDirectories) {

    $Relative = Get-RelativePath `
        -Base $Root `
        -Target $Directory

    $WorkspacePathValue = $Relative.Replace("\", "/")

    $DisplayName = $Relative `
        -replace "\\", " - "

    $Folders += [ordered]@{
        name = $DisplayName
        path = $WorkspacePathValue
    }
}

$Workspace = [ordered]@{
    folders = $Folders

    settings = [ordered]@{
        "java.project.outputPath" = ".vscode-java/bin"
        "java.project.referencedLibraries" = @()
        "java.autobuild.enabled" = $true
        "git.openRepositoryInParentFolders" = "always"
        "terminal.integrated.cwd" = '${workspaceFolder:01 - Algoritma}/..'
    }
}

$Json = $Workspace |
    ConvertTo-Json -Depth 10

[System.IO.File]::WriteAllText(
    $WorkspacePath,
    $Json,
    (New-Object System.Text.UTF8Encoding($false))
)

Write-Host ""
Write-Host "Workspace refreshed." -ForegroundColor Green
Write-Host "Java project roots: $($JavaDirectories.Count)" -ForegroundColor Cyan
Write-Host ""