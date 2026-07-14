# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/dan/.zsh/completions:"* ]]; then export FPATH="/Users/dan/.zsh/completions:$FPATH"; fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# prevent fork error in spring (ruby)
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# mise configuration (ruby)
. "$HOME/.local/bin/env"
eval "$(~/.local/bin/mise activate)"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#r ZSH_THEME="agnoster" # set by `omz`

plugins=(git kubectl fzf)

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf cli integration
source <(fzf --zsh)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vimrc="nvim ~/.config/nvim/init.lua"
alias vimplugins="nvim ~/.config/nvim/lua/custom/plugins/init.lua"
alias reload="source ~/.zshrc"
alias vimfzf='nvim $(fzf -m --preview="bat --color=always {}")'
alias omp=oh-my-posh
alias cd=z
alias cat=bat
alias ls=eza
alias vim='nvim'
alias n='nvim'
alias gpff='git push --no-verify'

### work/job specific configs
source ~/.dotfiles/secrets/**


#export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/Users/dan/bin:$PATH"
export PATH="/Users/dan/workspace/scripts:$PATH"
export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"
export PATH="/Applications/RubyMine.app/Contents/MacOS:$PATH"
export PATH="/Users/dan/.cargo/bin:$PATH"
export PATH="$HOME/.luarocks/bin:$HOME/.luarocks51/bin:$PATH"
export PATH="/Users/dan/go/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH" 

# remove username and host from prompt 
prompt_context() {}

# pnpm
export PNPM_HOME="/Users/dan/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#[ -f "/Users/dan/.ghcup/env" ] && source "/Users/dan/.ghcup/env" # ghcup-env


# Updates PATH for the Google Cloud SDK.
if [ -f '~/workspace/google-cloud-sdk/path.zsh.inc' ]; then . '~/workspace/google-cloud-sdk/path.zsh.inc'; fi

# Enables shell command completion for gcloud.
if [ -f '~/workspace/google-cloud-sdk/completion.zsh.inc' ]; then . '~/workspace/google-cloud-sdk/completion.zsh.inc'; fi


# zoxide
eval "$(zoxide init zsh)"


### HISTORY CONFIGURTIONS
HISTFILE="$HOME/.zsh_history"
# Display timestamps for each command
HIST_STAMPS="yyyy-mm-dd"

HISTSIZE=1000000
SAVEHIST=1000000

# Ignore these commands in history
HISTORY_IGNORE="(ls|pwd|cd)*"

# Write the history file in the ':start:elapsed;command' format.
setopt EXTENDED_HISTORY

# Do not record an event starting with a space.
setopt HIST_IGNORE_SPACE

# Don't store history commands
setopt HIST_NO_STORE

# nvm stuff
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


#oh my posh prompt
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  # to run with a theme, then export with 'omp config export --format toml --output ~/dotfiles/oh-my-posh.toml'
  # eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/catppuccin.omp.json)"
  eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh.toml)"
fi

# direnv hook
eval "$(direnv hook zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "/Users/dan/.deno/env"
# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit

# opencode
export PATH=/Users/dan/.opencode/bin:$PATH
