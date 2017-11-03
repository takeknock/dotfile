set number

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

" for Python
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'kevinw/pyflakes-vim'
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
