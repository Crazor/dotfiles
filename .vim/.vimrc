"Pathogen (http://github.com/tpope/vim-pathogen)
" Lädt bundles
filetype off
call pathogen#runtime_append_all_bundles('bundles')
call pathogen#helptags()

"Dateityperkennung
filetype plugin indent on

"Nicht VI-kompatibel sein (wozu auch?)
set nocompatible

"Keine Warntöne
set visualbell t_vb=

"Deutsch =)
set helplang=de

"Maus immer an
set mouse=a

"Leader
let mapleader = ","

"Dunklen Hintergrund verwenden
"set background=dark

"set cursorline
"hi cursorline guibg=#333333
"hi CursorColumn guibg=#333333

set viminfo+=!
set viminfo+=n~/.vim/.viminfo

"Automatisch an die letzte Cursorposition springen
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

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
set listchars=tab:>-,trail:-

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

"Search
	"Search Mappings
	"map <space> /
	"map <c-space> ?

	"Search options
	set ignorecase
	set smartcase
	set incsearch
	set hlsearch

"J ein wenig Benehmen beibringen
:set nojoinspaces

"Edit Mappings
cno $h e ~/
cno $d e ~/Desktop/
cno $$ e ./

"Diff Orig
"command! -nargs=0 DiffOrig
      "\\|let g:ShowDifferencesOriginalBuffer=bufnr('%')
      "\\|let DiffFileType=&ft
      "\\|execute 'bufdo setlocal nodiff foldcolumn=0'
      "\\|execute 'buffer' g:ShowDifferencesOriginalBuffer
      "\\|diffthis
      "\\|below vert new
      "\\|let g:ShowDifferencesScratchWindow=winnr()
      "\\|set buftype=nofile noswapfile bufhidden=wipe
      "\\|let &ft=DiffFileType
      "\\|unlet DiffFileType
      "\\|r #
      "\\|1d
      "\\|setlocal noma
      "\\|diffthis
"
 "command! -nargs=0 NoDiffOrig
     "\\|let CurrentWinNr=winnr()
     "\\|execute g:ShowDifferencesScratchWindow 'wincmd w'
     "\\|setlocal nodiff foldcolumn=0
     "\\|close
     "\\|setlocal nodiff foldcolumn=0
     "\\|execute CurrentWinNr 'wincmd w'
     "\\|unlet CurrentWinNr
"
 "func! ToggleDiffOrig()
     "if exists("g:DiffOriginal")
         "NoDiffOrig
         "unlet g:DiffOriginal
     "else
         "DiffOrig
         "let g:DiffOriginal=1
     "endif
 "endfunc


 " map the DiffOrig command to  <leader>do
 " HINT: *d*iff with *o*riginal file
 "map <leader>do :silent! call ToggleDiffOrig()<CR>

"" Mini Buffer Explorer
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplorerMoreThanOne = 0
"let g:miniBufExplModSelTarget = 0
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 25
"let g:miniBufExplSplitBelow=1
"
"map <c-w><c-t> :WMToggle<cr>

"Omnicompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"Zwischen Source und Header umschalten
"map <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

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

"Git-Status in Statuszeile
"Standardwert für statusline fehlt
"Statusline sollte dann immer angezeigt werden
"set statusline+='%{fugitive#statusline()}'

"Protodef-Einstellungen
let protodefprotogetter=$VIM.'bundles/protodef/pullproto.pl'
let disable_protodef_sorting=1

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

"xptemplates mappings
let g:xptemplate_key = '<C-Tab>'
