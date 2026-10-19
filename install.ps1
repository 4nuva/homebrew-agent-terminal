param(
    [string]$InstallDir = $env:AGENT_TERMINAL_INSTALL_DIR
)

$ErrorActionPreference = 'Stop'
$downloadUrl = 'https://downloads.4nuva.dev/agent-terminal/Agent-Terminal-Windows.zip'

if ([string]::IsNullOrWhiteSpace($InstallDir)) {
    if ([string]::IsNullOrWhiteSpace($env:LOCALAPPDATA)) {
        throw 'LOCALAPPDATA is not set; specify -InstallDir or AGENT_TERMINAL_INSTALL_DIR.'
    }
    $InstallDir = Join-Path $env:LOCALAPPDATA 'Programs\Agent Terminal'
}
$InstallDir = [IO.Path]::GetFullPath($InstallDir)

$workDir = Join-Path ([IO.Path]::GetTempPath()) "agent-terminal-install-$([guid]::NewGuid())"
$archive = Join-Path $workDir 'Agent-Terminal-Windows.zip'
$unpacked = Join-Path $workDir 'unpacked'

try {
    New-Item -ItemType Directory -Path $workDir -Force | Out-Null
    Write-Host 'Downloading Agent Terminal for Windows...'
    Invoke-WebRequest -Uri $downloadUrl -OutFile $archive -UseBasicParsing
    Expand-Archive -LiteralPath $archive -DestinationPath $unpacked

    $sourceDir = Join-Path $unpacked 'Agent Terminal'
    $executable = Join-Path $sourceDir 'agent-terminal.exe'
    if (-not (Test-Path -LiteralPath $executable -PathType Leaf)) {
        throw 'The downloaded archive did not contain Agent Terminal.'
    }

    New-Item -ItemType Directory -Path $InstallDir -Force | Out-Null
    Get-ChildItem -LiteralPath $sourceDir -Force | ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination $InstallDir -Recurse -Force
    }

    Write-Host "Installed to $InstallDir"
    Write-Host 'Running Agent Terminal setup...'
    & (Join-Path $InstallDir 'agent-terminal.exe') setup
    if ($LASTEXITCODE -ne 0) {
        throw "Agent Terminal setup exited with code $LASTEXITCODE."
    }
} finally {
    Remove-Item -LiteralPath $workDir -Recurse -Force -ErrorAction SilentlyContinue
}
