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

$hasUpstream = $true
try {
    & git rev-parse --abbrev-ref --symbolic-full-name "@{u}" *> $null
}
catch {
    $hasUpstream = $false
}

$existingOrigin = (& git remote)
if ($existingOrigin -contains 'origin') {
    & git remote set-url origin $RemoteUrl
}
else {
    & git remote add origin $RemoteUrl
}

if ($hasHead -and -not $hasUpstream) {
    Write-Host "[unity-mcp] rewriting local bootstrap history author before first public push"
    & git filter-branch -f --env-filter "export GIT_AUTHOR_NAME='$AuthorName'; export GIT_AUTHOR_EMAIL='$AuthorEmail'; export GIT_COMMITTER_NAME='$AuthorName'; export GIT_COMMITTER_EMAIL='$AuthorEmail';" -- --all
}

$hasChanges = (& git status --porcelain)
if ([string]::IsNullOrWhiteSpace($hasChanges)) {
    if ($hasHead) {
        $lastAuthor = (& git log -1 --pretty=format:"%an <%ae>").Trim()
        $targetAuthor = "$AuthorName <$AuthorEmail>"
        if ($hasUpstream -and $lastAuthor -ne $targetAuthor) {
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
