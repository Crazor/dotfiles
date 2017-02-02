"Vundle {{{

"Nicht VI-kompatibel sein (wozu auch?)
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"}}}

"Plugins {{{
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'msanders/cocoa.vim'
Plugin 'Match-Bracket-for-Objective-C'
Plugin 'VHDL-indent-93-syntax'
Plugin 'DoxygenToolkit.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ZoomWin'
Plugin 'camelcasemotion'
Plugin 'taglist.vim'
Plugin 'YankRing.vim'
Plugin 'derekwyatt/vim-protodef'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'VisIncr'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'airblade/vim-gitgutter'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'Lokaltog/powerline'
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
Plugin 'valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/ListToggle'
Plugin 'xu-cheng/brew.vim'

syntax enable
"set background=light
colorscheme solarized
set cursorline
"}}}

"Grundlegende Konfiguration {{{
"Dateityperkennung
filetype plugin indent on

"Keine Warntöne
set visualbell t_vb=

"Deutsch =)
set helplang=de

"Maus immer an
set mouse=a

set viminfo+=!
set viminfo+=n~/.vim/.viminfo

"Erlaube Verstecken von nicht gespeicherten Buffern
set hidden

"Syntax Highlighting
syntax enable

"Wildmenu (Vervollständigung)
set wildmenu

"Unvollständige Kommandos anzeigen
set showcmd

"History-Größe
set history=100

"Fenster rechts und unten öffnen
set splitright
set splitbelow

"minimale Fenstergröße
set winminheight=0
set winminwidth=0

"Änderungen automatisch einlesen
set autoread

"Änderungen an .vimrc beim Speichern übernehmen
autocmd! bufwritepost .vimrc source ~/.vimrc

"Zeilennummern
set number

"Cursorposition anzeigen
set ruler

"Zeilenumbruch
set linebreak
				"8 Maskierte Leerzeichen =)
set showbreak=\ \ \ \ \ \ \ \ 
set cpoptions+=n

"list mode schöner machen
set listchars=tab:>-

"Backspace reparieren
set backspace=indent,eol,start

"Wrapping für Cursor
set whichwrap=b,s,<,>,[,]

"Passende Klammer anzeigen
set showmatch

"Letzte Zeile möglichst vollständig anzeigen
set display=lastline

"Zeilen bis zum Bildschirmrand
set scrolloff=1

"Folding
set foldenable
set foldmethod=marker

"Indentation
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent
set smartindent

"Search options
set ignorecase
set smartcase
set incsearch
set hlsearch

"J ein wenig Benehmen beibringen
set nojoinspaces

"Immer Statuszeile anzeigen
set laststatus=2

"System-Zwischenablage verwenden
set clipboard=unnamed

"Persistant Undo
silent !mkdir -p ~/.vim/undo
set undodir=~/.vim/undo
set undofile

"NetRW
let g:netrw_liststyle=3 "Tree style listing

"}}}

"Autocommands {{{
"Automatisch an die letzte Cursorposition springen
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

"Omnicompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"Highlighting
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

"Whitespaces am Ende einer Zeile anzeigen und löschen
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>
"}}}

"MacVim {{{
function! Fu()
	set fullscreen
	set lines=200
	set columns=300
endfunction
:command! Fu call Fu()

function! Nofu()
	set nofullscreen
	set lines=25
	set columns=95
endfunction
:command! Nofu call Nofu()
"}}}

"Mappings {{{

"Leader
let mapleader = ","
"fswitch mappings
nnoremap <silent> <Leader>of :FSHere<cr>
nnoremap <silent> <Leader>ol :FSRight<cr>
nnoremap <silent> <Leader>oL :FSSplitRight<cr>
nnoremap <silent> <Leader>oh :FSLeft<cr>
nnoremap <silent> <Leader>oH :FSSplitLeft<cr>
nnoremap <silent> <Leader>ok :FSAbove<cr>
nnoremap <silent> <Leader>oK :FSSplitAbove<cr>
nnoremap <silent> <Leader>oj :FSBelow<cr>
nnoremap <silent> <Leader>oJ :FSSplitBelow<cr>

function! Texmap()
	inoremap ö "o
	inoremap ä "a
	inoremap ü "u
	inoremap Ä "A
	inoremap Ö "O
	inoremap Ü "U
	inoremap ß "s
endfunction

function! Untexmap()
	iunmap ö
	iunmap ä
	iunmap ü
	iunmap Ä
	iunmap Ö
	iunmap Ü
	iunmap ß
endfunction
:command! Tex call Texmap()
:command! Untex call Untexmap()

"Wer braucht schon den Ex-Mode?
noremap Q gq

"xptemplates mappings
let g:xptemplate_key = '<C-Tab>'

"Synctex
noremap <Leader>r :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<.pdf %<CR>

"Edit Mappings
cnoremap $h e ~/
cnoremap $d e ~/Desktop/
cnoremap $$ e ./

"Als root schreiben
cnoremap w!! %!sudo tee % > /dev/null

"Bracketed paste mode Unterstützung
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function! XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    noremap <expr> <Esc>[200~ XTermPasteBegin("i")
    inoremap <expr> <Esc>[200~ XTermPasteBegin("")
endif

"noremap <Up> <C-y>
"noremap <Down> <C-e>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

"Space toggles folds
"nnoremap <Space> za

"Move lines up and down
noremap <Leader>j ddp
noremap <Leader>k ddkP

"Kill highlights
noremap <leader>n :nohl<CR>

""Uppercase word
"inoremap <C-u> <Esc>viwgUea
""Lowercase word
"inoremap <C-l> <Esc>viwguea

"}}}

"Plugins {{{

"Keine Klammervervollständigung
let xptemplate_brace_complete=0

"Protodef-Einstellungen
let protodefprotogetter=$VIM.'bundles/protodef/pullproto.pl'
let disable_protodef_sorting=1

"}}}
