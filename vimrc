
" __/\\\________/\\\__/\\\\\\\\\\\__/\\\\____________/\\\\____/\\\\\\\\\____________/\\\\\\\\\_        
"  _\/\\\_______\/\\\_\/////\\\///__\/\\\\\\________/\\\\\\__/\\\///////\\\_______/\\\////////__       
"   _\//\\\______/\\\______\/\\\_____\/\\\//\\\____/\\\//\\\_\/\\\_____\/\\\_____/\\\/___________      
"    __\//\\\____/\\\_______\/\\\_____\/\\\\///\\\/\\\/_\/\\\_\/\\\\\\\\\\\/_____/\\\_____________     
"     ___\//\\\__/\\\________\/\\\_____\/\\\__\///\\\/___\/\\\_\/\\\//////\\\____\/\\\_____________    
"      ____\//\\\/\\\_________\/\\\_____\/\\\____\///_____\/\\\_\/\\\____\//\\\___\//\\\____________   
"       _____\//\\\\\__________\/\\\_____\/\\\_____________\/\\\_\/\\\_____\//\\\___\///\\\__________  
"        ______\//\\\________/\\\\\\\\\\\_\/\\\_____________\/\\\_\/\\\______\//\\\____\////\\\\\\\\\_ 
"         _______\///________\///////////__\///______________\///__\///________\///________\/////////__
"
"                                                        
"    _|      _|  _|_|_|  _|      _|  _|_|_|      _|_|_|  
"    _|      _|    _|    _|_|  _|_|  _|    _|  _|        
"    _|      _|    _|    _|  _|  _|  _|_|_|    _|        
"      _|  _|      _|    _|      _|  _|    _|  _|        
"        _|      _|_|_|  _|      _|  _|    _|    _|_|_|  
"                                                        


