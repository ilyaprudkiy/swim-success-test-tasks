param(
  [Parameter(Mandatory = $true)]
  [string]$Message,

  [switch]$AmendHead
)

$ErrorActionPreference = 'Stop'

function Invoke-Git {
  param([Parameter(ValueFromRemainingArguments = $true)][string[]]$Arguments)

  $output = & git @Arguments
  if ($LASTEXITCODE -ne 0) {
    throw "git $($Arguments -join ' ') failed"
  }

  return $output
}

function Remove-CursorTrailer {
  param([string]$Text)

  # Keep the message simple and strip Cursor's automatic co-author trailer.
  $lines = $Text -split "`r?`n"
  $cleanLines = $lines | Where-Object {
    $_ -notmatch '^\s*Co-authored-by:\s*Cursor\s*<cursoragent@cursor\.com>\s*$'
  }

  return (($cleanLines -join "`n").TrimEnd() + "`n")
}

$cleanMessage = Remove-CursorTrailer $Message
if ([string]::IsNullOrWhiteSpace($cleanMessage)) {
  throw 'Commit message cannot be empty.'
}

$branch = (Invoke-Git branch --show-current).Trim()
$ref = if ($branch) { "refs/heads/$branch" } else { 'HEAD' }

if ($AmendHead) {
  $currentHead = (Invoke-Git rev-parse HEAD).Trim()
  $tree = (Invoke-Git rev-parse 'HEAD^{tree}').Trim()
  $authorName = (Invoke-Git show -s '--format=%an' HEAD).Trim()
  $authorEmail = (Invoke-Git show -s '--format=%ae' HEAD).Trim()
  $authorDate = (Invoke-Git show -s '--format=%aI' HEAD).Trim()

  $env:GIT_AUTHOR_NAME = $authorName
  $env:GIT_AUTHOR_EMAIL = $authorEmail
  $env:GIT_AUTHOR_DATE = $authorDate

  # Rebuild the current commit with the same tree and parent, only changing the message.
  $newCommit = ($cleanMessage | git commit-tree $tree -p 'HEAD^').Trim()
  if ($LASTEXITCODE -ne 0) {
    throw 'git commit-tree failed'
  }

  Invoke-Git update-ref $ref $newCommit $currentHead | Out-Null
  Write-Host "Rewritten HEAD: $newCommit"
  exit 0
}

git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
  throw 'No staged changes to commit.'
}

$currentHead = (Invoke-Git rev-parse HEAD).Trim()
$tree = (Invoke-Git write-tree).Trim()

# Create the commit directly from the staged index, without git commit trailers.
$newCommit = ($cleanMessage | git commit-tree $tree -p HEAD).Trim()
if ($LASTEXITCODE -ne 0) {
  throw 'git commit-tree failed'
}

Invoke-Git update-ref $ref $newCommit $currentHead | Out-Null
Write-Host "Created commit: $newCommit"
