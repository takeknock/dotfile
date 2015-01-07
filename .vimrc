"http://cpplover.blogspot.jp/2013/12/neobundlevim.html
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
"Vimを使ってくれてありがとうを表示しない
set notitle

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" GitHubリポジトリにあるプラグインを利用する
" --> NeoBundle 'USER/REPOSITORY-NAME'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'davidoc/taskpaper.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'altercation/vim-colors-solarized'
"git
NeoBundle 'tpope/vim-fugitive'
"Emmet(zen-coding)
NeoBundle 'mattn/emmet-vim' 
"TwitVim
NeoBundle 'vim-scripts/TwitVim'
let twitvim_browser_cmd = 'open' " for Mac
let twitvim_force_ssl = 1 
let twitvim_count = 40
"インデント
"NeoBundle 'rhysd/vim-clang-format'

"GitHub以外のGitリポジトリにあるプラグインを利用する
NeoBundle 'git://git.wincent.com/command-t.git'

" vim-scripts リポジトリにあるプラグインを利用する
NeoBundle 'surround.vim'

"Git以外のリポジトリにあるプラグインを利用する
NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
"バッファ実行
NeoBundle 'thinca/vim-quickrun'

" コメントアウト
NeoBundle "tyru/caw.vim"



" 汎用的なコード補完プラグイン
" +lua な環境であれば neocomplete.vim を利用する
if has("lua")
	NeoBundle "Shougo/neocomplete.vim"
else
	NeoBundle "Shougo/neocomplcache"
endif

" スニペット
NeoBundle "Shougo/neosnippet.vim"
NeoBundle "Shougo/neosnippet-snippets"


" アウトラインの出力
NeoBundle "Shougo/unite-outline"

" wandbox
NeoBundle "rhysd/wandbox-vim"

" コード補完
NeoBundle "osyo-manga/vim-marching"


NeoBundle "jceb/vim-hier"

" quickfix の該当箇所の内容をコマンドラインに出力
NeoBundle "dannyob/quickfixstatus"
"
" シンタックスチェッカー
" NeoBundle "osyo-manga/vim-watchdogs"
NeoBundle "osyo-manga/shabadou.vim"


" ハイライト
NeoBundle "t9md/vim-quickhl"

"vim-latex
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'

" add plugins
filetype plugin on

NeoBundleCheck

"no files created
:set noundofile
:set nobackup


"インデント
set cinoptions+=:0,g0
NeoBundleLazy 'rhysd/vim-clang-format', {
			\ 'autoload' : {'filetypes' : ['c', 'cpp', 'objc']}
			\ }
let g:clang_format#style_options = {
			\ 'AccessModifierOffset' : -4,
			\ 'AllowShortIfStatementsOnASingleLine' : 'true',
			\ 'AlwaysBreakTemplateDeclarations' : 'true',
			\ 'Standard' : 'C++11',
			\ 'BreakBeforeBraces' : 'Stroustrup',
			\ }
"タブ文字の長さ
setlocal tabstop=3
setlocal shiftwidth=3

" 空白文字ではなくてタブ文字を使用する
"setlocal noexpandtab
set expandtab
set tabstop=2


"http://d.hatena.ne.jp/osyo-manga/20131219/1387465034
" Vim で C++ の設定例

" filetype=cpp が設定された時に呼ばれる関数
"Vim で C++ の設定を行う場合はこの関数内で記述する
" ここで設定する項目は各自好きに行って下さい
function! s:cpp()
	" インクルードパスを設定する
	" gf などでヘッダーファイルを開きたい場合に影響する
	setlocal path+=D:/home/cpp/boost,D:/home/cpp/sprout


	" 括弧を構成する設定に <> を追加する
	" template<> を多用するのであれば
	setlocal matchpairs+=<:>

	"
	" 最後に定義された include 箇所へ移動してを挿入モードへ
	nnoremap <buffer><silent> <Space>ii :execute "?".&include<CR> :noh<CR> o

	NeoBundleLazy 'vim-jp/cpp-vim', {
				\ 'autoload' : {'filetypes' : 'cpp'}
				\ }

	" BOOST_PP_XXX 等のハイライトを行う
	syntax match boost_pp /BOOST_PP_[A-z0-9_]*/
	highlight link boost_pp cppStatement

	" quickrun.vim の設定
	"let b:quickrun_config = {
	"			\		"hook/add_include_option/enable" : 1
	"			\	}

	"if exists("*CppVimrcOnFileType_cpp")
	"	call CppVimrcOnFileType_cpp()
	"endif
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

