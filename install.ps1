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
    # The app is a GUI-subsystem executable, so PowerShell returns from `&`
    # as soon as it starts, before setup has run, and leaves $LASTEXITCODE
    # unset. Start-Process -Wait waits for it, and -NoNewWindow keeps setup's
    # prompts on this console.
    $setupExe = Join-Path $InstallDir 'agent-terminal.exe'
    $setup = Start-Process -FilePath $setupExe -ArgumentList 'setup' -NoNewWindow -Wait -PassThru
    if ($setup.ExitCode -ne 0) {
        throw "Agent Terminal setup exited with code $($setup.ExitCode)."
    }
} finally {
    Remove-Item -LiteralPath $workDir -Recurse -Force -ErrorAction SilentlyContinue
}
