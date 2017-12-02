" Basics
set nocompatible        " Must be first line
if !WINDOWS()
	set shell=/bin/sh
	if ANDROID()
		set shell=/system/bin/sh
	endif
endif

" Disable fsync under macOS, for it wont work on NTFS
if OSX()
    set nofsync
endif

" Arrow Key Fix
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
	inoremap <silent> <C-[>OC <RIGHT>
endif

" TODO: expand XDG specs for all the OSes
"let xdg_config = expand('<sfile>:p:h')