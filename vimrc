runtime! debian.vim
syntax on
set background=dark
if has("autocmd")
  filetype plugin indent on
endif
set et
set sw=4
set ts=4
set modeline modelines=5
au BufRead,BufNewFile *.go set filetype=go

" Projects using tabs
au BufRead,BufNewFile /home/ema/dev/context-booster/* setl noet

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
