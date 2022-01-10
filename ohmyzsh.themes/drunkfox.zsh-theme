# drunkfox.zsh-theme
#
#PROMPT='%{$fg_bold[cyan]%}┌[%{$fg_bold[white]%}$(whatsmyip)%{$reset_color%}%{$fg_bold[cyan]%}]%{$fg_bold[cyan]%}-(%{$fg[white]%}%~%{$reset_color%}%{$fg_bold[cyan]%})$(git_prompt_info)
#%{$fg_bold[cyan]%}└> % %{$reset_color%}'
#
PROMPT='%{$fg_bold[cyan]%}┌[%{$fg_bold[white]%}$(whatsmyip)%{$reset_color%}%{$fg_bold[cyan]%}]%{$fg_bold[cyan]%}-(%{$fg[white]%}%~%{$reset_color%}%{$fg_bold[cyan]%})$(git_prompt_info)
%{$fg_bold[cyan]%}└> % %{$reset_color%}'
# git prompt
ZSH_THEME_GIT_PROMPT_PREFIX="-[%{$reset_color%}%{$fg[white]%}git://%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg_bold[cyan]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
