vim9script
# License: GPL-3.0-or-later
#
# Vim config under PH style
#
# Copyright (c) 2021 Peng Hao <635945005@qq.com>
#
#==============================================================================
# Common setting
#==============================================================================
# Enable file type detect on vim
filetype on
# Enable plugins according to filetype
filetype plugin on
# Enable indents according to filetype
filetype indent on
# highlight depends on syntax of filetype
syntax on
# Set leader key
g:mapleader = ","
# Try to config persistent undo
try
	if MySys() == "windows"
		set undodir=C:\Windows\Temp
	else
		set undodir=~/.vim/undo_cache
	endif
	set undofile
catch
endtry

#==============================================================================
# Key map
#==============================================================================
# A map for vim config debug
nnoremap <Leader>dd :call g:DebugVim('0')<CR>
#------------------------------------------------------------------------------
# BufferControls:
#------------------------------------------------------------------------------
# New buffer vertically
nnoremap vv :vsplit<CR>
# New buffer horizontally
nnoremap hh :split<CR>
# close current buffer
nnoremap qq :bd<CR>
# Use ww replace buffer control
nnoremap ww <C-W>
if has("terminal")
	# Keep same buffer control method in terminal
	tnoremap ww <C-W>
	# Exit terminal method
	tnoremap qq exit<CR>
	# Enter normal mode in terminal
	tnoremap <C-n> <C-W>N<CR>
