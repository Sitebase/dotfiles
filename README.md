# Dotfiles

These dotfiles work for bash and zsh.
To install you just use one of the following commands depending on your environment. Best is to clone it in your home folder, so `~/dotfiles`. You can put it elsewhere but just make sure you make a symlink from `~/dotfiles`.
The bootstrapper script will pull in the latest version and copy the files to your home folder.

```
# bash
git clone https://github.com/sitebase/dotfiles.git && cd dotfiles && source bootstrap.sh
```

```
# zsh
git clone https://github.com/sitebase/dotfiles.git && cd dotfiles && ./bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```
# bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```
# zsh
./bootstrap.sh
```

# Extend 

~/.path and ~/.extra are also files that get sourced if they exist so you can use these to for example add extra location to the PATH variable.
The .extra file can for example be used to store some custom functions or so.

Below is an example of a .path file that will add the utils folder to PATH.

```bash
# PATH additions
export PATH="~/utils:$PATH"
```

# Brew 

Add script to reinstall all my brew packages

* vim
* wget
* reattach-to-user-namespace
* tmux
* git-extras

## Thanks to…

* [Mathias Bynens](http://mathiasbynens.be/) for sharing his [amazing collection of dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Gianni Chiappetta](http://gf3.ca/) for sharing his [amazing collection of dotfiles](https://github.com/gf3/dotfiles)
* [Matijs Brinkhuis](http://hotfusion.nl/) and his [dotfiles repository](https://github.com/matijs/dotfiles)
* [Jan Moesen](http://jan.moesen.nu/) and his [ancient `.bash_profile`](https://gist.github.com/1156154) + [shiny _tilde_ repository](https://github.com/janmoesen/tilde)
* [Ben Alman](http://benalman.com/) and his [dotfiles repository](https://github.com/cowboy/dotfiles)
* [Nicolas Gallagher](http://nicolasgallagher.com/) and his [dotfiles repository](https://github.com/necolas/dotfiles)
* [Tom Ryder](http://blog.sanctum.geek.nz/) and his [dotfiles repository](https://github.com/tejr/dotfiles)
* [Chris Gerke](http://www.randomsquared.com/) and his [tutorial on creating an OS X SOE master image](http://chris-gerke.blogspot.com/2012/04/mac-osx-soe-master-image-day-7.html) + [_Insta_ repository](https://github.com/cgerke/Insta)
* @ptb and [his _OS X Lion Setup_ repository](https://github.com/ptb/Mac-OS-X-Lion-Setup)
* [Lauri ‘Lri’ Ranta](http://lri.me/) for sharing [loads of hidden preferences](http://lri.me/osx.html#hidden-preferences)
* [Tim Esselens](http://devel.datif.be/)
* anyone who [contributed a patch](https://github.com/mathiasbynens/dotfiles/contributors) or [made a helpful suggestion](https://github.com/mathiasbynens/dotfiles/issues)