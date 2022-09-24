# Reference: https://www.youtube.com/watch?v=5-aK2_WwrmM
# prompt
Import-Module posh-git
Import-Module oh-my-posh
Import-Module Terminal-Icons
Set-PoshPrompt gruvbox

# PSReadline
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fuzzy finder
Import-Module PSFsf
Set-PSFzfOption -PSReadlineChordProvide 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

oh-my-posh.exe init pwsh --config "C:\Users\bryndell.torio\.config\powershell\deltorio.omp.json" | Invoke-Expression

Set-Alias vim nvim
Set-Alias grep findstr
Set-Alias ll ls
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

