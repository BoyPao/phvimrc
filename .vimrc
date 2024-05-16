" License: GPL-3.0-or-later
"
" Vim config under PH style
"
" Copyright (c) 2021 Peng Hao <635945005@qq.com>

"==============================================================================
" Common setting
"==============================================================================
" Enable file type detect on vim
filetype on
" Enable plugins according to filetype
filetype plugin on
" Enable indents according to filetype
filetype indent on
" highlight depends on syntax of filetype
syntax on
" Set leader key
let g:mapleader = ","
" Try to config persistent undo
try
	if MySys() == "windows"
		set undodir=C:\Windows\Temp
	else
		set undodir=~/.vim/undo_cache
	endif
	set undofile
catch
endtry

"==============================================================================
" Key map
"==============================================================================
" A map for vim config debug
nnoremap <Leader>dd :call DebugVim('0')<CR>
"------------------------------------------------------------------------------
" BufferControls:
"------------------------------------------------------------------------------
" New buffer vertically
nnoremap vv :vsplit<CR>
" New buffer horizontally
nnoremap hh :split<CR>
" close current buffer
nnoremap qq :bd<CR>
" Use ww replace buffer control
nnoremap ww <C-W>
if version >= 800
	" Keep same buffer control method in terminal
	tnoremap ww <C-W>
	" Exit terminal method
	tnoremap qq exit<CR>
	" Enter normal mode in terminal
	tnoremap <C-n> <C-W>N<CR>
