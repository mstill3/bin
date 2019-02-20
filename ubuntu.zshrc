start=`date +%s.%N`
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="MaxCoplanTheme"
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
fpath=( ~/.oh-my-zsh/plugins/prompt  $fpath)
autoload -U +X compinit && compinit
#autoload -U +X bashcompinit && bashcompinit
autoload -U promptinit && promptinit
#rm -f ~/.zcompdump; compinit
compinit


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  colored-man
  colorize
  pip
  python
  vi-mode  
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  history-substring-search
)

source $ZSH/oh-my-zsh.sh
setopt vi
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
export PYTHONPATH='$HOME/Library/Python/3.7/bin'
# added by Anaconda3 installer

mkcdir ()
{
	mkdir -p -- "$1" &&
		cd -P -- "$1"
}

source /etc/zsh_command_not_found
#zstyle ':completion::complete:*' use-cache 1

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias learn='. ~/bin/cowCommand.sh'
alias learn='. ~/bin/cowCommand.sh'
#alias ccat='pygmentize -g -O style=colorful'
#alias ls='ls -FGh'
#alias ls='ls -Fh --color'

alias ls='colorls --sort-dirs'
alias lc='colorls -lA --sd'

alias pman='man-preview'
alias abash='bash -l'
alias python=python3
alias vi=vim
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias l='ls -ltra'
alias explore='explorer.exe `wslpath -w "$PWD"`'

zstyle ':completion:*:*:vim:*' file-patterns '^*.class:source-files' '*:all-files'
. ~/bin/autoAlias.sh
export home=/mnt/c/Users/mchco
export iCloud=/mnt/c/Users/mchco/iCloudDrive

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
#rbenv global 2.5.3 && rbenv rehash
source $(dirname $(gem which colorls))/tab_complete.sh



prompt pure
PROMPT='%(1j.[%j] .)%'+$PROMPT
PURE_CMD_MAX_EXEC_TIME=0.5
cowCommand

end=`date +%s.%N`
runtime=$( echo "$end - $start"|bc -l )
echo "$runtime seconds"