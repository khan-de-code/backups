# Fig pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fig init zsh pre)"



# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/dbatz/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# ------------ Ruby -----------------
if [ -d "/usr/local/opt/ruby/bin" ]; then
  export PATH=/usr/local/opt/ruby/bin:$PATH
  export PATH=$(gem environment gemdir)/bin:$PATH
fi

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
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(git zsh-syntax-highlighting zsh-autosuggestions docker docker-compose colored-man-pages alias-finder poetry copypath)

source $ZSH/oh-my-zsh.sh
source /Users/dbatz/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# Set editor for kb
export EDITOR='code'

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

export PATH=/Users/dbatz/Library/Python/3.8/bin:$PATH

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# ------------ pyenv -----------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# -------------- aliases ---------------
alias work="cd ~/work_projects"

alias cleanup-branches="
  gco master \
  && echo -e '\n' \
  && git pull \
  && echo -e '\n' \
  && git fetch --tags \
  && echo -e '\n' \
  && git fetch --prune \
  && echo -e '\n' \
  && git branch --merged | grep -v 'master' | xargs git branch -d"

alias git-cleanup-branches=cleanup-branches

alias playground="cd ~/testing_projects/playground"

# Removes all non-text elements from the currently copied element in the clipboard
alias plaintext="pbpaste | pbcopy"

# Replace ls with exa
alias ll="exa --long --classify --header --group --all --icons"
alias ls="exa --classify --sort=.name --group-directories-first --all --icons"
alias tree="exa --tree --all --icons"

# -------------- functions ---------------

alias poetry='f(){ 
  poetry "$@";
  updated_dependencies=false;

  sort_toml () {
    start=$1
    end=$2

    if [[ $start != $end ]]; then
      ex -c "${start},${end} sort|w|q" pyproject.toml
    fi;
  }

  if [[ "$@" == *"add"* || "$@" == *"init"* || "$@" == *"install"* || "$@" == *"remove"* || "$@" == *"update"* ]]; then
    updated_dependencies=true;
  fi;

  if $updated_dependencies; then
    echo "\nSorting pyproject.toml";

    sort_reg=( $(awk "/^\[tool\.poetry\.dependencies\]/{flag=1; next}/^$/{flag=0}flag{print NR}" pyproject.toml) );
    sort_dev=( $(awk "/^\[tool\.poetry\.dev-dependencies\]/{flag=1; next}/^$/{flag=0}flag{print NR}" pyproject.toml) );

    sort_toml $sort_reg[2] $sort_reg[-1];
    sort_toml $sort_dev[1] $sort_dev[-1];
    
  fi;

  unset updated_dependencies; 
  unset -f f; 
}; f'

alias update_pyenv_pip='f(){
  current_directory=$(pwd)

  pyenv_python_versions=()

  for dir in ~/.pyenv/versions/*; do
      if [[ $dir == *"3."* ]]; then
          pyenv_python_versions+=($dir)
      fi
  done;

  for base_dir in "${pyenv_python_versions[@]}"; do
      parent_dir=$(cd $base_dir; pwd)
      parent_dir="${parent_dir}/envs"

      cd $parent_dir

      for dir in ./*; do
        bin=$(cd $dir; pwd)
        pyenv_python_versions+=($bin)
      done;
  done;

  for python_version in "${pyenv_python_versions[@]}"; do
      cd "${python_version}/bin";
      ./python -m pip install --upgrade pip;
  done;

  cd $current_directory  
}; f'

# -------------- makefile autocomplete ---------------
function _makefile_targets {
    local curr_arg;
    local targets;

    # Find makefile targets available in the current directory
    targets=''
    if [[ -e "$(pwd)/Makefile" ]]; then
        targets=$( \
            grep -oE '^[a-zA-Z0-9_-]+:' Makefile \
            | sed 's/://' \
            | tr '\n' ' ' \
        )
    fi

    # Filter targets based on user input to the bash completion
    curr_arg=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "${targets[@]}" -- $curr_arg ) );
}
complete -F _makefile_targets make


# Fig post block. Keep at the bottom of this file.
eval "$(fig init zsh post)"
