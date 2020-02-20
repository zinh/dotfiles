## Some customization

For faster load while inside a git directory(minimal theme)

```
# ~/.zprezto/modules/prompt/functions/prompt_minimal_setup
# Set vcs_info parameters.
zstyle ':vcs_info:*' enable bzr git hg svn
#zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:*' stagedstr '%F{green}●%f'
#zstyle ':vcs_info:*' unstagedstr '%F{yellow}●%f'
zstyle ':vcs_info:*' formats ' - [%b%c%u]'
#zstyle ':vcs_info:*' actionformats " - [%b%c%u|%F{cyan}%a%f]"
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b|%F{cyan}%r%f'
#zstyle ':vcs_info:git*+set-message:*' hooks git_status
```
