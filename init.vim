

inoremap kj <esc>
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-airline/vim-airline'
Plug 'SirVer/ultisnips'
Plug 'justinmk/vim-syntax-extra'
Plug 'tpope/vim-sleuth'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite.vim'
"Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim'
"Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tjdevries/edit_alternate.vim'
" Used for cleanier code and reusable functions
Plug 'tjdevries/standard.vim'
" Used for configuration and generating menus/documentation
Plug 'tjdevries/conf.vim'
Plug 'tjdevries/fold_search.vim'
Plug 'tjdevries/syntax_objects.vim'
Plug 'skywind3000/quickmenu.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'godlygeek/tabular'
Plug 'Shougo/denite.nvim'
"Plug 'vim-syntastic/syntastic'
Plug 'mhinz/vim-startify'
Plug 'rhysd/vim-clang-format'
Plug 'Chiel92/vim-autoformat'
call plug#end()
colorscheme gruvbox
set background=dark

syntax on

set clipboard=unnamedplus

set ruler
set relativenumber
set number
set smartcase

let mapleader = ","
"strip white space
nnoremap <leader>sws :%s/\s\+$//<CR>
"Denite fuzzy search
nnoremap <leader>fs :Denite grep:`systemlist('pwd')[0]`<CR>
nnoremap <leader>fw :Denite grep:`systemlist('pwd')[0]`<CR><c-r><c-w><cr>
"Unite fuzzy search
nnoremap <silent> <leader>f :<C-u>Unite -start-insert buffer file_rec<CR>
"edit alternate
nnoremap <leader>ea :EditAlternate<CR>
"window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Tag go
nnoremap <leader>tg <C-]>
"Tag new window
nnoremap <leader>tw <C-w><C-]>
"Tag new tab
nnoremap <leader>tt <C-w><C-]><C-w>T
"dont use arrowkeys
nnoremap <Up>          :echom "--> k <-- "<CR>
nnoremap <Down>        :echom "--> j <-- "<CR>
nnoremap <Right>       :echom "--> l <-- "<CR>
nnoremap <Left>        :echom "--> h <-- "<CR>

inoremap <Up>     <C-o>:echom "--> k <-- "<CR>
inoremap <Down>   <C-o>:echom "--> j <-- "<CR>
inoremap <Right>  <C-o>:echom "--> l <-- "<CR>
inoremap <Left>   <C-o>:echom "--> h <-- "<CR>
"remove pord
nnoremap <leader>rw "tdwP
"astyle
nnoremap <leader>as :%!astyle --options=/home/sam/TraegerLink/Link/.astylerc<CR>


"'tjdevries/syntax_objects.vim'
" <leader> Next Function
nnoremap <buffer> <leader>nf :call syntax_objects#move_to_group('cUserFunction',
    \ {'ignore_current': v:true, 'direction': 1, 'check_trans': 1})<CR>

" <leader> Previous Function
nnoremap <buffer> <leader>pf :call syntax_objects#move_to_group('cUserFunction',
    \ {'ignore_current': v:true, 'direction': -1, 'check_trans': 1})<CR>

" <leader> Next Type
nnoremap <buffer> <leader>nt :call syntax_objects#move_to_group('cType',
    \ {'ignore_current': v:true, 'direction': 1, 'check_trans': 1})<CR>

" <leader> Previous Type
nnoremap <buffer> <leader>pt :call syntax_objects#move_to_group('cType',
    \ {'ignore_current': v:true, 'direction': -1, 'check_trans': 1})<CR>

nnoremap <buffer> <leader>nfd :call search('^\}') <bar> call syntax_objects#move_to_group('cUserFunction',
    \ {'direction': 1})<CR>

function! s:syntax_names() abort
  let l:syntax_list = []
  for id in synstack(line('.'), col('.'))
    let base_name = synIDattr(id, 'name')
    let trans_name = synIDattr(synIDtrans(id), 'name')

    call add(l:syntax_list, base_name)
    if !(base_name is trans_name)
      call add(l:syntax_list, trans_name)
    endif
  endfor

  return l:syntax_list
endfunction

" Syntax help
nnoremap <leader>sh :echo string(<SID>syntax_names())<CR>
"clang format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "BreakBeforeBraces": "Allman",
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "ColumnLimit": 100,
            \ "Standard" : "C++11"}

"autoformat
let g:formatterpath = ['/usr/bin/astyle']
let b:formatdef_custom_c='"astyle --mode=c --suffix=none --options=/home/sam/TraegerLink/Link/.astylerc"'
let b:formatters_c = ['custom_c']
"deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_smart_case = 1

"syntastic
"let g:syntastic_c_checkers = ['gcc']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"edit alternate
"call edit_alternate#rule#add('c', {filename -> edit_alternate#util#change_folder(filename, 'include', 'h')})
"call edit_alternate#rule#add('h', {filename -> edit_alternate#util#change_folder(filename, 'src', 'c')})

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

set wrap
set textwidth=120
set colorcolumn=120
" Make it so that long lines wrap smartly
set breakindent
let &showbreak=repeat(' ', 3)
set linebreak

" Always use spaces instead of tab characters
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

if has('nvim')
    " Make esc leave terminal mode
    tnoremap <Esc> <C-\><C-n>
    tnoremap kj <C-\><C-n>
endif
