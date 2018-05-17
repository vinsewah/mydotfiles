# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/vincentchang/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gallois"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

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

# Lyft stuff
source '/Users/vincentchang/src/awsaccess/awsaccess2.sh' # awsaccess
export PS1="\$(ps1_mfa_context)$PS1" # awsaccess

# Vi bindings on prompt
set -o vi
bindkey -v
bindkey '^R' history-incremental-search-backward

# Aliases
alias so="ssh vince-onebox.dev.ln"
alias spa="ssh publicapi-legacy-vince-onebox.dev.ln"
alias sfr="ssh fixedroutes-legacy-vince-onebox.dev.ln"
alias sal="ssh api-legacy-vince-onebox.dev.ln"
alias sf="ssh fanner-legacy-vince-onebox.dev.ln"
alias sfrp="ssh fixedroutes-production-iad.lyft.net"

alias ctags="`brew --prefix`/bin/ctags" 
alias ct="ctags -R -f ./.tags ."
alias a='ag --noheading -S'
alias al='a -l'

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


alias vi='/usr/local/Cellar/vim/8.0.1750/bin/vi'
alias vim='/usr/local/Cellar/vim/8.0.1750/bin/vim'

function sshOneboxFunc() {
  eval "ssh "$1"-legacy-"$2"-onebox.dev.lyft.net"
}
alias onebox=sshOneboxFunc

function syncOneboxFunc() {
    eval "~/src/ops/hacktools/sync-to-onebox-v3.sh "$1"-legacy-"$2"-onebox.dev.lyft.net"
}
alias oneboxs=syncOneboxFunc
alias r='exec bash'

# Allows you to page up and down with ctrl-{f,b} in FZF
export FZF_DEFAULT_OPTS='--bind ctrl-f:page-down,ctrl-b:page-up'
source '/Users/vincentchang/src/blessclient/lyftprofile' # bless ssh alias

# Go
export GOPATH=~/src/go
export PATH=$GOPATH/bin:$PATH
export GOPATH=/Users/vincentchang/go

# Android
export ANDROID_HOME=/Users/vincentchang/Library/Android/sdk
