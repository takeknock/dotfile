"http://vimblog.hatenablog.com/entry/vimrc_plugin_management
" NeoBundle がインストールされていない時、
" もしくは、プラグインの初期化に失敗した時の処理
function! s:WithoutBundles()
  colorscheme desert
  " その他の処理
endfunction

" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()
  " 読み込むプラグインの指定
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'tpope/vim-surround'
  " ...
  " 読み込んだプラグインの設定
  " ...
endfunction

" NeoBundle がインストールされているなら LoadBundles() を呼び出す
" そうでないなら WithoutBundles() を呼び出す
function! s:InitNeoBundle()
  if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
     filetype plugin indent off
     if has('vim_starting')
        set runtimepath+=~/.vim/bundle/neobundle.vim/
     endif
     try
        call neobundle#rc(expand('~/.vim/bundle/'))
        call s:LoadBundles()
     catch
        call s:WithoutBundles()
     endtry 
   else
     cal s:WithoutBundles()
   endif

   filetype indent plugin on
   syntax on
endfunction

call s:InitNeoBundle()

" GitHubリポジトリにあるプラグインを利用する
" --> NeoBundle 'USER/REPOSITORY-NAME'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'davidoc/taskpaper.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'altercation/vim-colors-solarized'

"GitHub以外のGitリポジトリにあるプラグインを利用する
NeoBundle 'git://git.wincent.com/command-t.git'

" vim-scripts リポジトリにあるプラグインを利用する
NeoBundle 'surround.vim'

"Git以外のリポジトリにあるプラグインを利用する
NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'


"http://d.hatena.ne.jp/osyo-manga/20131219/1387465034
" Vim で C++ の設定例

" filetype=cpp が設定された時に呼ばれる関数
"Vim で C++ の設定を行う場合はこの関数内で記述する
" ここで設定する項目は各自好きに行って下さい
function! s:cpp()
    " インクルードパスを設定する
    " gf などでヘッダーファイルを開きたい場合に影響する
    setlocal path+=D:/home/cpp/boost,D:/home/cpp/sprout

    "タブ文字の長さ
    setlocal tabstop=4
    setlocal shiftwidth=4

    " 空白文字ではなくてタブ文字を使用する
    setlocal noexpandtab

    " 括弧を構成する設定に <> を追加する
    " template<> を多用するのであれば
    setlocal matchpairs+=<:>

    " 最後に定義された include 箇所へ移動してを挿入モードへ
    nnoremap <buffer><silent> <Space>ii :execute "?".&include<CR> :noh<CR> o

    " BOOST_PP_XXX 等のハイライトを行う
    syntax match boost_pp /BOOST_PP_[A-z0-9_]*/
    highlight link boost_pp cppStatement
endfunction
