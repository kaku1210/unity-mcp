param(
    [Parameter(Mandatory = $true)]
    [string]$RemoteUrl,

    [Parameter(Mandatory = $true)]
    [string]$AuthorName,

    [Parameter(Mandatory = $true)]
    [string]$AuthorEmail,

    [Parameter(Mandatory = $false)]
    [string]$CommitMessage = "chore(init): bootstrap unity-mcp repository"
)

$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

Write-Host "[unity-mcp] repository root: $repoRoot"

if (-not (Test-Path ".git")) {
    throw "Current directory is not an initialized git repository: $repoRoot"
}

# Configure local author only for this repository
& git config user.name $AuthorName
& git config user.email $AuthorEmail

$hasHead = $true
try {
    & git rev-parse --verify HEAD *> $null
}
catch {
    $hasHead = $false
}

$currentBranch = (& git branch --show-current).Trim()
if ([string]::IsNullOrWhiteSpace($currentBranch)) {
    throw "Unable to determine current branch."
}

$existingOrigin = (& git remote)
if ($existingOrigin -contains 'origin') {
    & git remote set-url origin $RemoteUrl
}
else {
    & git remote add origin $RemoteUrl
}

$hasChanges = (& git status --porcelain)
if ([string]::IsNullOrWhiteSpace($hasChanges)) {
    if ($hasHead) {
        $lastAuthor = (& git log -1 --pretty=format:"%an <%ae>").Trim()
        $targetAuthor = "$AuthorName <$AuthorEmail>"
        if ($lastAuthor -ne $targetAuthor) {
            Write-Host "[unity-mcp] amending latest commit author from '$lastAuthor' to '$targetAuthor'"
            & git commit --amend --no-edit --reset-author
        }
        else {
            Write-Host "[unity-mcp] no changes to commit and latest commit author already matches target author."
        }
    }
    else {
        Write-Host "[unity-mcp] no changes to commit and no local commits exist."
    }
}
else {
    & git add .
    & git commit -m $CommitMessage
}

& git push -u origin $currentBranch

Write-Host "[unity-mcp] published to $RemoteUrl on branch $currentBranch"
