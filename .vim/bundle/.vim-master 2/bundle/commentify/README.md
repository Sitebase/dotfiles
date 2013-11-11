# Commentify

Vim Plugin to comment and un-comment lines in different source files in both normal and visual mode

This is roughly based on the [vim comments plugin](http://www.vim.org/scripts/script.php?script_id=1528).

## Why?

The comments.vim plugin was great, but it didn't support newer languages like Golang, and since Vim includes
a `commentstring` variable for all filetypes it supports, I figured I could write a plugin that commented out
blocks of code using that variable instead of relying on lots of conditional statements, also, I really wanted
to use the same mapping to comment/uncomment the code, and that's how Commentify was born.

## Installation

Use [pathogen](https://github.com/tpope/vim-pathogen). Clone this repo into the bundle directory.

## Usage

By default, Commentify maps the ctrl-c key to commenting and uncommenting.

If you wish to override that, just set `g:commentify_map_keys` to 0, then you can define
a different mapping for each of the functions in your `.vimrc`.

to map normal mode, use the `commentify` function:

    commentify#Commentify()

to map visual mode, use the `RangeCommentify` function:

    commentify#RangeCommentify()

