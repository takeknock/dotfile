set number

set tabstop=4
"set expandtab
"set smarttab
set shiftwidth=4
"set foldmethod=indent


if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/takeknock/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/takeknock/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/unite-outline'

" for Python
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'kevinw/pyflakes-vim'
NeoBundle 'rkulla/pydiction'
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:jedi#completions_command = "<C-Space>"
let g:jedi#goto_assignments_command = "<C-g>"
let g:jedi#goto_definitions_command = "<C-d>"
let g:jedi#documentation_command = "<C-k>"

"NeoBuldle 'nvie/vim-flake8'

" for Indent Line
NeoBundle 'nathanaelkane/vim-indent-guides'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"jedi