"NeoBundleLazy 'taka84u9/vim-ref-ri', {
"			\ 'depends': ['Shougo/unite.vim', 'thinca/vim-ref'],
"			\ 'autoload': { 'filetypes': g:my.ft.ruby_files } }

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

function! ExecuteCurrentFile()
	if &filetype == 'php' || &filetype == 'ruby'
		execute '!' . &filetype . ' %'
	endif
endfunction
noremap <Space> :call ExecuteCurrentFile()<CR>

"https://github.com/osyo-manga/cpp-vimrc/blob/master/vimrcより
" プラグインの設定
" これはプラグインが読み込まれた場合に有効になる

" caw.vim
let s:hooks = neobundle#get_hooks("caw.vim")
function! s:hooks.on_source(bundle)
	" コメントアウトを切り替えるマッピング
	" <leader>c でカーソル行をコメントアウト
	" 再度 <leader>c でコメントアウトを解除
	" 選択してから複数行の <leader>c も可能
	nmap <leader>c <Plug>(caw:I:toggle)
	vmap <leader>c <Plug>(caw:I:toggle)

	" <leader>C でコメントアウトを解除
	nmap <Leader>C <Plug>(caw:I:uncomment)
	vmap <Leader>C <Plug>(caw:I:uncomment)

endfunction
unlet s:hooks


" neocomplet.vim
let s:hooks = neobundle#get_hooks("neocomplete.vim")
function! s:hooks.on_source(bundle)
	" 補完を有効にする
	let g:neocomplete#enable_at_startup = 1

	" 補完に時間がかかってもスキップしない
	let g:neocomplete#skip_auto_completion_time = ""
endfunction
unlet s:hooks


" neocomplcache
let s:hooks = neobundle#get_hooks("neocomplcache")
function! s:hooks.on_source(bundle)
	" 補完を有効にする
	let g:neocomplcache_enable_at_startup=1
endfunction
unlet s:hooks


" quickfixstatus
let s:hooks = neobundle#get_hooks("quickfixstatus")
function! s:hooks.on_post_source(bundle)
	QuickfixStatusEnable
endfunction
unlet s:hooks


" vim-quickhl
let s:hooks = neobundle#get_hooks("vim-quickhl")
function! s:hooks.on_source(bundle)
	" <Space>m でカーソル下の単語、もしくは選択した範囲のハイライトを行う
	" 再度 <Space>m を行うとカーソル下のハイライトを解除する
	" これは複数の単語のハイライトを行う事もできる
	" <Space>M で全てのハイライトを解除する
	nmap <Space>m <Plug>(quickhl-manual-this)
	xmap <Space>m <Plug>(quickhl-manual-this)
	nmap <Space>M <Plug>(quickhl-manual-reset)
	xmap <Space>M <Plug>(quickhl-manual-reset)
endfunction
unlet s:hooks


" neosnippet.vim
let s:hooks = neobundle#get_hooks("neosnippet.vim")
function! s:hooks.on_source(bundle)
	" スニペットを展開するキーマッピング
	" <Tab> で選択されているスニペットの展開を行う
	" 選択されている候補がスニペットであれば展開し、
	" それ以外であれば次の候補を選択する
	" また、既にスニペットが展開されている場合は次のマークへと移動する
	imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
				\ "\<Plug>(neosnippet_expand_or_jump)"
				\: pumvisible() ? "\<C-n>" : "\<TAB>"
	smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
				\ "\<Plug>(neosnippet_expand_or_jump)"
				\: "\<TAB>"

	let g:neosnippet#snippets_directory = "~/.neosnippet"

	" 現在の filetype のスニペットを編集する為のキーマッピング
	" こうしておくことでサッと編集や追加などを行うことができる
	" 以下の設定では新しいタブでスニペットファイルを開く
	nnoremap <Space>ns :execute "tabnew\|:NeoSnippetEdit ".&filetype<CR>
endfunction
unlet s:hooks


" marching.vim
let s:hooks = neobundle#get_hooks("vim-marching")
function! s:hooks.on_post_source(bundle)
	if !empty(g:marching_clang_command) && executable(g:marching_clang_command)
		" 非同期ではなくて同期処理で補完する
		let g:marching_backend = "sync_clang_command"
	else
		" clang コマンドが実行できなければ wandbox を使用する
		let g:marching_backend = "wandbox"
		let g:marching_clang_command = ""
	endif

	" オプションの設定
	" これは clang のコマンドに渡される
	let g:marching#clang_command#options = {
				\	"cpp" : "-std=gnu++1y"
				\}


	if !neobundle#is_sourced("neocomplete.vim")
		return
	endif

	" neocomplete.vim と併用して使用する場合
	" neocomplete.vim を使用すれば自動補完になる
	let g:marching_enable_neocomplete = 1

	if !exists('g:neocomplete#force_omni_input_patterns')
		let g:neocomplete#force_omni_input_patterns = {}
	endif

	let g:neocomplete#force_omni_input_patterns.cpp =
				\ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
