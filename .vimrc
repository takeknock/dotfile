"http://cpplover.blogspot.jp/2013/12/neobundlevim.html
if has('vim_starting')
	  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" GitHubリポジトリにあるプラグインを利用する
" --> NeoBundle 'USER/REPOSITORY-NAME'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'davidoc/taskpaper.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/neocomplete.vim'
"git
NeoBundle 'tpope/vim-fugitive'

"GitHub以外のGitリポジトリにあるプラグインを利用する
NeoBundle 'git://git.wincent.com/command-t.git'

" vim-scripts リポジトリにあるプラグインを利用する
NeoBundle 'surround.vim'

"Git以外のリポジトリにあるプラグインを利用する
NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
"バッファ実行
NeoBundle 'thinca/vim-quickrun'


" add plugins
filetype plugin on

NeoBundleCheck

"no files created
:set noundofile
:set nobackup

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

    NeoBundleLazy 'vim-jp/cpp-vim', {
                \ 'autoload' : {'filetypes' : 'cpp'}
                \ }
    "文脈を考慮した賢い補完
    "（http://rhysd.hatenablog.com/entry/2013/12/10/233201#neosnippet）
    "if !exists('g:neocomplete#force_omni_input_patterns')
"	    let g:neocomplete#force_omni_input_patterns = {}
 "   endif
  "  let g:neocomplete#force_omni_input_patterns.cpp =
   "         \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

endfunction

"ruby setting(http://qiita.com/alpaca_taichou/items/ab2ad83ddbaf2f6ce7fb)
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
 
if has("lua")
	  NeoBundleLazy 'Shougo/neocomplete', { 'autoload' : {
	          \   'insert' : 1,
	          \ }}
  endif
   
  NeoBundleLazy 'Shougo/neosnippet', {
        \ 'autoload' : {
        \   'commands' : ['NeoSnippetEdit', 'NeoSnippetSource'],
        \   'filetypes' : 'snippet',
        \   'insert' : 1,
        \   'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
        \ }}
   
  NeoBundle 'tpope/vim-rails', { 'autoload' : {
        \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}
   
  NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
        \ 'autoload' : {
        \   'insert' : 1,
        \ }}
   
  NeoBundleLazy 'edsono/vim-matchit', { 'autoload' : {
        \ 'filetypes': 'ruby',
        \ 'mappings' : ['nx', '%'] }}
   
  NeoBundleLazy 'basyura/unite-rails', {
        \ 'depends' : 'Shougo/unite.vim',
        \ 'autoload' : {
        \   'unite_sources' : [
        \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
        \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
        \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
        \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
        \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
        \     'rails/stylesheet', 'rails/view'
        \   ]
        \ }}
   
  NeoBundleLazy 'taka84u9/vim-ref-ri', {
        \ 'depends': ['Shougo/unite.vim', 'thinca/vim-ref'],
        \ 'autoload': { 'filetypes': g:my.ft.ruby_files } }
   
  NeoBundleLazy 'alpaca-tc/neorspec.vim', {
        \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
        \ 'autoload' : {
        \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
        \ }}
   
  NeoBundleLazy 'alpaca-tc/alpaca_tags', {
        \ 'depends': 'Shougo/vimproc',
        \ 'autoload' : {
        \   'commands': ['TagsUpdate', 'TagsSet', 'TagsBundle']
        \ }}
   
  NeoBundleLazy 'tsukkee/unite-tag', {
        \ 'depends' : ['Shougo/unite.vim'],
        \ 'autoload' : {
        \   'unite_sources' : ['tag', 'tag/file', 'tag/include']
        \ }}
