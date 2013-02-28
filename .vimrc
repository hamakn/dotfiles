set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set nocompatible
syntax enable
filetype plugin indent on

set showmatch
set matchtime=2
set incsearch
set ignorecase
set smartcase
set t_kD=^?
set backspace=indent,eol,start

nnoremap <Space>.  :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>

inoremap <expr> ,df strftime('%Y-%m-%dT%H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

"http://itcweb.cc.affrc.go.jp/affrit/faq/tips/vim-enc
":set encoding=utf-8
":set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
":set fileformats=unix,dos,mac

au QuickfixCmdPost make,grep,grepadd,vimgrep copen

"[vim]vimで、行末のスペースをハイライトさせる設定Add Star
"http://d.hatena.ne.jp/kasahi/20070902/1188744907
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/