endif
" Turn order of buffers towards right side
nnoremap tt <C-w>r
" Change window width
nnoremap << 5<C-w><
nnoremap >> 5<C-w>>
" Change window height
nnoremap ++ 5<C-w>+
nnoremap -- 5<C-w>-
" Switch between buffers
nnoremap .. :bnext<CR>
nnoremap ,, :bprevious<CR>
"------------------------------------------------------------------------------
" FunctionalWindows:
"------------------------------------------------------------------------------
" Open/close Tlist
nnoremap ll :TlistToggle<CR>
" Open /close NERDTree
nnoremap kk :NERDTreeToggle<CR>
" Open/close MiniBufExp
nnoremap oo :TMiniBufExplorer<CR>
" Open/close BufExplorer
nnoremap <Leader>kk :BufExplorerVerticalSplit<CR>
" Cope use quickfix to show make info in vim
nnoremap <Leader>co :botright cope<CR>
nnoremap <Leader>cn :cn<CR>
nnoremap <Leader>cp :cp<CR>
" ConqueTerm can add a window to show shell result in vim
nnoremap <C-p> :vertical rightbelow terminal<CR>
nnoremap <C-o> :terminal<CR>
" On/off cscopequickfix
nnoremap <Leader>cq :Cacequickfixtrigger<CR>
"------------------------------------------------------------------------------
" Reading:
"------------------------------------------------------------------------------
" Cancel highlight in current search
nnoremap <silent> <Leader><CR> :noh<CR>
nnoremap <silent> <Leader>cc :call ColorColumnSwitch()<CR>
" Show line number or not
nnoremap <silent>22 :call SwitchNumShow()<CR>
" Switch Tab num
nnoremap <silent>33 :call SwitchTabNum()<CR>
" Open/close spell checking
nnoremap <Leader>ss :setlocal spell!<CR>
" Spell checking jumpment
nnoremap <Leader>sn ]s
nnoremap <Leader>sp [s
nnoremap <Leader>sa zg
nnoremap <Leader>s? z=
" Tab configuration
nnoremap <Leader>te :tabedit
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tm :tabmove
nnoremap <Leader>tn :tabnext<CR>
" When pressing <Leader>cd switch to the directory of the open buffer
nnoremap <Leader>cd :cd %:p:h<CR>
" use n/N/<Leader>g to search current selection in visual mode
vnoremap <silent> <Leader>zt y:call VisualSearch('vg')<CR>
vnoremap <silent> n y:call VisualSearch('f')<CR>
vnoremap <silent> N y:call VisualSearch('b')<CR>
" MHL maps
" trigger match highlight
nnoremap <silent> <Leader>m :MhlTriggerMatch<CR>
" clear all match highlight
nnoremap <silent> <Leader>n :MhlClearAllMatch<CR>
" CACE maps
" Auto generate/update DB
nnoremap <silent> <C-@> :Caceupdate<CR>
" find definiation
nnoremap <silent> zg :Cacefind g <C-R>=expand("<cword>")<CR><CR>
" find who calls
nnoremap <silent> zc :Cacefind c <C-R>=expand("<cword>")<CR><CR>
" find text
nnoremap <silent> zt :Cacefind t <C-R>=expand("<cword>")<CR><CR>
" find symble
nnoremap <silent> zs :Cacefind s <C-R>=expand("<cword>")<CR><CR>
" find who is called by selected
nnoremap <silent> zd :Cacefind d <C-R>=expand("<cword>")<CR><CR>
" metch with egrep mode
nnoremap <silent> ze :Cacefind e <C-R>=expand("<cword>")<CR><CR>
" find and open target file
nnoremap <silent> zf :Cacefind f <C-R>=expand("<cfile>")<CR><CR>
" find who include target file
nnoremap <silent> zi :Cacefind i <C-R>=expand("<cfile>")<CR><CR>
" find where this symbol is assigned value
nnoremap <silent> za :Cacefind a <C-R>=expand("<cword>")<CR><CR>
" Cace grep
nnoremap <silent> <Leader>zt :Cacegrep <C-R>=expand("<cword>")<CR><CR>
"------------------------------------------------------------------------------
" Edition:
"------------------------------------------------------------------------------
"F7 comment selected lines
vnoremap <F7> :s=^\(//\)*=//=g<CR>:noh<CR>
nnoremap <F7> :s=^\(//\)*=//=g<CR>:noh<CR>
inoremap <F7> <Esc>:s=^\(//\)*=//=g<CR>:noh<CR>
vnoremap <F7># :s=^\(#\)*=#=g<CR>:noh<CR>
nnoremap <F7># :s=^\(#\)*=#=g<CR>:noh<CR>
inoremap <F7># <Esc>:s=^\(#\)*=#=g<CR>:noh<CR>
vnoremap <F7>" :s=^\("\)*="=g<CR>:noh<CR>
nnoremap <F7>" :s=^\("\)*="=g<CR>:noh<CR>
inoremap <F7>" <Esc>:s=^\("\)*="=g<CR>:noh<CR>
"F6 Uncomment selected lines
vnoremap <F6> :s=^\(//\)*==g<CR>:noh<CR>
nnoremap <F6> :s=^\(//\)*==g<CR>:noh<CR>
inoremap <F6> <Esc>:s=^\(//\)*==g<CR>:noh<CR>
vnoremap <F6># :s=^\(#\)*==g<CR>:noh<CR>
nnoremap <F6># :s=^\(#\)*==g<CR>:noh<CR>
inoremap <F6># <Esc>:s=^\(#\)*==g<CR>:noh<CR>
vnoremap <F6>" :s=^\("\)*==g<CR>:noh<CR>
nnoremap <F6>" :s=^\("\)*==g<CR>:noh<CR>
inoremap <F6>" <Esc>:s=^\("\)*==g<CR>:noh<CR>
" Repeat to replace word in cursor line
nnoremap <Leader>rr :call RepeatOneLineReplace("<C-R>=expand("<cword>")<CR>")<CR>
" Delete white space
nnoremap ds :%s/\s\+$//g<CR>
" Delete ^M(\r) from windows
nnoremap dm :%s///g<CR>
" Use vim to check diff within two windows
nnoremap dt :diffthis<CR>
" update diff
nnoremap du :diffupdate<CR>
" Use TAB or Ctl+I to switch mouse copy on/off
nnoremap <C-I> :call SwitchMouseState()<CR>
" Fast editing of the .vimrc
nnoremap <Leader>vv :e! ~/.vimrc<CR>
" Open/close paste mode
nnoremap <Leader>pp :call SwitchPasteMode()<CR>
" Use Tab & S-Tab to complete
inoremap <silent> <Tab> <C-R>=CleverTabForCompletion(0)<CR>
inoremap <silent> <S-Tab> <C-R>=CleverTabForCompletion(1)<CR>
" Forbid Up & Down in popup menu
inoremap <Down> <C-R>=pumvisible() ? "\<lt>C-Y>\<lt>Down>" : "\<lt>Down>"<CR>
inoremap <Up> <C-R>=pumvisible() ? "\<lt>C-Y>\<lt>Up>" : "\<lt>Up>"<CR>
inoremap <Enter> <C-R>=pumvisible() ? "\<lt>C-Y>" : "\<lt>Enter>"<CR>

"==============================================================================
" Word map
"==============================================================================
" Insert ctime and press Enter, ctime will be replaced by current time
iabbrev ctime <C-R>=strftime("%y/%m/%d/ %H:%M")<CR>

"==============================================================================
" CMD map
"==============================================================================
" Use vimgrep for string search
cnoremap ,rr .,.s/<C-R>=expand("<cword>")<CR>//g <left><left><left>

"==============================================================================
" Auto CMD
"==============================================================================
if has("autocmd")
	" Set vim jump to the last position when reopening a file
	autocmd BufReadPost *
				\ if line("'\"") > 1 && line("'\"") <= line("$") |
				\   exe "normal g`\"" |
				\ endif
	" When vimrc is edited, reload it
	autocmd! bufwritepost $MYVIMRC source $MYVIMRC
	" Delete witespace while saving file
	autocmd BufWrite * :call DeleteTrailingWS()
	" Exit Vim if NERDTree is the only window remaining in the only tab.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
	" Close the tab if NERDTree is the only window remaining in it.
	autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
endif

"==============================================================================
" Functions
"==============================================================================
func! DeleteTrailingWS()
	%s/\s\+$//ge
endfunc

let g:tabNum = 4
function! SwitchTabNum()
	if g:tabNum == 4
		let g:tabNum = 8
		set list
	elseif g:tabNum == 8
		let g:tabNum = 4
		set nolist
	endif
	exe 'set shiftwidth=' . g:tabNum
	exe 'set tabstop=' . g:tabNum
	exe 'set softtabstop=' . g:tabNum
	echohl PreCondit | echo " Tab: " g:tabNum | echohl None
endfunction

let g:numShowState="ON"
function! SwitchNumShow()
	if g:numShowState=="ON"
		let g:numShowState="OFF"
		set nonu
	elseif g:numShowState=="OFF"
		let g:numShowState="ON"
		set nu
	endif
endfunction

let g:mouseCopy="OFF"
function! SwitchMouseState()
	if g:mouseCopy=="ON"
		let g:mouseCopy="OFF"
		set mouse=n
	elseif g:mouseCopy=="OFF"
		let g:mouseCopy="ON"
		set mouse=
	endif
	echohl PreCondit | echo " mouse copy: " g:mouseCopy | echohl None
endfunction

let g:pasteState="OFF"
function! SwitchPasteMode()
	if g:pasteState=="ON"
		let g:pasteState="OFF"
		setlocal nopaste
	elseif g:pasteState=="OFF"
		let g:pasteState="ON"
		setlocal paste
	endif
	echohl PreCondit | echo " paste mode: " g:pasteState | echohl None
endfunction

function! RepeatOneLineReplace(cword)
	let v:errmsg = ""
	if strpart(@:,0,5)==".,.s/"
		if a:cword != @/
			exe "normal! n"
		endif
		if v:errmsg != ""
			return v:errmsg
		end
		exe @:
		echo ":" . @:
	endif
endfunction

function! ColorColumnSwitch ()
	if &cc == 80
		set cc=0
	else
		set cc=80
	endif
endfunction

function! VisualSearch(direction)
	let reg = @0
	if a:direction == 'vg'
		exe "Cacegrep " . reg
	else
		if a:direction == 'b'
			exe "normal ?" . reg . "\n"
		elseif a:direction == 'f'
			exe "normal /" . reg . "\n"
		endif
		let @/ = reg
	endif
endfunction

function! CleverTabForCompletion(direction)
	if pumvisible()
		if a:direction==0
			return "\<C-N>"
		else
			return "\<C-P>"
		endif
	else
		if a:direction==0
			return "\<Tab>"
		else
			return "\<S-Tab>"
		endif
	endif
endfunction

function! SetColorScheme(dir, cs)
	if !empty(matchstr(&rtp, a:dir))
		if !empty(findfile(a:cs . '.vim', matchstr(split(&rtp, ','), a:dir) . '**'))
			exe 'colorscheme ' . a:cs
		else
			if !empty(findfile(a:cs . '.vim', $HOME . '/.vim/colors' . '**'))
				exe 'colorscheme ' . a:cs
			endif
		endif
	else
		if !empty(findfile(a:cs . '.vim', $HOME . '/.vim/colors' . '**'))
			exe 'colorscheme ' . a:cs
		endif
	endif
endfunction

function! DebugVim(target)
	" Define anything needs to be debug
	echo "DebugVim +++"
	echo "DebugVim ---"
endfunction

"==============================================================================
" Vim settings
"==============================================================================
" History lines remembered by VIM
set history=700
" Auto-read file when it is updated
set autoread
" Set 7 lines to the cursor - when moving vertical..
set so=7
" Turn on Wild menu - use TAB to get CMDs in CMD mode
set wildmenu
" set menu wide as longest word
set wildmode=list:longest,full
" A file that matches with one of these patterns is ignored when completing file or directory names
set wildignore+=*.o,*.obj,.git,*.pyc
" Use popup menu for complete list
set completeopt=longest,menu
" Always show current line number
set nu
" Always show current (x,y)
set ruler
" Set commandbar height
set cmdheight=2
" Able to switch between buffers when change in buffuer is not saving
set hid
" Set backspace priority higher then indent
set backspace=eol,start,indent
" Allow auto switch lines. eg: At the end of line, use > to start of next line
set whichwrap+=<,>,h,l
" Ignore case when searching
set ignorecase
" If search contains uppercase, not ignore case
set smartcase
" Searching act while typing words
set incsearch
" Highlight search things
set hlsearch
" Off lazy redraw while executing macros
set nolazyredraw
" Set magic on, for regular expressions
set magic
" Show matching bracets
set showmatch
" No sound on errors
set noerrorbells
" No flash on errors
set novisualbell
set t_vb=
set tm=500
" Mouse setting
" off a(ichvn), use only n
set mouse=n
" Cursor is allowed to be positioned one character past the line.
set selection=exclusive
" Using mouse or shift key can trigger selectmode on
set selectmode=mouse,key
" Add clipboard from sys(unnamed=*, unnamedplus=+)
set clipboard+=unnamed,unnamedplus
" Always display line modification report
set report=0
" Always hide the statusline
set laststatus=2
" Format the statusline
set statusline=%F%m%r%h%w\ [line=%l,%v][%p%%]\ %{strftime(\"%y/%m/%d\ %H:%M\")}
" When using GUI, set tab label content to show %t - File name (tail)
set guitablabel=%t
" Highlight cursor line
set cursorline
" Highlight cursor column
"set cursorcolumn
" Highlight matched brackets
"set showmatch
"set matchtime=5
" Off vim backup
set nobackup
" Off vim write backup
set nowb
" Off vim swapfile
set noswapfile
" Use specified char to disply string content
set listchars=tab:'``
" Set coding auto shitf
set shiftwidth=4
" Set TAB shift
set tabstop=4
" Set softtab
set softtabstop=4
" According to original tab in file to decide TAB shift
set smarttab
" Off expandtab
set noexpandtab
" Auto indent
set ai
" C indent
set cindent
" Smart indet
set si
" Wrap lines while one line is too long to display
set wrap
" Wrap will not seprate a word
set lbr
" While editing, words num over tw will be wrapped.
set tw=500
" Set flodmethod as maual
set foldmethod=manual
" A vertical highlight line as edition margin
set cc=80
" jump to the first open window that contains the specified buffer
try
	set switchbuf=usetab
catch
endtry
" Word won't be seprated by iskeyword symbols. Related to searching.
set iskeyword+=_,@,%

"==============================================================================
" Plugin config
"==============================================================================
"------------------------------------------------------------------------------
" Plug:(vim-plug) Minimaized vim plugin manager
"------------------------------------------------------------------------------
" Plugins will be downloaded under the specified directory.
if !empty(findfile("plug.vim", $HOME . "/.vim/autoload/**"))
	call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
	" Regular vim plugins
	Plug 'vim-scripts/bufexplorer.zip'
	Plug 'vim-scripts/minibufexpl.vim'
	Plug 'vim-scripts/taglist.vim'
	Plug 'vim-scripts/OmniCppComplete'
	Plug 'vim-scripts/neocomplcache'
	Plug 'preservim/nerdtree'
	Plug 'BoyPao/cace'
	Plug 'BoyPao/phcolorscheme'
	Plug 'BoyPao/mhl'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'kshenoy/vim-signature'
	" Snips for various languages
	Plug 'honza/vim-snippets'
	" snipMeta dependency
	Plug 'MarcWeber/vim-addon-mw-utils'
	" snipMeta dependency
	Plug 'tomtom/tlib_vim'
	Plug 'garbas/vim-snipmate'
	"Plug 'vim-scripts/markdown-preview.vim'

	" List ends here. Plugins become visible to Vim after this call.
	call plug#end()
endif
"------------------------------------------------------------------------------
" BufExplorer: aims to store opening buffers
"------------------------------------------------------------------------------
" Do not show default help
let g:bufExplorerDefaultHelp=0
" Show relative paths
let g:bufExplorerShowRelativePath=1
" Split left.
let g:bufExplorerSplitRight=1
"------------------------------------------------------------------------------
" Minibuffer: aims to store opening buffers and showing tightly
"------------------------------------------------------------------------------
" Open MiniBufExp when buffer num > 2
let g:miniBufExplBuffersNeeded = 2
let g:miniBufExplUseSingleClick = 1
"------------------------------------------------------------------------------
" NERDTree: a file system explorer for the Vim editor
"------------------------------------------------------------------------------
" Show hidden files
let NERDTreeShowHidden=1
"------------------------------------------------------------------------------
" Tlist: browse source code by listing function list, rely on ctags
"------------------------------------------------------------------------------
let Tlist_Auto_Open=0
" Show Tlist in right side
let Tlist_Use_Right_Window = 1
" Only show tags in current buffer rather then all buffers
let Tlist_Show_One_File=1
" Exit vim if Tlist is only opening buffer
let Tlist_Exit_OnlyWindow=1
"------------------------------------------------------------------------------
" Neocomplcache: maintaining a cache of keywords in the current buffer
"------------------------------------------------------------------------------
"run neocomplete while vim startup
let g:neocomplcache_enable_at_startup = 1
"------------------------------------------------------------------------------
" CACE: ctag and cscope enhance plugin
"------------------------------------------------------------------------------
let g:caceHighlightEnhance = 1
"------------------------------------------------------------------------------
" Phcs: a colorscheme
"------------------------------------------------------------------------------
let g:phcsPreResetOn = 1
let g:phcsCursorLineUnderline = 0
exe "call SetColorScheme('phcolorscheme', 'phcs')"
"------------------------------------------------------------------------------
" SnipMeta:
"------------------------------------------------------------------------------
" set parser version
let g:snipMate = { 'snippet_version' : 1 }

