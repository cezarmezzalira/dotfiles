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

SPACESHIP_PROMPT_ORDER=(
  # --- Linha 1: Contexto de Localização e Código ---
  time          # Hora atual (bom ver no início para logs visuais)
  user          # Usuário (oculto por padrão, aparece via SSH)
  host          # Hostname (oculto por padrão, aparece via SSH)
  dir           # Diretório atual (essencial estar no começo)
  
  # --- Linha 1: Ferramentas e Ambientes de Desenvolvimento ---
  git           # Git status (prioridade máxima em desenvolvimento)
  node          # Versão do Node.js
  venv          # Nome do Virtualenv Python (melhor antes da versão)
  python        # Versão do Python
  package       # Nome/Versão do pacote (package.json, Cargo.toml, etc.)
  
  # --- Linha 2: Informações de Execução e Comando ---
  line_sep      # Quebra de linha (mantém o prompt limpa e focado)
  exec_time     # Tempo de execução do último comando
  jobs          # Indicador de processos em segundo plano
  exit_code     # Código de saída (fica vermelho se o comando falhar)
  char          # O caractere do prompt (ex: ❯)
)

# --- Ajustes finos adicionais recomendados ---
SPACESHIP_TIME_SHOW=true          # Garante que o tempo vai aparecer
SPACESHIP_PROMPT_ASYNC=true       # Renderiza o prompt de forma assíncrona (não trava o terminal)

# --- Exibição de Usuário e Host ---
SPACESHIP_USER_SHOW="always"
SPACESHIP_HOST_SHOW="always"
SPACESHIP_HOST_PREFIX="@"        # Remove o espaço padrão, deixando "user@host" colados

# --- Estrutura Geral ---
SPACESHIP_PROMPT_ADD_NEWLINE=true  # Adiciona uma linha em branco entre os comandos (ótimo para legibilidade)

# --- Caractere de Entrada ---
SPACESHIP_CHAR_SYMBOL="❯"          # Símbolo elegante estilo 'Pure prompt'
SPACESHIP_CHAR_SUFFIX=" "         # Garante um espaço confortável para começar a digitar

# --- Configuração de Hora ---
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_FORMAT='%D{%H:%M:%S}' # Formato seguro (HH:MM:SS). Se quiser milissegundos precisos, use '%D{%H:%M:%S.%f}'
SPACESHIP_TIME_PREFIX=""            # Removido o "now is: " para o início da linha ficar limpo e rápido de ler
SPACESHIP_TIME_SUFFIX=" "           # Um pequeno espaço antes do usuário começar (ex: 23:31:00 user@mac...)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.local/bin:$PATH"

if ! infocmp "$TERM" >/dev/null 2>&1; then
    export TERM=xterm-256color
fi
