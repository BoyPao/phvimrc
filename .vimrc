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
let mapleader = ","
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
nmap <leader>dd :call DebugVim('0')<CR>
"------------------------------------------------------------------------------
" BufferControls:
"------------------------------------------------------------------------------
" New buffer vertically
nmap vv :vsplit<cr>
" New buffer horizontally
nmap hh :split<cr>
" close current buffer
nmap qq :bd<cr>
" Use ww replace buffer control
nmap ww <C-W>
" Keep same buffer control method in terminal
tmap ww <C-W>
" Exit terminal method
tmap qq exit<cr>
" Enter normal mode in terminal
tmap <C-n> <C-W>N<cr>
" Turn order of buffers towards right side
nmap tt <C-w>r
" Change window width
nmap << 5<C-w><
nmap >> 5<C-w>>
" Change window height
nmap ++ 5<C-w>+
nmap -- 5<C-w>-
" Switch between buffers
nmap .. :bnext<cr>
nmap ,, :bprevious<cr>
"------------------------------------------------------------------------------
" FunctionalWindows:
"------------------------------------------------------------------------------
" Open/close Tlist
nmap ll :TlistToggle<cr>
" Open /close NERDTree
nmap kk :NERDTreeToggle<CR>
" Open/close MiniBufExp
nmap oo :TMiniBufExplorer<cr>
" Open/close BufExplorer
nmap <leader>kk :BufExplorerVerticalSplit<cr>
" Cope use quickfix to show make info in vim
nmap <leader>co :botright cope<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
" ConqueTerm can add a window to show shell result in vim
nmap <C-p> :vertical rightbelow terminal<cr>
nmap <C-o> :terminal<cr>
" On/off cscopequickfix
nmap <leader>cq :CACEQuickfixTrigger<CR>
"------------------------------------------------------------------------------
" Reading:
"------------------------------------------------------------------------------
" Cancel highlight in current search
map <silent> <leader><cr> :noh<cr>
map <silent> <leader>cc :call ColorColumnSwitch()<CR>
" Show line number or not
nmap <silent>22 :call SwitchNumShow()<cr>
" Open/close spell checking
map <leader>ss :setlocal spell!<cr>
" Spell checking jumpment
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
" Tab configuration
nmap <leader>te :tabedit
nmap <leader>tc :tabclose<cr>
nmap <leader>tm :tabmove
nmap <leader>tn :tabnext<cr>
" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>
" use n/N/<leader>g to search current selection in visual mode
vnoremap <silent> <leader>zt y:call VisualSearch('vg')<CR>
vnoremap <silent> n y:call VisualSearch('f')<CR>
vnoremap <silent> N y:call VisualSearch('b')<CR>
" CACE maps
" Auto generate/update DB
map <silent> <C-@> :CACEUpdate<CR>
" find definiation
nnoremap <silent> zg :CACEFind g <C-R>=expand("<cword>")<CR><CR>
" find who calls
nnoremap <silent> zc :CACEFind c <C-R>=expand("<cword>")<CR><CR>
" find text
nnoremap <silent> zt :CACEFind t <C-R>=expand("<cword>")<CR><CR>
" find symble
nnoremap <silent> zs :CACEFind s <C-R>=expand("<cword>")<CR><CR>
" find who is called by selected
nnoremap <silent> zd :CACEFind d <C-R>=expand("<cword>")<CR><CR>
" metch with egrep mode
nnoremap <silent> ze :CACEFind e <C-R>=expand("<cword>")<CR><CR>
" find and open target file
nnoremap <silent> zf :CACEFind f <C-R>=expand("<cfile>")<CR><CR>
" find who include target file
nnoremap <silent> zi :CACEFind i <C-R>=expand("<cfile>")<CR><CR>
" cace grep
nnoremap <silent> <leader>zt :CACEGrep <C-R>=expand("<cword>")<CR><CR>
"------------------------------------------------------------------------------
" Edition:
"------------------------------------------------------------------------------
"F7 comment selected lines
vmap <F7> :s=^\(//\)*=//=g<cr>:noh<cr>
nmap <F7> :s=^\(//\)*=//=g<cr>:noh<cr>
imap <F7> <ESC>:s=^\(//\)*=//=g<cr>:noh<cr>
vmap <F7># :s=^\(#\)*=#=g<cr>:noh<cr>
nmap <F7># :s=^\(#\)*=#=g<cr>:noh<cr>
imap <F7># <ESC>:s=^\(#\)*=#=g<cr>:noh<cr>
vmap <F7>" :s=^\("\)*="=g<cr>:noh<cr>
nmap <F7>" :s=^\("\)*="=g<cr>:noh<cr>
imap <F7>" <ESC>:s=^\("\)*="=g<cr>:noh<cr>
"F6 Uncomment selected lines
vmap <F6> :s=^\(//\)*==g<cr>:noh<cr>
nmap <F6> :s=^\(//\)*==g<cr>:noh<cr>
imap <F6> <ESC>:s=^\(//\)*==g<cr>:noh<cr>
vmap <F6># :s=^\(#\)*==g<cr>:noh<cr>
nmap <F6># :s=^\(#\)*==g<cr>:noh<cr>
imap <F6># <ESC>:s=^\(#\)*==g<cr>:noh<cr>
vmap <F6>" :s=^\("\)*==g<cr>:noh<cr>
nmap <F6>" :s=^\("\)*==g<cr>:noh<cr>
imap <F6>" <ESC>:s=^\("\)*==g<cr>:noh<cr>
" Repeat to replace word in cursor line
nmap rr :call RepeatOneLineReplace()<CR>
" Delete white space
nmap ds :%s/\s\+$//g<cr>
" Delete ^M(\r) from windows
nmap dm :%s///g<cr>
" Use vim to check diff within two windows
nmap dt :diffthis<cr>
" update diff
nmap du :diffupdate<cr>
" Use TAB or Ctl+I to switch mouse copy on/off
nmap <C-I> :call SwitchMouseState()<CR>
" Fast editing of the .vimrc
nmap <leader>vv :e! ~/.vimrc<cr>
" Open/close paste mode
map <leader>pp :call SwitchPasteMode()<cr>

