start=`gdate +%s.%N`
set -o vi
. ~/.git-prompt.sh
PROMPT_COMMAND=__prompt_command
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWCOLORHINTS=true
__prompt_command()
{
	
	local EXIT="$?"
	PROMPT_DIRTRIM=$((1+$(($(tput cols)/12))))
	PS1=$(check_conda_env)
	local RCol='\[\e[0m\]'
	local Red='\[\e[0;31m\]'
	local Blue='\[\e[0;36m\]'
	if [ $EXIT != 0 ]; then
		PS1+="${Red}\u${Rcol}"
	else
		PS1+="${Blue}\u${Rcol}"
	fi
	#PS1+="\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\n\$ "
	PS1+="\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\033[35m$(__git_ps1)\033[m \n\$ "	

}

win()
{
	local command="cd \\\"$PWD\\\"; clear"
	(( $# > 0 )) && command="${command}; $*"

	local app=$TERM_PROGRAM
	if [[ "$app" == 'Apple_Terminal' ]]
	then
		osascript > /dev/null <<EOF
	tell application "System Events"
        tell process "Terminal" to keystroke "n" using command down
      end tell
      tell application "Terminal" to do script "${command}" in front window
EOF

	else
		echo "win: unsupported terminal app: $the_app"
		false
	fi
}

check_conda_env ()
{
    if [ ! -z "$CONDA_DEFAULT_ENV" ]; then
        printf -- "%s" "\[\e[0;39m\][`basename $CONDA_DEFAULT_ENV`]\[\e[0m\] "
    else
        printf -- "%s" ""
    fi
}

mkcdir () {
	mkdir -p -- "$1" && cd -P -- "$1"
}


#export PS1

#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\n\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
. ~/bin/autoAlias.sh
cowCommand

alias ?='. ~/bin/cowCommand.sh'
alias ccat='pygmentize -g -O style=colorful'
#alias ls='ls -FGh'
alias ls='ls --color=auto -FGh'
alias vi=vim

#. ~/bin/autoAlias.sh
shopt -s cdable_vars
export iCloud=$HOME/Library/Mobile\ Documents/com\~apple\~CloudDocs/
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PYTHONPATH='$HOME/Library/Python/3.7/bin'
# added by Anaconda3 installer
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH:/Users/maxcoplan/bin:/Users/maxcoplan/anaconda3/bin"
eval "$(register-python-argcomplete conda)"
alias python=python3
export LS_OPTIONS=‘–color=auto’
d=~/.dir_colors
test -r $d && eval "$(dircolors $d)"

end=`gdate +%s.%N`

runtime=$(echo "$end - $start"|bc -l)
echo "$runtime seconds"