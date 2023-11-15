# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
#robbyrussell See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(git zsh-autosuggestions)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# ######################## #
#  GIT / GIT FLOW Sripts   #
# ######################## #

alias gtp="git push"

# git stash
alias gsh="git stash"
alias gsha="git stash apply"
alias gshl="git stash list"
alias gshc="git stash clear"

# Git fetch
alias gfo="git fetch origin"
alias gfop="git fetch origin -p"

# Git Tag
alias gft="git fetch --tags"
alias gpt="git push --tags"

# Git Master Branch
alias gcm="git checkout master"
alias gpm="git pull origin master"
alias gmm="git merge master"

# Git Main Branch
alias gcmain="git checkout main"
alias gpmain="git pull origin main"
alias gmmain="git merge main"

# Git Develop Branch
alias gcd="git checkout develop"
alias gpd="git pull origin develop"
alias gmd="git merge develop"


# GIT Flow feature
gckf() { git checkout feature/$1; }
gffs() { git flow feature start $1; }
gffp() { git flow feature publish $(git_flow_current_branch); }
gfff() { git pull origin develop; git flow feature finish $(git_flow_current_branch); }

# GIT bugfix
gckb() { git checkout bugfix/$1; }
gfbs() { git flow bugfix start $1; }
gfbp() { git flow bugfix publish $(git_flow_current_branch); }
gfbf() { git pull origin develop; git flow bugfix finish $(git_flow_current_branch); }

# GIT hotfix
gch() { git checkout hotfix/$1; }
gfhs() { git flow hotfix start $1; }
gfhfp() { git flow hotfix publish $(git_flow_current_branch); }
gfhf() { git pull origin develop; git flow hotfix finish $(git_flow_current_branch); }
# gfhf() { git fetch --tags; git pull origin master; git flow hotfix finish -F $(git_flow_current_branch); }

# GIT release - I dont like to use it, prefere npm version :D 
# gcr()  { git checkout release/$1;  }
# gfrs() { git flow release start $1; }
# gfrf() { git flow release finish; }

# GIT current branch
git_flow_current_branch(){ git rev-parse --abbrev-ref HEAD | cut -d'/' -f 2; }

# Git Last Tag - Show last tag generated
gltag() {
	LAST_TAG=$(git for-each-ref --format="%(refname:short)" --sort=taggerdate refs/tags | tail -1 | git for-each-ref --format="%(refname:short)" --sort=taggerdate refs/tags | tail -1);
# 	echo $LAST_TAG | xargs echo -n | pbcopy;
 	echo "LAST TAG: "$LAST_TAG;
}

# gcbranchs() {
	# git fetch -p && for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do git branch -D $branch; done
# }

# Update local repo with remote 
# - update master
# - update develop
# - fetch branchs
# - fetch tags
# - remove branchs deleteds in remote
uprep() {
  gcm; gpm; gcmain; gpmain; gcd; gpd; gft; git fetch -p && for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do git branch -D $branch; done
}

gudev() {
  git checkout develop && git pull origin develop
}

#*******************#
# End Git Script    #
#*******************#


SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  node		# node version
  python	# python version
  venv		# virtual environment name
  package	# package name
  exec_time     # Execution time
  time		# Current time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character

)

SPACESHIP_USER_SHOW="always"
SPACESHIP_HOST_SHOW="always"
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_FORMAT='%D{%H:%M:%S.%.}'
SPACESHIP_TIME_PREFIX="now is: "

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
