# PowerShell Script to Automate Git Operations and Generate Raw GitHub Links

# Prompt user for dynamic input
$repoOwner = Read-Host "Enter GitHub repo owner"
$repoName = Read-Host "Enter GitHub repo name"
$branch = Read-Host "Enter branch name (default: main)"
if ([string]::IsNullOrWhiteSpace($branch)) { $branch = "main" }

$localPath = Read-Host "Enter the full path to your local repository"
$jsonIndex = "$localPath\MRP_FileStructure.json"
$rawBase = "https://raw.githubusercontent.com/$repoOwner/$repoName/$branch"

# Check if the local path exists
if (-not (Test-Path $localPath)) {
    Write-Host "ERROR: Local path not found: $localPath" -ForegroundColor Red
    exit
}

# Check if the JSON index file exists
if (-not (Test-Path $jsonIndex)) {
    Write-Host "ERROR: JSON index file not found: $jsonIndex" -ForegroundColor Red
    exit
}

# Navigate to the repository folder
try {
    Set-Location $localPath
} catch {
    Write-Host "ERROR: Failed to navigate to $localPath. Ensure the path is correct." -ForegroundColor Red
    exit
}

# Detect changes
Write-Host "Detecting changes in the repository..."
git add .
$changed = git status --porcelain

if ($changed -eq $null) {
    Write-Host "No changes detected. Exiting..." -ForegroundColor Yellow
    exit
}

# Commit and push changes
$commitMsg = "Automated update via script - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
try {
    git commit -m "$commitMsg"
    git push origin $branch
    Write-Host "Changes committed and pushed successfully!" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Git commit or push failed. Check your Git configuration." -ForegroundColor Red
    exit
}

# Parse JSON file for folder/file mappings
try {
    $json = Get-Content $jsonIndex | ConvertFrom-Json
} catch {
    Write-Host "ERROR: Failed to parse JSON file: $jsonIndex" -ForegroundColor Red
    exit
}

# Generate and output raw GitHub links for updated files
$rawLinks = @()
foreach ($folder in $json.PSObject.Properties.Name) {
    foreach ($file in $json.$folder) {
        $rawLinks += "$rawBase/$folder/$file"
    }
}

# Output raw GitHub links to clipboard and terminal
$rawLinksText = $rawLinks -join "`r`n"
try {
    Set-Clipboard -Value $rawLinksText
    Write-Host "Raw GitHub links copied to clipboard:" -ForegroundColor Green
    $rawLinks | ForEach-Object { Write-Host $_ }
} catch {
    Write-Host "ERROR: Failed to copy raw links to clipboard." -ForegroundColor Red
}

# Optional: Save raw GitHub links to a log file
$logFile = "$localPath\last_sync_links.txt"
try {
    $rawLinks | Out-File -FilePath $logFile -Encoding UTF8
    Write-Host "Raw GitHub links saved to log file: $logFile" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Failed to save raw links to log file." -ForegroundColor Red
}