"" Pathogen ---------------------------------------------------------{{{
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype on
filetype plugin indent on
"" }}}
"" Basic options ----------------------------------------------------{{{
let mapleader = ","
set encoding=utf-8
set nocompatible
set nu
set wrap
set autoindent
set cindent
set smartindent
set smarttab                                        "make tab insert indents instead of tabs at the beginning of a line
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftwidth=4                                    "indentation width
set ts=4                                            "tab size
set expandtab
"set visualbell                                     "never use this, slows down vim
set list
set listchars=tab:→\ ,eol:¬,extends:❯,precedes:❮
set fillchars=diff:⣿,vert:│
set pastetoggle=<F9>                                "paste a code without indentation
set ignorecase                                      "ignore case when using search or auto complete
set smartcase                                       " Show case search if i type in capitals
set incsearch                                       " move the cursor to the matched string, while typing the search pattern
set showmatch
set hlsearch
set gdefault
"set modifiable                                      "for nerd tree, to modify files and dirs in nerd tree
" recent commnet to stop nerdtree from loading
"autocmd VimEnter * NERDTree                         "start nerdtree with every instace of vim
"let g:nerdtree_tabs_open_on_console_startup = 1     "start nerdTree in every tab, plugin used: vim-nerdtree-tabs

" commented long ago
"au VimEnter * NERDTreeFind                         "Highlights the current editing file in the tree but only when we open
"autocmd VimEnter * wincmd w                        "auto focus on the buffer when enter a file
"let g:nerdtree_tabs_smart_startup_focus = 2
"autocmd BufEnter * lcd %:p:h

autocmd VimEnter * wincmd l                         "auto focus on the current buffer
set whichwrap+=<,>,h,l,[,]                          "atuomatically move to the next line when reached the eol
set laststatus=2                                    "Always show statusline
set cursorline
set mouse=a                                         "enable mouse in vim
set scrolloff=10                                     "make 3 lines visible above and below the cursor
"set sidescroll=1
"set sidescrolloff=10
set showbreak=↪
set splitbelow                                      "open the new split window on the right
set splitright                                      "open the new split window on the right
"with this enabled we can specify the synax for a file in the file itsef by: "vi: syntax=apache"
set modeline                        

au FocusLost * :silent! wall                        "Save when losing focus
au VimResized * :wincmd =                           "Resize splits when the window is resized    

au BufNewFile,BufRead *.escript set filetype=erlang
au BufNewFile,BufRead *.app.src set filetype=erlang
au BufNewFile,BufRead *.app set filetype=erlang
au BufNewFile,BufRead *.appup set filetype=erlang
au BufNewFile,BufRead *.erl set filetype=erlang

let g:goldenview__enable_at_startup = 0
" }}}
"" Focus options ----------------------------------------------------{{{
"" Make sure Vim returns to the same line when you reopen a file.{{{
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
" }}}
"" Autofocus on the filename of the file in the current buffer------{{{
" returns true iff is NERDTree open/active
function! rc:isNTOpen() 
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" returns true iff focused window is NERDTree window
function! rc:isNTFocused()     
  return -1 != match(expand('%'), 'NERD_Tree') 
endfunction 

" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! rc:syncTree()
  if &modifiable && rc:isNTOpen() && !rc:isNTFocused() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
"}}}
autocmd BufEnter * call rc:syncTree()
" }}}
"" Syntax highlighting and colorscheme ------------------------------{{{
" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"colorscheme Mustang_Vim_Colorscheme_by_hcalves
"let g:rehash256 = 1
"colorscheme molokai
"colorscheme  badwolf
"colorscheme  gummybears
colorscheme  github
"colorscheme  skittles_berry
"" }}}
"" Powerline and python mode ----------------------------------------{{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle required!
Bundle 'gmarik/vundle'
"The bundles you install will be listed here
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'klen/python-mode'
" }}}
"" Vim key Bindings -------------------------------------------------{{{
"map  <C-l> :tabn<CR>
"map  <C-h> :tabp<CR>
"map  <C-n> :tabnew<CR>

"" map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>
"" map CTRL-A to beginning-of-line (insert mode)
" imap <C-a> <esc>0i
"" save document 
imap <C-d> <esc>:w<CR>
nmap <C-d> :w<CR>

" map CTRL-b to the back of a word [default vim binding is E]
" imap <C-b> <esc>ea
" map ,ne to toggle nerdtree
nmap <leader>ne :NERDTreeToggle<cr>
" change size of the split window
nmap <C-Left> <C-w>>
nmap <C-Right> <C-w><

" move in inset mode
inoremap <C-h> <C-o>h
"inoremap <C-j> <C-o>j
"inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" maps to the first character of the line
imap <C-f> <esc>^i
"" Switch between split screens or nerdtree
" nnoremap <C-w> <C-w>w
"""""""""cut copy paste from system clipboard""""""""""
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
set go+=a               " Visual selection automatically copied to the clipboard
" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>

" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>
"" slimux -----------------------------------------------------------{{{
map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
"" }}}

"" }}}
"" Search -----------------------------------------------------------{{{
"Clear mathes 
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" Don't move on *
nnoremap * *<c-o>
" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_
" Visual Mode */# from Scrooloose
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>
" }}}
"" Folding and  spaces ----------------------------------------------{{{
" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
" open all folds
nnoremap <c-i> zR   
" Clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z
" close all folds
" nnoremap <c-> zM

" Focus on the current line and close other folds
nnoremap <c-z> mzzMzvzz15<c-e>`z:Pulse<cr>

set foldlevelstart=0
"set foldmethod=indent   " commented long algo
"set foldlevel=0          " max fold level commented long ago
"set foldnestmax=0
"set nofoldenable        " do not enable folding by default
function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
" Vim {{{
augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}
" Tex {{{
augroup ft_tex
    au!
    au FileType tex setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.tex if &ft == 'help' | wincmd L | endif
augroup END
" }}}
" C {{{

augroup ft_c
    au!
    au FileType c setlocal foldmethod=marker foldmarker={,}
augroup END

" }}}
" Python {{{

augroup ft_python
    au!

    au FileType python setlocal define=^\s*\\(def\\\\|class\\)
    au FileType man nnoremap <buffer> <cr> :q<cr>
    " convert tab to 2 spaces
    au FileType python set tabstop=4|set shiftwidth=4|set expandtab
    " Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
    " override this in a normal way, could you?
    au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif

    au FileType python iabbrev <buffer> afo assert False, "Okay"
augroup END

" }}}
" HTML, Django, Jinja, Dram {{{

let g:html_indent_tags = ['p', 'li']

augroup ft_html
    au!

    au BufNewFile,BufRead *.html setlocal filetype=htmldjango
    au BufNewFile,BufRead *.dram setlocal filetype=htmldjango

    au FileType html,jinja,htmldjango setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>f Vatzf

    " Use <localleader>t to fold the current templatetag.
    au FileType html,jinja,htmldjango nmap <buffer> <localleader>t viikojozf

    " Indent tag
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>= Vat=

    " Django tags
    au FileType jinja,htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>

    " Django variables
    au FileType jinja,htmldjango inoremap <buffer> <c-b> {{<space><space>}}<left><left><left>
augroup END

" }}}
" Django {{{

augroup ft_django
    au!

    au BufNewFile,BufRead urls.py           setlocal nowrap
    au BufNewFile,BufRead urls.py           normal! zR
    au BufNewFile,BufRead dashboard.py      normal! zR
    au BufNewFile,BufRead local_settings.py normal! zR

    au BufNewFile,BufRead admin.py     setlocal filetype=python.django
    au BufNewFile,BufRead urls.py      setlocal filetype=python.django
    au BufNewFile,BufRead models.py    setlocal filetype=python.django
    au BufNewFile,BufRead views.py     setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal foldmethod=marker
    au BufNewFile,BufRead forms.py     setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal foldmethod=marker
augroup END

" }}}
" }}}
"" Typos ------------------------------------------------------------{{{
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>
"" }}}
"" YouCompleteMe Omnicomplete and Jedi-vim --------------------------{{{
"" below code may clash with Jedi-vim, so if it does then comment it.
" au FileType python set omnifunc=pythoncomplete#Complete "enable omnicomplete
" let g:SuperTabDefaultCompletionType = "context"         "enble supertab
set completeopt=menuone,longest                         "enable dropdown menu in jedi and omnicomplete
autocmd FileType python set completeopt-=preview        "disable window split into pydoc
"set completeopt-=preview                                "diable window split
" Since UltiSnips pass the tab key is there is no match 
" we then use superTab to invoke YouCompleteMe
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-Tab>'
let g:ycm_extra_conf_globlist = ['~/*']
set wildmenu
set wildmode=list:longest,full
let g:jedi#popup_on_dot = 0
" let g:jedi#popup_select_first = 0   "select the first suggestions from the popup

"--------------onmicomplete for other languages-----------------------------"
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"}}}
"" python mode and virtualenv----------------------------------------{{{
let g:pymode_virtualenv = 1   "enable vim to detect virtualenv
let g:pymode_lint = 0         "Disable code checking with pep8 or pyflakes

"-----------enable virtual environment------------------------------------
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"" }}}
"" indent guides plugin----------------------------------------------{{{
let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
hi def IndentGuides guibg=#303030
nnoremap <leader>I :call IndentGuides()<cr>
"" }}}
"" Easier split navigation ------------------------------------------{{{

" Use ctrl-[hjkl] to select the active split!
"nmap <silent> <c-k> :wincmd k<CR>
"nmap <silent> <c-j> :wincmd j<CR>
"nmap <silent> <c-h> :wincmd h<CR>
"nmap <silent> <c-l> :wincmd l<CR>
 "" }}}
"" Powerline setup --------------------------------------------------{{{ 
" set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 1
let g:Powerline_colorscheme = 'badwolf'
" }}}
