# vi $PROFILE
# folder alias
function code { set-location "C:\code" }
function notes { set-location "c:\notes" }
function findme {
  param(
    $Path,
    $Pattern
    )

  Select-String -Path $Path -Pattern $Pattern
}

# notes alias
function daily { New-Item -ItemType Directory -Path "c:\notes\daily\$((Get-Date).ToString('yyyy-MM-dd'))" }

# command alias
Set-alias bat type
Set-alias vi vim
Set-alias which get-command
Set-alias unzip Expand-Archive

# set oh-my-posh
oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh)\themes\custom.omp.json"| Invoke-Expression

# set fzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
