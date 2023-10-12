" Most of this config file is referenced from amix's vimrc setup file
" The source of which can be found here: https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

" Set leader for more complex commands (I like spacebar)
nnoremap <Space> <Nop>
let mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" use spaces instead of tabs and be smart about them
set expandtab
set smarttab

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" Fast saving
nmap <leader>w :w!<cr>

" Turn off backups, just use git instead
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show current position
set ruler

" Show relative line numbers
set nu
set relativenumber

" No annoying error bells
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" add a extra column margin to the left
set foldcolumn=3

" show matching quotes / brackets 
set showmatch

" Don't redraw the screen while executing macros (prevents wasted execution time)
set lazyredraw

" tab is 4 spaces
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ignore case when searching
set ignorecase
set smartcase
set incsearch

" highlight search results when searching
set hlsearch

" pressing * searches for selection in Visual Mode
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" Clear highlight
map <ESC> :let @/=""<cr>

" Keep words in search in the middle of the screen
nnoremap n nzz
nnoremap N Nzz

" Turn on the Wild menu (for autocomplete)
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>t<leader> :tabnext<cr>

" Let tl toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" good for editing files in the same directory
map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" close a terminal with Ctrl-d (it won't run in the background)
" go to previous command with Ctrl-p and next command with Ctrl-n
map <leader>wh :sp<cr>
map <leader>wv :vsp<cr>
" Open up a file explorer window to the left, isn't working for navigation ;(
" :vsp<cr>:Explore<cr>:vertical resize -25<cr> 
" map <leader>we :Vexplore<cr>:vertical resize -25<cr>
map <leader>wc :close<cr>
map <leader>w<leader> <C-w>w
map <leader>wi <C-w>i
map <leader>wk <C-w>k
map <leader>wj <C-w>j
map <leader>wl <C-w>l
" Open up a terminal below
map <leader>tt :belowright terminal ++close<cr><C-w>N:resize -10<cr>A
tnoremap <ESC> <C-w>N<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e<leader> :Explore<cr>
map <leader>ee :e <C-r>=escape(expand("%:p:h"), " ")<cr>/

" To make a bookmark, use mb. To go to a bookmark, use gb (Inside Netrw)
" R 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Edit mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^

" Keep code in the center of the screen when moving by page
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Don't get rid of text in register when replacing in visual
xnoremap <leader>p "dP

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking (Not sure if this works)
map <leader>ss :setlocal spell!<cr>

" go next mis-spelled word
map <leader>sn ]s
" go previous mis-spelled word
map <leader>sp [s
" add word to the approved words of the dictionary
map <leader>sa zg
" see possible replacements
map <leader>sr z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme gruvbox
set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
