


# If you come from bash you might have to change your $PATH.
export PATH=/var/lib/snapd/snap/bin:$HOME/.local/share/gem/ruby/3.2.0/bin:$HOME/.bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-autocomplete
)

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

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias new='kitten icat --clear; clear; source ~/.zshrc'
alias cat='bat'
alias ls='exa --icons'
alias ll='exa --icons --long'
alias tree='exa --icons --tree --level=3'
alias icat="kitten icat --clear; kitten icat"
alias pipe="pipes-rs -k outline"
alias toaster="ollama run llama3.1"
alias nano="nano -S -l -m -q -_"


export PATH=$PATH:/home/niko/.spicetify

# Created by `pipx` on 2024-07-29 21:55:08
export PATH="$PATH:/home/niko/.local/bin"

fastfetch --logo YiffOS
#icat --place 30x20@0x1 ~/Pictures/duck-pathetic.jpg

# Niko's Custom prompt

static_info() {
  echo "%B%F{red}%n%f@%m"
}

cur_wdir() {
  tmp_out=""
  git_cb=$(git_current_branch)

  if [ -n "$git_cb" ]; then
    tmp_out="$tmp_out%F{blue}%~%f"
  else
    tmp_out="$tmp_out%~"
  fi

  if [ -n "$git_cb" ]; then
    tmp_out="$tmp_out %F{blue}(%f$git_cb%F{blue})%f"
  fi

  if [ -n "$(git status --porcelain 2> /dev/null)" ]; then
    # Add ! for changes
    tmp_out="$tmp_out%F{red}!%f" 
  fi

  echo $tmp_out

}

precmd() { 
  print -rP '   $(static_info) 〉  $(cur_wdir) ' 
}


PROMPT='   %F{green}󰛓%f%B 〉%f'
RPROMPT='〈 at %B%D{%H:%M}%f   '