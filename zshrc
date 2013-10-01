# color setting
local DEFAULT=$'%{\e[m%}'
local RED=$'%{\e[1;31m%}'
local GREEN=$'%{\e[1;32m%}'
local YELLOW=$'%{\e[1;33m%}'
local BLUE=$'%{\e[1;34m%}'
local PURPLE=$'%{\e[1;35m%}'
local LIGHT_BLUE=$'%{\e[1;36m%}'
local WHITE=$'%{\e[0;37m%}'
local LIGHT=$'%{\e[1;37m%}'
local DARKBLUE=$'%{\e[38;5;30m%}'

# Set up the prompt
autoload -Uz promptinit
promptinit
#prompt adam1

PROMPT=$'\n'$LIGHT'(%n@%m)-'$YELLOW'$'$WHITE' '
RPROMPT='--%T '$LIGHT_BLUE'[%d]'$DEFAULT

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1500
SAVEHIST=1500
HISTFILE=~/.zsh_history

# Use modern completion system
setopt magic_equal_subst
autoload -Uz compinit; compinit
compinit

#export LSCOLORS=Exfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true


zstyle ':completion:*:messages' format $YELLOW'%d'$DEFAULT
zstyle ':completion:*:warnings' format $RED'No matches for:'$YELLOW' %d'$DEFAULT
zstyle ':completion:*:descriptions' format $YELLOW'completing %B%d%b'$DEFAULT
zstyle ':completion:*:corrections' format $YELLOW'%B%d '$RED'(errors: %e)%b'$DEFAULT

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' group-name ''
#eval "$(dircolors -b)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history _correct
zstyle ':completion:*:options' description 'yes'

zstyle ':completion:*' list-separator ' >'
zstyle ':completion:*:manuals' separate-sections true

#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' use-compctl false


#--- my(?) settings ---

export EDITOR=vim
export LANG=ja_JP.UTF-8
export KCODE=u

setopt auto_cd
setopt correct

setopt auto_param_slash
setopt auto_param_keys

#忘れそう・・・
setopt brace_ccl

### for completion ###

setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types
setopt complete_in_word
setopt always_last_prompt

### history ###
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

### alias ###
#function chpwd() { ls -v -F --color=auto }
#alias ls='ls -v -F --color=auto'
alias emacs='emacs -nw'
alias ll='ls -la'
alias tre='tmux resize-pane'
alias T.T='echo "Oh! Its my initial!!"'
alias 3939='echo みっくみくにしてやんよ！！'
alias adb='/home/takuya/android-sdk-linux/platform-tools/adb'

