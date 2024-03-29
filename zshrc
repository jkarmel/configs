# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kphoen"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails rbenv heroku npm node)

#put local customizations in .zshrc.local
if [ -e "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi
#do this before loading oh-my-zsh so .zshrc.local can add plugins

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

bindkey -v
bindkey '^R' history-incremental-search-backward

alias t='TERM=screen-256color-bce tmux -u'

unsetopt correct_all

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Include Flex
export PATH=~/Support/flex_sdk_4.6/bin:$PATH
