# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
#export PATH=$PATH:/home/kansi/Documents/ejabberd/rebar3/rebar3

ZSH_THEME="zanshin"

# Global Variables
export EDITOR=nvim
#export ERL_LIBS=/home/kansi/bin/proper:/home/kansi/Documents/zotonic:/home/kansi/Documents/tohive/cowboy
#export ERL_LIBS=/home/kansi/bin/proper
#export ERL_COMPILER_OPTIONS='[{pa, "/home/kansi/Documents/tohive/cowboy/ebin/"},{i,"/home/kansi/Documents/done/code/swirl/include"}]'
#export ZOTONIC=/home/kansi/Documents/intern/zotonic
#export TERM=xterm-256color
autoload -U compinit
compinit


# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git, mercurial)

source $ZSH/oh-my-zsh.sh
. /home/kansi/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Customize to your needs...
#
# Proxy
export http_proxy='http://proxy.iiit.ac.in:8080'
export https_proxy='http://proxy.iiit.ac.in:8080'
#export http_proxy=''
#export https_proxy=''

export GOROOT=/usr/lib/go
export GOPATH=${HOME}/Documents/go
#export PATH=${PATH}:${GOROOT}/bin:/home/kansi/bin
export PATH=${PATH}:${GOROOT}/bin:${GOPATH}/bin:/home/kansi/bin
alias hfree="sudo python ~/bin/ps_mem.py"
alias hopen="sudo netstat -tulpn"
alias tmux="TERM=screen-256color-bce tmux"
alias now="date +%a\ %B\ %d,\ %r"
alias ecc="emacsclient -n"
alias ecn="emacsclient -nw"
alias vim="nvim"
alias zsource="source /home/kansi/.zshrc"
#
#if [[ -r /usr/lib/python3.4/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    #source /usr/lib/python3.4/site-packages/powerline/bindings/zsh/powerline.zsh
#fi
