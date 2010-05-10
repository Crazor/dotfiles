"Farbschema
:let g:zenburn_high_Contrast = 1
:colorscheme zenburn
:hi search ctermbg=223 ctermfg=238
:hi incsearch ctermbg=216 ctermfg=242

"Transparenz
set transparency=1

"Toolbar ausschalten
set guioptions-=T

"Keine Scrollbars
set guioptions-=r
set guioptions-=L

"Standardgröße
set columns=95
set lines=25

set cursorline
hi cursorline guibg=#282828
"hi CursorColumn guibg=#333333

"Schriftart
set guifont=DejaVu\ Sans\ Mono:h10

"Tabs immer anzeigen
set showtabline=2

"MacVim
if has("gui_macvim")
	let macvim_skip_cmd_opt_movement = 1
	set fuoptions+=maxhorz
endif