endfunction
unlet s:hooks


" quickrun.vim
"let s:hooks = neobundle#get_hooks("vim-quickrun")
"function! s:hooks.on_source(bundle)
"	let g:quickrun_config = {
"\		"_" : {
"\			"runner" : "vimproc",
"\			"runner/vimproc/sleep" : 10,
"\			"runner/vimproc/updatetime" : 500,
"\			"outputter" : "error",
"\			"outputter/error/success" : "buffer",
"\			"outputter/error/error"   : "quickfix",
"\			"outputter/quickfix/open_cmd" : "copen",
"\			"outputter/buffer/split" : ":botright 8sp",
"\		},
"\
"\		"cpp/wandbox" : {
"\			"runner" : "wandbox",
"\			"runner/wandbox/compiler" : "clang-head",
"\			"runner/wandbox/options" : "warning,c++1y,boost-1.55",
"\		},
"\
"\		"cpp/g++" : {
"\			"cmdopt" : "-std=c++0x -Wall",
"\		},
"\
"\		"cpp/clang++" : {
"\			"cmdopt" : "-std=c++0x -Wall",
"\		},
"\
"\		"cpp/watchdogs_checker" : {
"\			"type" : "watchdogs_checker/clang++",
"\		},
"\	
"\		"watchdogs_checker/_" : {
"\			"outputter/quickfix/open_cmd" : "",
"\		},
"\	
"\		"watchdogs_checker/g++" : {
"\			"cmdopt" : "-Wall",
"\		},
"\	
"\		"watchdogs_checker/clang++" : {
"\			"cmdopt" : "-Wall",
"\		},
"\	}
"
"	let s:hook = {
"	\	"name" : "add_include_option",
"	\	"kind" : "hook",
"	\	"config" : {
"	\		"option_format" : "-I%s"
"	\	},
"	\}
"
"	function! s:hook.on_normalized(session, context)
"		" filetype==cpp 以外は設定しない
"		if &filetype !=# "cpp"
"			return
"		endif
"		let paths = filter(split(&path, ","), "len(v:val) && v:val !='.' && v:val !~ $VIM_CPP_STDLIB")
"		
"		if len(paths)
"			let a:session.config.cmdopt .= " " . join(map(paths, "printf(self.config.option_format, v:val)")) . " "
"		endif
"	endfunction
"
"	call quickrun#module#register(s:hook, 1)
"	unlet s:hook
"
"
"	let s:hook = {
"	\	"name" : "clear_quickfix",
"	\	"kind" : "hook",
"	\}
"
"	function! s:hook.on_normalized(session, context)
"		call setqflist([])
"	endfunction
"
"	call quickrun#module#register(s:hook, 1)
"	unlet s:hook
"
"endfunction
"unlet s:hooks


" vim-watchdogs
let s:hooks = neobundle#get_hooks("vim-watchdogs")
function! s:hooks.on_source(bundle)
	let g:watchdogs_check_BufWritePost_enable = 1
endfunction
unlet s:hooks



if exists("*CppVimrcOnPrePlugin")
	call CppVimrcOnPrePlugin()
endif


call neobundle#call_hook('on_source')



if exists("*CppVimrcOnFinish")
	call CppVimrcOnFinish()
endif



augroup vimrc-cpp
	autocmd!
	" filetype=cpp が設定された場合に関数を呼ぶ
	autocmd FileType cpp call s:cpp()
augroup END

"vim-latex setting
let tex_flavor='latex'
set grepprg=grep\ -nH\ $*
set shellslash
let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_CompileRule_dvi='platex -d --interaction=nonstopmode $*'
let g:Tex_CompileRule_dvi='uplatex -sntax=1 --interaction=nonstopmode -file-line-error-style $*'
let g:Tex_FormatDependency_pdf='dvi,pdf'

let g:Tex_ViewRule_pdf='open -a Preview.app'

let g:Tex_IgnoredWarnings = 
    \"Underfull\n".
    \"Overfull\n".
    \"specifier changed to\n".
    \"You have requested\n".
    \"Missing number, treated as zero.\n".
    \"There were undefined references\n".
    \"Citation %.%# undefined\n".
    \"LaTeX Font Warning: Font shape `%s' undefined\n".
    \"LaTeX Font Warning: Some font shapes were not available, defaults substituted."
