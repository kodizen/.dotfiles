ZSH_DISABLE_COMPFIX="true"
# Colors
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1
# Load the zsh-syntax-highlighting plugin
# Enable syntax highlighting in the prompt
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
# Use home variable to export zsh
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
# Don't require escaping globbing characters in zsh
unsetopt nomatch

function git_branch {
    git symbolic-ref --short HEAD 2> /dev/null
}

# Set the prompt to display the Git branch name
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:*' enable git
precmd() { vcs_info }
setopt prompt_subst
PROMPT='%F{green} %*%F %~ %F{white}$(git_branch)%F{white}'$'\n'"$ "$'%f'

# Custom $PATH with extra locations
export PATH=$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/go/bin:/usr/local/git/bin:$HOME/.composer/vendor/bin:$PATH

# ZSH_DISABLE_COMPFIX
ZSH_DISABLE_COMPFIX="true"

# Pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Aliases
alias home="cd ~"
alias ssh="TERM=xterm-256color ssh"

alias zconf="code ~/.zshrc"
alias zsource="source ~/.zshrc"
alias code="/Applications/Visual\ Studio\ Code.app/contents/Resources/app/bin/code"
alias de="dev-env"
alias dc="docker-compose"
alias grepnet="sudo lsof -i -n -P | grep"
alias blogdev="code ~/Sites/blog && gatsby develop"
alias gs="git status"
alias c="clear"
alias gstash='git stash'
alias gstasha='git stash apply'
alias gstashl='git stash list'
alias hosts='sudo code /etc/hosts'
alias fetch-dotfiles='cd ~/dotfiles && git pull && git submodule update --init --recursive && cd ~'
alias sync-dotfiles='cd ~/dotfiles && git add . && git commit -m "Syncing dotfile" && git push && cd ~'
alias fetch-sync-dotfiles='fetch-dotfiles && sync-dotfiles'

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias h='history'
alias j='jobs -l'

# alias vi=vim
# alias svi='sudo vi'
# alias vis='vim "+set si"'
# alias edit='vim'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

alias ports='netstat -tulanp'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# become root #
alias root='sudo -i'
alias su='sudo -i'

alias lt='du -sh * | sort -h'

alias gh='history|grep'
alias count='find . -type f | wc -l'
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'

alias loadssu='launchctl load ~/Library/LaunchAgents/com.local.ssu.plist'
alias unloadssu='launchctl unload ~/Library/LaunchAgents/com.local.ssu.plist'
alias startssu='launchctl start com.local.ssu'
alias stopssu='launchctl stop com.local.ssu'
alias editssu='code ~/Library/LaunchAgents/com.local.ssu.plist'
alias editssucode='code ~/scripts/slack-status-updater'
alias restartssu='stopssu && startssu'
alias ssuerrors='tail -f /tmp/com.local.ssu.err'
alias ssuoutput='tail -f /tmp/com.local.ssu.out'

alias runssu='cd ~/scripts/slack-status-updater && ./slack-status-updater.swift'
alias python=python3


function mkd() {
    mkdir -p "$@" && cd "$@"
}

function gacp() {
    if [ $# -eq 0 ]
    then
        echo "Please enter a commit message"
    else
        git add .
        git commit -m "$*"
        git push
    fi
}

function gacpd() {
    if [ $# -eq 0 ]
    then
        echo "Please enter a commit message"
    else
        git diff --color=always | less -R
        git add -p
        git commit -m "$*"
        git push
    fi
}

function cl() {
    DIR="$*";
    # if no DIR given, go home
    if [ $# -lt 1 ]; then
        DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
    ls -F --color=auto
}

function ac() {
    git add .
    git commit -m "$1"
}

function acp() {
    git add .
    git commit -m "$1"
    git push
}

function mkcd {
    if [ ! -n "$1" ]; then
        echo "Enter a directory name"
        elif [ -d $1 ]; then
        echo "\`$1' already exists"
    else
        mkdir $1 && cd $1
    fi
}

# Git upstream branch syncer.
# Usage: gsync master (checks out master, pull upstream, push origin).
function gsync() {
    if [[ ! "$1" ]] ; then
        echo "You must supply a branch."
        return 0
    fi
    
    BRANCHES=$(git branch --list $1)
    if [ ! "$BRANCHES" ] ; then
        echo "Branch $1 does not exist."
        return 0
    fi
    
    git checkout "$1" && \
    git pull upstream "$1" && \
    git push origin "$1"
}

# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800


# Sketchybar interactivity overloads
function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

alias n="nnn"
function nnn () {
    command nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
    fi
}

function zen () {
  ~/.config/sketchybar/plugins/zen.sh $1
}

function kill () {
  command kill -KILL $(pidof "$@")
}

function suyabai () {
  SHA256=$(shasum -a 256 /opt/homebrew/bin/yabai | awk "{print \$1;}")
  if [ -f "/private/etc/sudoers.d/yabai" ]; then
    sudo sed -i '' -e 's/sha256:[[:alnum:]]*/sha256:'${SHA256}'/' /private/etc/sudoers.d/yabai
  else
    echo "sudoers file does not exist yet"
  fi
}

dockrun() {
    docker run -it dyatesupnorth/docker-"${1:-ubuntu1604}"-ansible /bin/bash
}

# Enter a running Docker container.
function denter() {
    if [[ ! "$1" ]] ; then
        echo "You must supply a container ID or name."
        return 0
    fi
    
    docker exec -it $1 bash
    return 0
}

function sync_dotfiles() {
    echo "Syncing dotfiles..."
    cd $HOME/dotfiles 
    git pull
    git add -A
    git commit -m "Update dotfiles"
    git push
    echo "Syncing done"
}

# Delete a given line number in the known_hosts file.
knownrm() {
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        echo "error: line number missing" >&2;
    else
        sed -i '' "$1d" ~/.ssh/known_hosts
    fi
}

# Allow Composer to use almost as much RAM as Chrome.
export COMPOSER_MEMORY_LIMIT=-1
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# source rust
source "$HOME/.cargo/env"

#  zsh syntax highlighting plugin
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/dotfiles/utils/motd.sh