"==============================================================================
" Word map
"==============================================================================
" Insert ctime and press Enter, ctime will be replaced by current time
iab ctime <c-r>=strftime("%y/%m/%d/ %H:%M")<cr>

"==============================================================================
" CMD map
"==============================================================================
" Open a new buffer and enter curren CWD
cno nb e ./
" Use vimgrep for string search
cno rr .,.+1s/<C-R>=expand("<cword>")<CR>//g <left><left><left>

"==============================================================================
" Auto CMD
"==============================================================================
" Set vim jump to the last position when reopening a file
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif
" When vimrc is edited, reload it
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
" Delete witespace while saving file
autocmd BufWrite * :call DeleteTrailingWS()
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"==============================================================================
" Functions
"==============================================================================
func! DeleteTrailingWS()
  %s/\s\+$//ge
endfunc

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

let g:mouseState="OFF"
function! SwitchMouseState()
	if g:mouseState=="ON"
		let g:mouseState="OFF"
		set mouse=n
	elseif g:mouseState=="OFF"
		let g:mouseState="ON"
		set mouse=
	endif
	echohl PreCondit | echo " mouse copy: " g:mouseState | echohl None
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

function! RepeatOneLineReplace()
	if strpart(@:,0,6)==".,.+1s"
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
		exe "CACEGrep " . reg
	else
		if a:direction == 'b'
			exe "normal ?" . reg . "\n"
		elseif a:direction == 'f'
			exe "normal /" . reg . "\n"
		endif
		let @/ = reg
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
" Set 7 lines to the curors - when moving vertical..
set so=7
" Turn on WiLd menu - use TAB to get CMDs in CMD mode
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
" Can switch between buffers when change in buffuer is not saving
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
"set cursorline
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
" Use specified char to disply string content
set listchars=tab:>-,trail:-
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
	Plug 'vim-scripts/Mark'
	Plug 'preservim/nerdtree'
	Plug 'BoyPao/cace'
	Plug 'BoyPao/phcolorscheme'
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
" Cace: ctag and cscope enhance plugin
"------------------------------------------------------------------------------
let g:caceInfoEveryTime = 1
"------------------------------------------------------------------------------
" Phcs: a colorscheme
"------------------------------------------------------------------------------
if !empty(matchstr(&rtp, "phcolorscheme"))
	if !empty(findfile("phcs.vim", matchstr(split(&rtp, ','), 'phcolorscheme') . '**'))
		colorscheme phcs
	endif
endif
"------------------------------------------------------------------------------
" SnipMeta:
"------------------------------------------------------------------------------
" set parser version
let g:snipMate = { 'snippet_version' : 1 }

