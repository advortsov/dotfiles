#
# ~/.bashrc
#

# If not running interactively, don't do anything

#export PATH=/usr/local/bin:$PATH
#source /usr/local/bin/virtualenvwrapper.sh


[[ $- != *i* ]] && return

export LANG=en_US.UTF-8

alias ls='ls --color=auto'
alias ll='ls -al --color=auto'

# maven
alias mci='mvn clean install -DskipTests=true'
alias mcit='mvn clean install'


# go to ...
alias gdf='cd ~/dotfiles'
alias gp='cd ~/Prj'
alias gd='cd ~/Downloads'

# configs
alias cfb='vim ~/.bashrc'
alias cfvim='vim ~/.vimrc'
alias cfi3='vim ~/.config/i3/config'
alias cfc='vim ~/.config/compton.conf'
alias cfpb='vim ~/.config/polybar/config'
alias cfr='vim ~/.config/ranger/rc.conf'
alias cfx='vim ~/.xinitrc'

# updates

aur() {
        git clone $1 && cd $(basename "$1" ".${1##*.}") && makepkg -sri && cd .. && rm -rf $(basename "$1" ".${1##*.}")
}

#alias slurm='ssh s003136@sbox.slurm.io'
alias slurm='sshpass -p 97d66a74 ssh s003136@sbox.slurm.io'


###### git autocomplete #######
function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

for al in git --list-cmds=alias; do
    alias G$al="git $al"

    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_func && __git_complete G$al $complete_func
done


#######



PS1='[\u@\h \W]\$ '
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin:/home/alarm/dotfiles/scripts/
