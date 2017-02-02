"Toolbar ausschalten
set guioptions-=T

"Keine Scrollbars
set guioptions-=r
set guioptions-=L

"Standardgröße
set columns=95
set lines=25

"Schriftart
if has("gui_macvim")
	set guifont=Hack:h12
else
	set guifont=Hack 8
endif

"Tabs immer anzeigen
set showtabline=2

"MacVim
if has("gui_macvim")
	let macvim_skip_cmd_opt_movement = 1
	set fuoptions+=maxhorz
endif
