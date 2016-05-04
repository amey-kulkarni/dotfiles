" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
" set backspace=2
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set ignorecase      " ignore case when searching...
set smartcase       " ... until we encounter a capital letter
set incsearch		" do incremental searching

set lazyredraw
set showmatch
set mat=2

set linebreak       " wrap lines at word boundaries

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  nnoremap t :set invhlsearch<CR>
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END
  
  augroup filetypedetect
    au! BufRead,BufNewFile *.sv  setfiletype SV
    au! BufRead,BufNewFile *.svi setfiletype SV
  augroup END

  map <C-L> :!~/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

  set tags=~/.vim/stdtags,tags,./tags,../tags,./stm/tags,./common/dv/uvm/agents/bea_agent/tags,./common/dv/uvm/agents/nevt_agent/tags,./common/dv/uvm/agents/sfa_agent/tags;

  autocmd InsertLeave * if pumvisible() == 0|pclose|endif

  au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v so ~/.vim/syntax/verilog_systemverilog.vim
else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" To insert spaces instead of tabs. Use 4 space for tab and 4 spaces for indentation. 
set expandtab 
set smarttab
set smartindent
set tabstop=4
set shiftwidth=4
set autoread
set mouse=a         " Enable mouse
set completeopt=longest,menu,preview

" Code folding settings
set foldmethod=indent   " fold based on indent
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " don't fold by default
set foldlevel=1

set number              " display line numbers

set wildmenu            " enable menu at the bottom of the window
set wildmode=list:longest,full      " On first <tab>, a list of completions will be shown and command will
                                    " completed to the longest common command.
                                    " On second <tab>, the wildmenu will show
                                    " up with all the completions that were
                                    " listed before.

" Browser-like tab navigation
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>i

if exists("did_load_filetypes")
    finish
endif


