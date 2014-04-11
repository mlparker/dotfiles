# .bashrc
#if [ -n "$PS1" -a -e /bin/zsh ]; then
#    #echo "Switching to zsh"
#    exec /bin/zsh
#fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
set -o vi

export EDITOR="vim"

# Source git branch colorization
if [ -e ~/.bashrc.d/git_branch.sh ]; then
    . ~/.bashrc.d/git_branch.sh
fi

#PS1='\[\e]0;\u@\h:\w\007\][$(date +%H:%M)]-[\u@\h: \[\e[0;32m\]\w\[\e[0m\]\[\e[0;36m\] ${GIT_BRANCH}\[\e[0;00m\]]\$ '
#PROMPT_COMMAND=$'GIT_BRANCH=$(git_branch)'

set_bash_prompt ()
{
    #GIT_BRANCH='$(git_branch)'
    #PS1='[$(date +%H:%M) \u@\h: \[\e[0;32m\]\w\[\e[0m\]\[\e[0;36m\] ${GIT_BRANCH}\[\e[0;00m\]]\$ '
    #PS1='[$(date +%H:%M) \u@\h: \[\e[0;32m\]\]\w\[\e[0m\]\]\[\e[0;36m\]\] $(git_branch) \[\e[0;00m\]\]]\$ '
    PS1='[$(date +%H:%M) \u@\h: \[$(tput setaf 2)\]\w $(git_branch)\[$(tput sgr0)\]]\$ '

}
PROMPT_COMMAND=set_bash_prompt
#PS1='[$(date +%H:%M) \u@\h: \[\e[0;32m\]\w\[\e[0m\]\[\e[0;36m\] ${GIT_BRANCH}\[\e[0;00m\]]\$ '
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/X11:$HOME/dev/utils"
export PATH PS1 PROMPT_COMMAND

# 'back 4' takes you back 4 directories.
back ()
{
    x=0
    levels=""
    while [ $x -lt $1 ]
        do
        levels="${levels}../"
        x=$[$x+1]
    done
    cd $levels
}

# 'up [string]' takes you up to a directory that matches /string/
# [mlparker ~/asdf#trunk/lib/perl/DB/Notes]$ up trunk
# [mlparker ~/asdf#trunk]$
up () {
    cd `perl -MCwd -e '$o=@p=split/\//,cwd;$c++while@p&&pop(@p)!~/$ARGV[0]/;print$c>=$o?".":"../"x$c' $1`
}

# pvi Time::Local::Extended
pvi ()
{
    local file;
    file=$(perldoc -l $1);
    if [[ "$?" == "0" ]]; then
        vim $file;
    fi
}

alias attach='tmux -CC attach'
