"Vundle {{{

"Nicht VI-kompatibel sein (wozu auch?)
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"}}}

"Bundles {{{
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'msanders/cocoa.vim'
Bundle 'Zenburn'
Bundle 'Match-Bracket-for-Objective-C'
Bundle 'VHDL-indent-93-syntax'
Bundle 'DoxygenToolkit.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Highlight-UnMatched-Brackets'
Bundle 'ZoomWin'
Bundle 'camelcasemotion'
Bundle 'taglist.vim'
Bundle 'YankRing.vim'
Bundle 'ewiplayer/vim-protodef'
Bundle 'ewiplayer/vim-fswitch'
Bundle 'xptemplate'
Bundle 'VisIncr'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'Conque-Shell'
Bundle 'sjl/gundo.vim'
Bundle 'Lokaltog/vim-easymotion'
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


"Farben {{{
"Dunklen Hintergrund verwenden
set background=dark

set cursorline
hi cursorline guibg=#333333
hi CursorColumn guibg=#333333
"}}}

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
:set nojoinspaces

"Status in Statuszeile
if has('statusline')
  set statusline=%<%f\ 
  set statusline+=%w%h%m%r 
  set statusline+=%{fugitive#statusline()}
  set statusline+=\ [%{&ff}/%Y]  
  set statusline+=\ [%{getcwd()}]
  set statusline+=%=%-14.(Line:\ %l\ of\ %L\ [%p%%]\ -\ Col:\ %c%V%)
endif

"Immer Statuszeile anzeigen
set laststatus=2

"System-Zwischenablage verwenden
set clipboard=unnamed

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
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>
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
nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>ol :FSRight<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>
nmap <silent> <Leader>oh :FSLeft<cr>
nmap <silent> <Leader>oH :FSSplitLeft<cr>
nmap <silent> <Leader>ok :FSAbove<cr>
nmap <silent> <Leader>oK :FSSplitAbove<cr>
nmap <silent> <Leader>oj :FSBelow<cr>
nmap <silent> <Leader>oJ :FSSplitBelow<cr>

function! Texmap()
	imap ö "o
	imap ä "a
	imap ü "u
	imap Ä "A
	imap Ö "O
	imap Ü "U
	imap ß "s
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
map Q gq

"xptemplates mappings
let g:xptemplate_key = '<C-Tab>'

"Synctex
map <Leader>r :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<.pdf %<CR>

"Edit Mappings
cno $h e ~/
cno $d e ~/Desktop/
cno $$ e ./

"Als root schreiben
cmap w!! %!sudo tee % > /dev/null

"Bracketed paste mode Unterstützung
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
endif

"}}}

"Plugins {{{

"Keine Klammervervollständigung
let xptemplate_brace_complete=0

"Protodef-Einstellungen
let protodefprotogetter=$VIM.'bundles/protodef/pullproto.pl'
let disable_protodef_sorting=1

"}}}
