# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/Developer/SDKs/android-sdk-mac_x86/tools:~~/.sitebase/tools:/User/wim/Scripts:/Developer/usr/bin:/Applications/red5-1.0.0/src:/Applications/MAMP/bin/php/php5.3.6/bin:/Applications/MAMP/bin/php/php5.3.6/lib/php/phing/tasks/ext:/Applications/MAMP/bin/php/php5.3.6/lib/php:/Applications/MAMP/Library/bin:/Applications/Adobe\ Flash\ Builder\ 4/sdks/3.5.0/bin:/Applications/phonegap-phonegap-2dbbdab/lib/ios/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
