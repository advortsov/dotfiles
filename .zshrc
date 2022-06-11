# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/alx/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

#ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"



# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

show_which() {
  OUTPUT=$(which $1 | cut -d " " -f7-)
  echo "Running '$OUTPUT'" 1>&2
}

alias grep='grep --colour=auto'
alias df='show_which df && df -k --print-type --human-readable'
alias du='show_which du && du -k --total --human-readable'


alias ls='ls --color=auto'
alias ll='ls -al --color=auto'

# maven
alias mc='mvn clean'
alias mci='mvn clean install -DskipTests=true'
alias mcit='mvn clean install'
alias mcitm='mvn clean install -Djps.track.ap.dependencies=false'

alias mvn8='mvn -Dmaven.compiler.fork=true -Dmaven.compiler.executable=~/.jdks/corretto-1.8.0_312/bin/javac'
alias mvn11='mvn -Dmaven.compiler.fork=true -Dmaven.compiler.executable=/usr/lib/jvm/java-11-openjdk/bin/javac'

# gradle
alias gr='gradle'
alias grcb='gradle clean build -x test'
alias grb='gradle build'
alias grcbt='gradle clean build'

# go to ...
alias gs='cd ~/dotfiles/scripts'
alias gdf='cd ~/dotfiles'
alias gp='cd ~/pet'
alias gw='cd ~/work'
alias gd='cd ~/Downloads'

# remove routes for vpn
alias rr='sudo ip r del 192.168.10.0/25 dev tunsnx && sudo ip r del 192.168.10.128/25 dev tunsnx'
# configs
alias cfb='nvim ~/.bashrc'
alias cfz='nvim ~/.zshrc'
alias cfvim='nvim ~/.vimrc'
alias cfi3='nvim ~/.config/i3/config'
alias cfc='nvim ~/.config/picom.conf'
alias cfpb='nvim ~/.config/polybar/config'
alias cfr='nvim ~/.config/ranger/rc.conf'
alias cfx='nvim ~/.xinitrc'

alias r='ranger'
alias f='fselect'

alias extract_audio='python3 ~/dotfiles/scripts/extract_audio.py'
alias to_pdf='python3 ~/dotfiles/scripts/to_pdf.py'
alias extract_audio_multithreading='python3 ~/dotfiles/scripts/extract_audio_multithreading.py'
alias pcm='~/soft/pycharm-community-2020.2/bin/pycharm.sh'
alias oc_dev='~/soft/oc/oc login -u developer -p developer https://api.crc.testing:6443'
# updates
alias send_page_to_pb='python ~/dotfiles/scripts/send_page_to_pb.py'
alias send_email='python ~/dotfiles/scripts/send_email.py'

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

sync_mp3() {
    extract_audio $1 && mv *.mp3 ~/hdd/syncthing/Music/ && echo "Done!"
}
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

export PATH=/home/alx/dotfiles/scripts:/home/alx/.local/bin:$PATH
export EDITOR='code'
export VISUAL='code'
export PATH=$PATH:$HOME/bin
export PATH="/home/alx/.local/share/solana/install/active_release/bin:$PATH"
