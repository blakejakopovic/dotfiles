set nocompatible                " be iMproved, required
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

" https://github.com/junegunn/vim-plug
if !filereadable(expand('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" The NERD TREE: A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fugitive'                  " fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'scrooloose/syntastic'                " Syntastic: syntax checking hacks for vim
Plug 'tpope/vim-surround'                  " SURROUND.VIM: quoting/parenthesizing made simple

" cs<a><b> -- switch quotes/braces (eg. cs'")
" ds<char> -- remove quotes/braces (eg. ds')
" yss)     -- wrap line with () brackets

Plug 'kien/ctrlp.vim'                      " Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder
Plug 'vim-airline/vim-airline'             " vim-airline: Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'              " Git diff in the 'gutter'
Plug 'godlygeek/tabular'                   " Vim script for text filtering and alignment
Plug 'kien/rainbow_parentheses.vim'        " Better Rainbow Parentheses
Plug 'honza/vim-snippets'                  " vim-snipmate default snippets vim-snipmate default snippets

Plug 'scrooloose/nerdcommenter'            "The NERD Commenter: Vim plugin for intensely orgasmic commenting
" \cn -- comment line
" \cc -- comment paragraph
" \cu -- uncomment

Plug 'easymotion/vim-easymotion'           " Vim motions on speed!
" \\w
" \\f

" Theming
Plug 'chriskempson/base16-vim'             " Base16 vim theme

" Syntax
Plug 'rodjek/vim-puppet'                   " Puppet niceities for your Vim setup
Plug 'chase/vim-ansible-yaml'              " Add additional support for Ansible in Vim
Plug 'tpope/vim-rails'                     " rails.vim: Ruby on Rails power tools
Plug 'vim-ruby/vim-ruby'                   " Vim/Ruby Configuration Files
Plug 'pangloss/vim-javascript'             " Vastly improved Javascript indentation and syntax support in vim
Plug 'othree/html5.vim'                    " HTML5 omniciomplete and syntax
Plug 'elzr/vim-json'                       " a better JSON for Vim
Plug 'Matt-Deacalion/vim-systemd-syntax'   " Syntax highlighting for systemd
Plug 'PotatoesMaster/i3-vim-syntax'        " Syntax highlighting for i3/config

call plug#end()

" Theming config
let base16colorspace=256  " Access colors present in 256 colorspace
if filereadable(expand('~/.vim/plugged/base16-vim/colors/base16-phd.vim'))
  colorscheme base16-phd
endif
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
cmap W w
cmap WQ wq
cmap Wq wq
cmap Q q

" Allow write to protected files
" cnoremap sudow w !sudo tee % >/dev/null
cmap w!! w !sudo tee > /dev/null %

" Configure NERDCommenter spacing
let NERDSpaceDelims=1

" Enable touchpad scrolling on iterm2 OS X (requires command below)
" defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true
"set mouse=nicr

" Automatic set paste
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" Make enter/return create a new line below and enter INSERT mode
nmap <Enter> o

" Disable auto-commenting on Enter
autocmd BufNewFile,BufRead * setlocal formatoptions-=c
autocmd BufNewFile,BufRead * setlocal formatoptions-=r
autocmd BufNewFile,BufRead * setlocal formatoptions-=o

" Toggle single and double quotes
nmap " cs'"
nmap ' cs"'
