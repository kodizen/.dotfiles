ZSH_DISABLE_COMPFIX="true"
# Colors
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1
HIST_STAMPS="mm/dd/yyyy"

# Load the zsh-syntax-highlighting plugin
# Enable syntax highlighting in the prompt
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# Use home variable to export zsh
export ZSH=$HOME/.oh-my-zsh

# Change the order of this command to improve performance
# source it before plugins
source $ZSH/oh-my-zsh.sh

function git_branch {
    git symbolic-ref --short HEAD 2> /dev/null
}

autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:*' enable git
precmd() { vcs_info }
setopt prompt_subst
PROMPT='%F{green}🚀 %F{242}%~%f %F{white}$(git_branch)%f $(if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == "true" ]]; then if [[ -n $(git status --porcelain) ]]; then echo "%F{green}○"; else echo "%F{green}●"; fi; fi)'$'\n'"$ "$'%f'

# Custom $PATH with extra locations
export PATH=$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/go/bin:/usr/local/git/bin:$HOME/.composer/vendor/bin:$PATH

# Pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
# Lazy loading of pyenv
if [[ -n $PYENV_ROOT && -z $(command -v pyenv) ]]; then
  eval "$(pyenv init --path)"
fi

# Aliases
alias home="cd ~"
alias ssh="TERM=xterm-256color ssh"
alias zconf="nvim ~/.zshrc"
alias vconf="nvim ~/.vimrc"
alias nconf="nvim ~/dotfiles/.config/nvim"
alias zsource="source ~/.zshrc"
alias dc="docker-compose"
alias grepnet="sudo lsof -i -n -P | grep"
alias gs="git status"
alias c="clear"
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
alias gundo="git reset --soft HEAD~1"
alias h='history'
alias j='jobs -l'
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
alias ports='netstat -tulanp'
alias root='sudo -i'
alias su='sudo -i'
alias lt='du -sh * | sort -h'
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
alias allist="python ~/scripts/alias_list.py"
alias newsurls="nvim ~/dotfiles/.newsboat/urls"
alias dotpull="cd ~/dotfiles && make pull && cd ~"
alias dotpush="cd ~/dotfiles && make push && cd ~"
alias gcdp="git checkout develop && git pull"
alias gcmp="git checkout main && git pull"


function mastodon(){
  if [ "$#" -ne 1 ]; then
    echo "Usage: mastodon <message>"
    return 1
  fi

  sh ~/scripts/mastodon-poster.sh "$1"
}


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


alias n="nnn"
function nnn () {
    command nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
    fi
}

gitinit() (
     if [[ ! "$1" ]] ; then
        echo "You must supply a name."
        return 0
    fi

    if [[ ! "$2" ]] ; then
        echo "You must supply a description."
        return 0
    fi

    git init
    gh repo create $1 --private  -d $2 --add-readme
    git remote add origin git@github.com:kodizen/$1.git
    git pull origin main
    git add .
    git commit -m "Initial commit"
    git push -u origin main
    
)


function kill () {
  command kill -KILL $(pidof "$@")
}


function dotmake() {
  echo "Arguments passed: $@"
  original_dir=$(pwd)
  cd ~/dotfiles
  make "$@"
  echo "original dir: $(pwd)"
  cd "$original_dir"

}

function fr() {
  if [ "$#" -ne 3 ]; then
    echo "Usage: fr <search_string> <replace_string> <file_extension>"
    return 1
  fi

  find . -type f -name "*.$3" -exec sed -i 's/'"$1"'/'"$2"'/g' {} +
}

function dockergeddon(){
  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
}

function addpost(){
  if [ "$#" -ne 1 ]; then
    echo "Usage: addblogpost <title>"
    return 1
  fi

    cd ~/workspace/superior-satellite
    yarn new-post "$1"
    open http://localhost:3000
    nvim .
}

function tmux_sessionizer(){
tmux-sessionizer

}

zle -N tmux_sessionizer


bindkey "^F" tmux_sessionizer
# Allow Composer to use almost as much RAM as Chrome.
export COMPOSER_MEMORY_LIMIT=-1
# Lazy loading of nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

# source rust
source "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm" 
# Source your motd.sh if it exists, otherwise no-op
[ -f ~/dotfiles/utils/motd.sh ] && source ~/dotfiles/utils/motd.sh
 # This loads nvm bash_completion
# bun completions
[ -s "/Users/kodizen/.bun/_bun" ] && source "/Users/kodizen/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$PATH:$HOME/scripts"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}

ZSH_AUTOSUGGEST_ACCEPT_WIDGETS+=(
    tmux-sessionizer
)
export EMACS="*term*"
export PATH="$PATH:$HOME/.emacs.d/bin"