endif
# Turn order of buffers towards right side
nnoremap tt <C-w>r
# Change window width
nnoremap << 5<C-w><
nnoremap >> 5<C-w>>
# Change window height
nnoremap ++ 5<C-w>+
nnoremap -- 5<C-w>-
# Switch between buffers
nnoremap .. :bnext<CR>
nnoremap ,, :bprevious<CR>
#------------------------------------------------------------------------------
# FunctionalWindows:
#------------------------------------------------------------------------------
# Open/close Tlist
nnoremap ll :TlistToggle<CR>
# Open /close NERDTree
nnoremap kk :NERDTreeToggle<CR>
nnoremap cc :NERDTreeExplore<CR>
# Open/close MiniBufExp
nnoremap oo :TMiniBufExplorer<CR>
# Cope use quickfix to show make info in vim
nnoremap <Leader>co :botright cope<CR>
nnoremap <Leader>cn :cn<CR>
nnoremap <Leader>cp :cp<CR>
# ConqueTerm can add a window to show shell result in vim
nnoremap <C-p> :vertical rightbelow terminal<CR>
nnoremap <C-o> :terminal<CR>
# On/off cscopequickfix
nnoremap <Leader>cq :Cacequickfixtrigger<CR>
#------------------------------------------------------------------------------
# Reading:
#------------------------------------------------------------------------------
# Cancel highlight in current search
nnoremap <silent> <Leader><CR> :noh<CR>
nnoremap <silent> <Leader>cc :call g:ColorColumnSwitch()<CR>
# Show line number or not
nnoremap <silent>22 :call g:SwitchNumShow()<CR>
# Switch Tab num
nnoremap <silent>33 :call g:SwitchList()<CR>
# Switch Tab num
nnoremap <silent>44 :call g:SwitchTabNum()<CR>
# Open/close spell checking
nnoremap <Leader>ss :setlocal spell!<CR>
# Spell checking jumpment
nnoremap <Leader>sn ]s
nnoremap <Leader>sp [s
nnoremap <Leader>sa zg
nnoremap <Leader>s? z=
# Tab configuration
nnoremap <Leader>te :tabedit
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tm :tabmove
nnoremap <Leader>tn :tabnext<CR>
# When pressing <Leader>cd switch to the directory of the open buffer
nnoremap <Leader>cd :cd %:p:h<CR>
# use n/N/<Leader>g to search current selection in visual mode
vnoremap <silent> <Leader>zt y:call g:VisualSearch('vg')<CR>
vnoremap <silent> n y:call g:VisualSearch('f')<CR>
vnoremap <silent> N y:call g:VisualSearch('b')<CR>
# MHL maps
# trigger match highlight
nnoremap <silent> <Leader>m :MhlTriggerMatch<CR>
# clear all match highlight
nnoremap <silent> <Leader>n :MhlClearAllMatch<CR>
# CACE maps
# Auto generate/update DB
nnoremap <silent> <C-@> :Caceupdate<CR>
# find definiation
nnoremap <silent> zg :Cacefind g <C-R>=expand("<cword>")<CR><CR>
# find who calls
nnoremap <silent> zc :Cacefind c <C-R>=expand("<cword>")<CR><CR>
# find text
nnoremap <silent> zt :Cacefind t <C-R>=expand("<cword>")<CR><CR>
# find symble
nnoremap <silent> zs :Cacefind s <C-R>=expand("<cword>")<CR><CR>
# find who is called by selected
nnoremap <silent> zd :Cacefind d <C-R>=expand("<cword>")<CR><CR>
# metch with egrep mode
nnoremap <silent> ze :Cacefind e <C-R>=expand("<cword>")<CR><CR>
# find and open target file
nnoremap <silent> zf :Cacefind f <C-R>=expand("<cfile>")<CR><CR>
# find who include target file
nnoremap <silent> zi :Cacefind i <C-R>=expand("<cfile>")<CR><CR>
# find where this symbol is assigned value
nnoremap <silent> za :Cacefind a <C-R>=expand("<cword>")<CR><CR>
# Cace grep
nnoremap <silent> <Leader>zt :call g:FuzzyHelper('FuzzyGrep', '<C-R>=expand("<cword>")<CR>')<CR>
# Fuzzy find
nnoremap <silent> ff :call g:FuzzyHelper('FuzzyFiles', '')<CR>
nnoremap <silent> fg :call g:FuzzyHelper('FuzzyGrep', '')<CR>
nnoremap <silent> fi :call g:FuzzyHelper('FuzzyInBuffer', '')<CR>
nnoremap <silent> <leader>fb :call g:FuzzyHelper('FuzzyBuffers', '')<CR>
nnoremap <silent> <leader>fc :call g:FuzzyHelper('FuzzyCommands', '')<CR>
nnoremap <silent> <leader>fh :call g:FuzzyHelper('FuzzyHelp', '')<CR>
nnoremap <silent> <leader>fm :call g:FuzzyHelper('FuzzyMru', '')<CR>
nnoremap <silent> <leader>fp :call g:FuzzyHelper('FuzzyPrevious', '')<CR>
nnoremap <silent> <leader>fr :call g:FuzzyHelper('FuzzyMruCwd', '')<CR>
#------------------------------------------------------------------------------
# Edition:
#------------------------------------------------------------------------------
# F7 comment selected lines
vnoremap <F7> :s=^\(//\)*=//=g<CR>:noh<CR>
nnoremap <F7> :s=^\(//\)*=//=g<CR>:noh<CR>
inoremap <F7> <Esc>:s=^\(//\)*=//=g<CR>:noh<CR>
vnoremap <F7># :s=^\(#\)*=#=g<CR>:noh<CR>
nnoremap <F7># :s=^\(#\)*=#=g<CR>:noh<CR>
inoremap <F7># <Esc>:s=^\(#\)*=#=g<CR>:noh<CR>
vnoremap <F7>" :s=^\("\)*="=g<CR>:noh<CR>
nnoremap <F7>" :s=^\("\)*="=g<CR>:noh<CR>
inoremap <F7>" <Esc>:s=^\("\)*="=g<CR>:noh<CR>
# F6 Uncomment selected lines
vnoremap <F6> :s=^\(//\)*==g<CR>:noh<CR>
nnoremap <F6> :s=^\(//\)*==g<CR>:noh<CR>
inoremap <F6> <Esc>:s=^\(//\)*==g<CR>:noh<CR>
vnoremap <F6># :s=^\(#\)*==g<CR>:noh<CR>
nnoremap <F6># :s=^\(#\)*==g<CR>:noh<CR>
inoremap <F6># <Esc>:s=^\(#\)*==g<CR>:noh<CR>
vnoremap <F6>" :s=^\("\)*==g<CR>:noh<CR>
nnoremap <F6>" :s=^\("\)*==g<CR>:noh<CR>
inoremap <F6>" <Esc>:s=^\("\)*==g<CR>:noh<CR>
# Repeat to replace word in cursor line
nnoremap <Leader>rr :call g:RepeatOneLineReplace("<C-R>=expand("<cword>")<CR>")<CR>
# Delete white space
nnoremap ds :%s/\s\+$//g<CR>
# Delete ^M(\r) from windows
nnoremap dm :%s///g<CR>
# Use vim to check diff within two windows
nnoremap dt :diffthis<CR>
# update diff
nnoremap du :diffupdate<CR>
# Use TAB or Ctl+I to switch mouse copy on/off
nnoremap <C-I> :call g:SwitchMouseState()<CR>
# Fast editing of the .vimrc
nnoremap <Leader>vv :e! ~/.vimrc<CR>
# Open/close paste mode
nnoremap <Leader>pp :call g:SwitchPasteMode()<CR>
# Use Tab & S-Tab to complete
inoremap <silent> <Tab> <C-R>=g:CleverTabForCompletion(0)<CR>
inoremap <silent> <S-Tab> <C-R>=g:CleverTabForCompletion(1)<CR>
# Forbid Up & Down in popup menu
inoremap <Down> <C-R>=pumvisible() ? "\<lt>C-y>\<lt>Down>" : "\<lt>Down>"<CR>
inoremap <Up> <C-R>=pumvisible() ? "\<lt>C-y>\<lt>Up>" : "\<lt>Up>"<CR>
inoremap <Enter> <C-R>=pumvisible() ? "\<lt>C-y>\<lt>Enter>" : "\<lt>Enter>"<CR>

#==============================================================================
# Word map
#==============================================================================
# Insert ctime and press Enter, ctime will be replaced by current time
iabbrev ctime <C-R>=strftime("%y/%m/%d/ %H:%M")<CR>

#==============================================================================
# CMD map
#==============================================================================
# Use vimgrep for string search
cnoremap ,rr .,.s/<C-R>=expand("<cword>")<CR>//g <left><left><left>

#==============================================================================
# Auto CMD
#==============================================================================
if has("autocmd")
	# Set vim jump to the last position when reopening a file
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal g`\"" | endif
	# When vimrc is edited, reload it
	autocmd! bufwritepost $MYVIMRC source $MYVIMRC
	# Delete witespace while saving file
	autocmd BufWrite * :call g:DeleteTrailingWS()
	# Exit Vim if NERDTree is the only window remaining in the only tab.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
endif

#==============================================================================
# Functions
#==============================================================================
def g:DeleteTrailingWS()
	:%s/\s\+$//ge
enddef

def g:SwitchList()
	if &list
		set nolist
	else
		set list
	endif
enddef

g:tabNum = 8
def g:SwitchTabNum()
	var num = &tabstop
	if num != g:tabNum
		num = g:tabNum
	else
		num = 4
	endif
	exe 'set shiftwidth=' .. num
	exe 'set tabstop=' .. num
	exe 'set softtabstop=' .. num
	echohl PreCondit | echo " Set Tab width: " num | echohl None
enddef

def g:SwitchNumShow()
	if &nu
		set nonu
	else
		set nu
	endif
enddef

def g:SwitchMouseState()
	var mouseStr = "ON"
	if &mouse == ""
		mouseStr = "OFF"
		set mouse=n
	else
		set mouse=
	endif
	echohl PreCondit | echo " mouse copy: " mouseStr | echohl None
enddef

def g:SwitchPasteMode()
	var pasteStr = "ON"
	if &paste
		pasteStr = "OFF"
		setlocal nopaste
	else
		setlocal paste
	endif
	echohl PreCondit | echo " paste mode: " pasteStr | echohl None
enddef

def g:RepeatOneLineReplace(cword: string)
	v:errmsg = ""
	if strpart(@:, 0, 5) == ".,.s/"
		if cword != @/
			silent! exe "normal! n"
		endif
		if v:errmsg != ""
			echohl Error | echo v:errmsg | echohl None
			return
		endif
		silent! exe ":" .. @:
		echo ":" .. @:
	endif
enddef

g:ccNum = "120"
def g:ColorColumnSwitch()
	var num = &cc
	if num == "0"
		num = g:ccNum
	else
		num = "0"
	endif
	exe 'set cc=' .. num
enddef

def g:VisualSearch(direction: string)
	var reg = @0
	if direction == 'vg'
		exe "FuzzyGrep " .. reg
	else
		if direction == 'b'
			exe "normal ?" .. reg .. "\n"
		elseif direction == 'f'
			exe "normal /" .. reg .. "\n"
		endif
		@/ = reg
	endif
enddef

def g:CleverTabForCompletion(direction: number): string
	if pumvisible()
		if direction == 0
			return "\<C-N>"
		else
			return "\<C-P>"
		endif
	else
		if direction == 0
			return "\<Tab>"
		else
			return "\<S-Tab>"
		endif
	endif
enddef

def g:SetColorScheme(dir: string, cs: string)
	if !empty(matchstr(&rtp, dir))
		if !empty(findfile(cs .. ".vim", matchstr(split(&rtp, ','), dir) .. '**'))
			exe 'colorscheme ' .. cs
		else
			if !empty(findfile(cs .. '.vim', $HOME .. '/.vim/colors' .. '**'))
				exe 'colorscheme ' .. cs
			endif
		endif
	else
		if !empty(findfile(cs .. '.vim', $HOME .. '/.vim/colors' .. '**'))
			exe 'colorscheme ' .. cs
		endif
	endif
enddef

def g:FuzzyHelper(cmd: string, str: string)
	if matchstr(&mouse, 'n') == 'n'
		call g:SwitchMouseState()
	endif

	if cmd == ''
		echohl Error | echo "Invalid Fuzzy cmd" cmd | echohl None
	else
		if str == ''
			exe cmd
		else
			exe cmd .. ' ' .. str
		endif
	endif
enddef

def g:DebugVim(target: string)
	# Define anything needs to be debug
	echo "DebugVim +++"
	echo "DebugVim ---"
enddef

#==============================================================================
# Vim settings
#==============================================================================
# History lines remembered by VIM
set history=700
# Auto-read file when it is updated
set autoread
# Set 7 lines to the cursor - when moving vertical..
set so=7
# Turn on Wild menu - use TAB to get CMDs in CMD mode
set wildmenu
# set menu wide as longest word
set wildmode=list:longest,full
# A file that matches with one of these patterns is ignored when completing file or directory names
set wildignore+=*.o,*.obj,.git,*.pyc
# Use popup menu for complete list
set completeopt=longest,menu
# Always show current line number
set nu
# Always show current (x,y)
set ruler
# Set commandbar height
set cmdheight=2
# Able to switch between buffers when change in buffuer is not saving
set hid
# Set backspace priority higher then indent
set backspace=eol,start,indent
# Allow auto switch lines. eg: At the end of line, use > to start of next line
set whichwrap+=<,>,h,l
# Ignore case when searching
set ignorecase
# If search contains uppercase, not ignore case
set smartcase
# Searching act while typing words
set incsearch
# Highlight search things
set hlsearch
# Off lazy redraw while executing macros
set nolazyredraw
# Set magic on, for regular expressions
set magic
# Show matching bracets
set showmatch
# No sound on errors
set noerrorbells
# No flash on errors
set novisualbell
set t_vb=
set tm=500
# Mouse setting
# off a(ichvn), use only n
set mouse=n
# Cursor is allowed to be positioned one character past the line.
set selection=exclusive
# Using mouse or shift key can trigger selectmode on
set selectmode=mouse,key
# Add clipboard from sys(unnamed=*, unnamedplus=+)
set clipboard+=unnamed,unnamedplus
# Always display line modification report
set report=0
# Always hide the statusline
set laststatus=2
# Format the statusline
set statusline=%F%m%r%h%w\ [line=%l,%v][%p%%]\ %{strftime(\"%y/%m/%d\ %H:%M\")}
# When using GUI, set tab label content to show %t - File name (tail)
set guitablabel=%t
# Highlight cursor line
set cursorline
# Highlight cursor column
#set cursorcolumn
# Highlight matched brackets
#set showmatch
#set matchtime = 5
# Off vim backup
set nobackup
# Off vim write backup
set nowb
# Off vim swapfile
set noswapfile
# Use specified char to disply string content
set listchars=tab:'``
# Set coding auto shitf
exe 'set shiftwidth=' .. g:tabNum
# Set TAB shift
exe 'set tabstop=' .. g:tabNum
# Set softtab
exe 'set softtabstop=' .. g:tabNum
# According to original tab in file to decide TAB shift
set smarttab
# Off expandtab
set noexpandtab
# Auto indent
set ai
# C indent
set cindent
# Smart indet
set si
# Wrap lines while one line is too long to display
set wrap
# Wrap will not seprate a word
set lbr
# While editing, words num over tw will be wrapped.
set tw=500
# Set flodmethod as maual
set foldmethod=manual
# A vertical highlight line as edition margin
exe 'set cc=' .. g:ccNum
# jump to the first open window that contains the specified buffer
try
	set switchbuf=usetab
catch
endtry
# Word won't be seprated by iskeyword symbols. Related to searching.
set iskeyword+=_,@,%

#==============================================================================
# Plugin config
#==============================================================================
#------------------------------------------------------------------------------
# Plug:(vim-plug) Minimaized vim plugin manager
#------------------------------------------------------------------------------
# Plugins will be downloaded under the specified directory.
if !empty(findfile("plug.vim", $HOME .. "/.vim/autoload/**"))
	call plug#begin(has('nvim') ? stdpath('data') .. '/plugged' : '~/.vim/plugged')
	# Regular vim plugins
	Plug 'vim-scripts/taglist.vim'
	Plug 'fholgado/minibufexpl.vim'
	if v:version >= 901 && has('python3')
		# 1. python3 dynamatic lib should be compiled and installed (./configure --enable-shared)
		# 2. vim should enabled python3 feature and link python3 dyn lib
		# (before compile: export LDFLAGS="-rdynamic")
		# (./configure --enable-shared)
		# 3. YCM core should be compiled manually (python3 install.py --clangd-completer --verbose)
		Plug 'ycm-core/YouCompleteMe'
		# Generate ycm cfg file
		Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
	elseif v:version >= 800 && has('python3')
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	else
		Plug 'Shougo/neocomplete.vim'
	endif
	# Plug 'ryanoasis/vim-devicons'
	Plug 'vim-fuzzbox/fuzzbox.vim'
	Plug 'preservim/nerdtree'
	Plug 'BoyPao/cace'
	Plug 'BoyPao/phcolorscheme'
	Plug 'BoyPao/mhl'
	# Need regular highlight when code cannot be build to use YCM
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'kshenoy/vim-signature'
	# Snips for various languages
	Plug 'honza/vim-snippets'
	# snipMeta dependency
	Plug 'MarcWeber/vim-addon-mw-utils'
	# snipMeta dependency
	Plug 'tomtom/tlib_vim'
	Plug 'garbas/vim-snipmate'
	# Plug 'vim-scripts/markdown-preview.vim'
	if v:version >= 910
		Plug 'lifepillar/vim-colortemplate'
	endif
	# List ends here. Plugins become visible to Vim after this call.
	call plug#end()
endif
#------------------------------------------------------------------------------
# Minibuffer: aims to store opening buffers and showing tightly
#------------------------------------------------------------------------------
# Open MiniBufExp when buffer num > 2
g:miniBufExplBuffersNeeded = 2
#------------------------------------------------------------------------------
# NERDTree: a file system explorer for the Vim editor
#------------------------------------------------------------------------------
# Show hidden files
g:NERDTreeShowHidden = 1
g:NERDTreeWinPos = 'left'
#------------------------------------------------------------------------------
# Tlist: browse source code by listing function list, rely on ctags
#------------------------------------------------------------------------------
g:Tlist_Auto_Open = 0
# Show Tlist in right side
g:Tlist_Use_Right_Window = 1
# Only show tags in current buffer rather then all buffers
g:Tlist_Show_One_File = 1
# Exit vim if Tlist is only opening buffer
g:Tlist_Exit_OnlyWindow = 1
#------------------------------------------------------------------------------
# Complete: According to vim version we use different complete plug
#------------------------------------------------------------------------------
if v:version >= 901 && has('python3')
	g:ycm_complete_in_strings = 1
	g:ycm_collect_identifiers_from_tags_files = 1
	# when compile not supported, some code will be hl as comment from #if, so close ycm hl
	g:ycm_enable_semantic_highlighting = 0
	# There are many error report if we do not compile the code, so close diagnose
	g:ycm_show_diagnostics_ui = 0
	# The hover cover the view, so close it
	g:ycm_auto_hover = ''
	# The preview cover the view, so close it
	g:ycm_add_preview_to_completeopt = 0
	g:ycm_seed_identifiers_with_syntax = 1
	# Disable the conformation of loading ycm cfg file
	g:ycm_confirm_extra_conf = 0
	g:ycm_key_list_select_completion = ['<TAB>']
	g:ycm_key_list_previous_completion = ['<S-TAB>']
elseif v:version >= 800 && has('python3')
	# run complete while vim startup
	g:deoplete#enable_at_startup = 1
else
	# run complete while vim startup
	g:neocomplcache_enable_at_startup = 1
endif
#------------------------------------------------------------------------------
# CACE: ctag and cscope enhance plugin
#------------------------------------------------------------------------------
g:caceHighlightEnhance = 1
#------------------------------------------------------------------------------
# Phcs: a colorscheme
#------------------------------------------------------------------------------
g:phcsPreResetOn = 1
g:phcsCursorLineUnderline = 0
exe "call SetColorScheme('phcolorscheme', 'phcs')"
#------------------------------------------------------------------------------
# SnipMeta:
#------------------------------------------------------------------------------
# set parser version
g:snipMate = { 'snippet_version': 1 }
#------------------------------------------------------------------------------
# Fuzzbox
#------------------------------------------------------------------------------
g:fuzzbox_exclude_file = ['*.swp', 'tags', 'cscope.*']
highlight link fuzzboxMatching IncSearch

