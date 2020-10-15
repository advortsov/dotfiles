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
alias gp='cd ~/pet'
alias gw='cd ~/work'
alias gd='cd ~/Downloads'

# configs
alias cfb='vim ~/.bashrc'
alias cfvim='vim ~/.vimrc'
alias cfi3='vim ~/.config/i3/config'
alias cfc='vim ~/.config/picom.conf'
alias cfpb='vim ~/.config/polybar/config'
alias cfr='vim ~/.config/ranger/rc.conf'
alias cfx='vim ~/.xinitrc'
alias pcm='~/soft/pycharm-community-2020.2/bin/pycharm.sh'
alias oc_dev='~/soft/oc/oc login -u developer -p developer https://api.crc.testing:6443'
# updates

th() {
  ln -sf  ~/kitty-themes/themes/$1 ~/dotfiles/kitty/theme.conf
}
remove_orphan_packages() {
        sudo pacman -Qtdq | sudo pacman -Rns -
}

function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.tar.xz)    tar Jxvf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       rar x $1       ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip -d `echo $1 | sed 's/\(.*\)\.zip/\1/'` $1;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "don't know how to extract '$1'" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

pk () {
if [ $1 ] ; then
case $1 in
tbz)       tar cjvf $2.tar.bz2 $2      ;;
tgz)       tar czvf $2.tar.gz  $2       ;;
tar)      tar cpvf $2.tar  $2       ;;
bz2)    bzip $2 ;;
gz)        gzip -c -9 -n $2 > $2.gz ;;
zip)       zip -r $2.zip $2   ;;
7z)        7z a $2.7z $2    ;;
*)         echo "'$1' не может быть упакован с помощью pk()" ;;
esac
else
echo "'$1' не является допустимым файлом"
fi
}
###### git autocomplete #######
#function_exists() {
#    declare -f -F $1 > /dev/null
#    return $?
#}
#
#for al in git --list-cmds=alias; do
#    alias G$al="git $al"
#
#    complete_func=_git_$(__git_aliased_command $al)
#    function_exists $complete_func && __git_complete G$al $complete_func
#done
#

#######



PS1='[\u@\h \W]\$ '
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin:/home/alarm/dotfiles/scripts/:/usr/lib/go/bin:/home/alx/go/bin


if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
