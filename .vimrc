set nocompatible                " be iMproved, required
filetype off                    " required for vundle (reenabled down script)

syntax on                       " enable syntax highlighting (previously syntax on).

set laststatus=2                " Always display the status line
set autoindent                  " auto-indent
set tabstop=4                   " tab spacing
set softtabstop=4               " unify
set shiftwidth=4                " indent/outdent by 4 columns
set shiftround                  " always indent/outdent to the nearest tabstop
set expandtab                   " use spaces instead of tabs
set smarttab                    " use tabs at the start of a line, spaces elsewhere
set nowrap                      " don't wrap text
set relativenumber              " show dynamic file line guttering (requires vim 7.4+)
set number                      " show line numbers
set formatoptions-=c            " disable auto-commenting on Enter
set formatoptions-=r            " disable auto-commenting on Enter
set formatoptions-=o            " disable auto-commenting on Enter
set backspace=indent,eol,start  " backspace over anything in insert mode

"
" VUNDLE BEGIN (plugins below)
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"

set rtp+=~/.vim/bundle/Vundle.vim            " set the runtime path to include Vundle
call vundle#begin()                          " initialize vundle
Plugin 'VundleVim/Vundle.vim'                " let Vundle manage Vundle, required

" The NERD TREE: A tree explorer plugin for vim.
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'tpope/vim-fugitive'                  " fugitive.vim: a Git wrapper so awesome, it should be illegal
Plugin 'scrooloose/syntastic'                " Syntastic: syntax checking hacks for vim
Plugin 'tpope/vim-surround'                  " SURROUND.VIM: quoting/parenthesizing made simple

" cs<a><b> -- switch quotes/braces (eg. cs'")
" ds<char> -- remove quotes/braces (eg. ds')
" yss)     -- wrap line with () brackets

Plugin 'kien/ctrlp.vim'                      " Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder
Plugin 'vim-airline/vim-airline'             " vim-airline: Lean & mean status/tabline for vim that's light as air.
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'              " Git diff in the 'gutter'
Plugin 'godlygeek/tabular'                   " Vim script for text filtering and alignment
Plugin 'kien/rainbow_parentheses.vim'        " Better Rainbow Parentheses
Plugin 'honza/vim-snippets'                  " vim-snipmate default snippets vim-snipmate default snippets

Plugin 'scrooloose/nerdcommenter'            "The NERD Commenter: Vim plugin for intensely orgasmic commenting
" \cn -- comment line
" \cc -- comment paragraph
" \cu -- uncomment

Plugin 'easymotion/vim-easymotion'           " Vim motions on speed!
" \\w
" \\f

" Theming
Plugin 'chriskempson/base16-vim'             " Base16 vim theme

" Syntax
Plugin 'rodjek/vim-puppet'                   " Puppet niceities for your Vim setup
Plugin 'chase/vim-ansible-yaml'              " Add additional support for Ansible in Vim
Plugin 'tpope/vim-rails'                     " rails.vim: Ruby on Rails power tools
Plugin 'vim-ruby/vim-ruby'                   " Vim/Ruby Configuration Files
Plugin 'pangloss/vim-javascript'             " Vastly improved Javascript indentation and syntax support in vim
Plugin 'othree/html5.vim'                    " HTML5 omniciomplete and syntax
Plugin 'elzr/vim-json'                       " a better JSON for Vim
Plugin 'Matt-Deacalion/vim-systemd-syntax'   " Syntax highlighting for systemd
Plugin 'PotatoesMaster/i3-vim-syntax'        " Syntax highlighting for i3/config

"
" VUNDLE END (plugins above)
"
call vundle#end()            " required
filetype plugin indent on    " filetype detection[ON] plugin[ON] indent[ON]


" Theming config
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-phd
hi CursorLineNR cterm=bold ctermfg=red    " Set current line number to bold and red

" Remove trailing while space just before save (all files)
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Natural splitting keystrokes (normally ctrl+w h,j,k,l)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Helper commands
command W w
command WQ wq
command Wq wq
command Q q

" Allow write to protected files
" cnoremap sudow w !sudo tee % >/dev/null
cmap w!! w !sudo tee > /dev/null %

" Configure NERDCommenter spacing
let NERDSpaceDelims=1

" Enable touchpad scrolling on iterm2 OS X (requires command below)
" defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true
"set mouse=nicr

" Make enter/return create a new line below and enter INSERT mode
nmap <Enter> o

" Disable auto-commenting on Enter
autocmd BufNewFile,BufRead * setlocal formatoptions-=c
autocmd BufNewFile,BufRead * setlocal formatoptions-=r
autocmd BufNewFile,BufRead * setlocal formatoptions-=o

" Toggle single and double quotes
nmap " cs'"
nmap ' cs"'
