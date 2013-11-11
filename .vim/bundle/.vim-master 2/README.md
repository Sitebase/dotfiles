# My VIM Environment Settings Files

This is here for my convenience so I can easily keep my vim environment consistent across multiple machines.

There are some original things though that might be useful for people, like the `commentify` plugin
to easily comment/uncomment lines of code, and the `syntax/php.vim` file that I think is easier to understand
than the traditional php syntax file.

-------------------------------------------------------------------------------

## Plugins

### Pathogen

I think pretty much every vim user on the planet uses this plugin.

https://github.com/tpope/vim-pathogen

### Tagbar

This replaced Taglist because I like the hierarchical code tree better

http://majutsushi.github.com/tagbar/

In order to make php support better by default, you could use this gist:
https://gist.github.com/ecoleman/1525027

These links might also help:
http://mwop.net/blog/134-exuberant-ctags-with-PHP-in-Vim.html
http://vim-taglist.sourceforge.net/extend.html

but I've added some other plugins to make tagbar work better with php. As discussed on this page:
http://stackoverflow.com/questions/11290352/vim-hack-ctags-or-tweak-tagbar-for-better-php-support

- Tagbar-phpctags

https://github.com/techlivezheng/tagbar-phpctags
http://www.vim.org/scripts/script.php?script_id=4125

- phpctags

https://github.com/techlivezheng/phpctags

You might need to install the dependencies for this, so you can get in the directory that contains this plugin:

    $ cd ~/.vim/bundle/phpctags

and run:

    $ curl -s http://getcomposer.org/installer | php -d detect_unicode=Off
    $ php composer.phar install

That will create a `vendor` directory that contains the dependencies and a `composer.lock` file, you can then delete the downloaded `composer.phar` file.

### NerdTree

https://github.com/scrooloose/nerdtree

I've also added the Nerdtree tab plugin

https://github.com/jistr/vim-nerdtree-tabs

via: stackoverflow.com/questions/2283417/vim-and-nerd-tree-can-nerd-tree-persist-across-tabs-in-macvim

### syntax/python.vim

https://github.com/hdima/vim-scripts
http://www.vim.org/scripts/script.php?script_id=790

### Camel Case Motion

https://github.com/bkad/CamelCaseMotion

see also:
http://vim.wikia.com/wiki/Moving_through_camel_case_words
http://www.vim.org/scripts/script.php?script_id=1905
http://stackoverflow.com/questions/8949317/moving-through-camelcase-words-in-vim

### indent/python.vim

http://www.vim.org/scripts/script.php?script_id=974
http://henry.precheur.org/vim/python

### Commentify

A really lightweight plugin to comment/uncomment code, basically a lightweight
[NERD Commenter](https://github.com/scrooloose/nerdcommenter) or an updated
[comments] (http://www.vim.org/scripts/script.php?script_id=1528)

### Surround

trying this again

https://github.com/tpope/vim-surround

### markdown

https://github.com/tpope/vim-markdown

-------------------------------------------------------------------------------

## Install

### In Mac or Linux

1. Create `$HOME/.vim`

2. cd into `$HOME/.vim`

3. clone the repo

        git clone [repo] .

4. Symlink `$HOME/.vim/vimrc` and `$HOME/.vim/gvimrc`

        ln -s $HOME/.vim/vimrc $HOME/.vimrc
        ln -s $HOME/.vim/gvimrc $HOME/.gvimrc

### In Windows 

1. Create `%HOMEPATH%\vimfiles`

2. cd into `%HOMEPATH%\vimfiles`

3. clone the repo

        git clone [repo] .

4. make a symlink for the `vimrc` and `gvimrc` files (you need an admin console cmd shell for this):

        mklink %HOMEPATH%\\_vimrc %HOMEPATH%\\vimfiles\\vimrc
        mklink %HOMEPATH%\\_gvimrc %HOMEPATH%\\vimfiles\\gvimrc


-------------------------------------------------------------------------------

## Warnings

This currently does not work as well on the console version of Vim, I've spent time tuning the *GUI* version,
not so much the console version.

## Plugins I've thought about using

https://github.com/klen/python-mode

https://github.com/jistr/vim-nerdtree-tabs
via: http://stackoverflow.com/questions/2283417/vim-and-nerd-tree-can-nerd-tree-persist-across-tabs-in-macvim

https://github.com/xolox/vim-easytags
via: http://stackoverflow.com/questions/1224838/vim-php-omni-completion

https://github.com/pangloss/vim-javascript

https://github.com/nathanaelkane/vim-indent-guides


-------------------------------------------------------------------------------

## Things I don't like

### Mac

For some reason sizing the Macvim window on startup doesn't work, I have no idea why

-------------------------------------------------------------------------------

## Plugins I used and then removed

### Taglist

http://www.vim.org/scripts/script.php?script_id=273

I used tagbar more, no sense in having both anymore

### Rainbow Parenthesis

This doesn't work in new tabs/buffers, and it took me like a month to notice it
didn't work in the buffers, so I figured I didn't need it

http://www.vim.org/scripts/script.php?script_id=3772

### Markdown

I actually don't know what happened to this, the folder was empty which makes me
think I forgot to add the file to git, and I originally installed it on an os I no longer
use. *Sigh*

I went with this markdown syntax plugin:

https://github.com/tpope/vim-markdown

I had originally installed:

http://www.vim.org/scripts/script.php?script_id=1242

but it would italicize the rest of the body if the word had an underscore in it (eg, sn_id caused 
everything after the underscore until the end to be italicized) while the one I went with
just marks it as an error, which is still not ideal, but better.

### syntax/php.vim

The php syntax file seemed way too complicated to me, so I rolled my own using this syntax
file as a base

https://github.com/StanAngeloff/php.vim
https://github.com/EvanDotPro/vim-php-syntax-check
http://www.vim.org/scripts/script.php?script_id=2874

### comments

http://www.vim.org/scripts/script.php?script_id=1528

### PHP Doc

I am not doing a lot of php right now, and when I did, I hardly ever used this plugin since it wasn't as flexible as I would've liked and so I spent a lot of time deleting things it put it

https://github.com/sumpygump/php-documentor-vim
via: http://stackoverflow.com/questions/7603446/vim-insert-phpdoc-automatically

