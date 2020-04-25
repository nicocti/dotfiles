# ADD FUNCTIONS:
# fpath=($HOME/.zsh $fpath)

# COLORS:
autoload -Uz colors
colors

# PROMPT:
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %F{033}%n%f@%F{200}%M%f %(?:%F{green}➜%f :%F{red}➜%f)%B%F{033}%1~%f%b '
PS1=$PROMPT
setopt PROMPT_SUBST
if [ -f $HOME/.zsh/git/git-prompt.sh ]
    then
        source $HOME/.zsh/git/git-prompt.sh
        RPROMPT=\$(__git_ps1 " (%s)")
    else
        autoload -Uz vcs_info
        precmd_functions+=( vcs_info )
        zstyle ':vcs_info:*' enable git
        zstyle ':vcs_info:git*:*' get-revision true
        zstyle ':vcs_info:*' check-for-changes true
        zstyle ':vcs_info:git*' formats "(%s) %12.12i %c%u %b%m"
        zstyle ':vcs_info:git*' actionformats "(%s|%a) %12.12i %c%u %b%m"
        RPROMPT=\$vcs_info_msg_0_
fi

# HISTORY:
setopt hist_ignore_all_dups append_history hist_verify hist_reduce_blanks hist_verify
HISTFILE=$HOME/.zsh_history
HISTSIZE=4096
SAVEHIST=4096

# BASH COMPLETION:
autoload -U bashcompinit
bashcompinit
zmodload -i zsh/complist

# K8S COMPLETION:
source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl kc

# ZSH OPTIONS:
setopt correct correct_all hash_list_all list_ambiguous
setopt complete_in_word completealiases
setopt auto_cd auto_remove_slash always_to_end
setopt extended_glob glob_dots null_glob
unsetopt beep hist_beep list_beep rm_star_silent hup
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.zsh/cache
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ALIAS:
alias ls='ls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -la'
alias less='less --quiet'
alias df='df --human-readable'
alias du='du --human-readable'
alias grep='grep --color=auto'
alias upgrade='sudo apt update && sudo apt upgrade && sudo apt clean'

# PYTHON STUFF:
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

venv_helper="PROVIDE VENV NAME"

venv() {
  if [ $# -eq 0 ]
    then
      echo $venv_helper
    else
      source "$VENV_HOME/$1/bin/activate"
  fi
}

mkvenv() {
  if [ $# -eq 0 ]
    then
      echo $venv_helper
    else
      python3 -m venv $VENV_HOME/$1
  fi
}

rmvenv() {
  if [ $# -eq 0 ]
    then
      echo $venv_helper
    else
      rm -r $VENV_HOME/$1
  fi
}
