#zsh-completions
autoload -Uz compinit
compinit

setopt PROMPT_SUBST     # allow funky stuff in prompt

# color vars
eval col_gray='$FG[240]'
eval col_primary='$FG[032]'
eval col_diff='$FG[214]'
eval col_diff='$FG[214]'
eval col_same='$FG[034]'

alias vim="nvim"
export EDITOR=nvim

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
PROMPT='$col_gray% 
$col_primary%(?.%{$col_primary%}.%{$col_diff%})
> %{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${PWD/*\//}'

# right prompt
#if type "virtualenv_prompt_info" > /dev/null
#then
   # RPROMPT='$(virtualenv_prompt_info)$col_gray%n@%m%{$reset_color%}'
#else
   #RPROMPT='$col_gray%n@%m%{$reset_color%} [$(date +%H:%M)]%%'
#fi

  if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

export PATH="/usr/bin:/Users/manzosk3/bin:/Users/manzosk3/Applications:/usr/local/opt/postgresql@12/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:/usr/local/opt/python3/bin:/usr/local/MacGPG2/bin:/opt/X11/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Contents/MacOS:/Applications/Postgres.app/Contents/Versions/latest/bin/:/Users/manzosk3/.cargo/bin/:/Users/manzosk3/Library/Python/3.8/bin"

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(navi widget zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#zsh completion system
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
source ~/.dotfiles.git/zsh/completion.zsh

#zsh Directory stack settings
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
#zsh-syntax-highlighting plugin
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
