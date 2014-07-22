# Add `~/bin` to the `$PATH`
#export PATH="$HOME/bin:$PATH"
PATH=$PATH:/Developer/SDKs/android-sdk-mac_x86/tools:/User/wim/.sitebase/tools:/User/wim/Scripts:/Developer/usr/bin:/Applications/red5-1.0.0/src:/Applications/MAMP/bin/php/php5.3.6/bin:/Applications/MAMP/bin/php/php5.3.6/lib/php/phing/tasks/ext:/Applications/MAMP/bin/php/php5.3.6/lib/php:/Applications/MAMP/Library/bin:/Applications/Adobe\ Flash\ Builder\ 4/sdks/3.5.0/bin:/Applications/phonegap-phonegap-2dbbdab/lib/ios/bin:/opt/local/bin; 
export PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion