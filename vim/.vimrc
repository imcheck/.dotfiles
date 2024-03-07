set nu
set autoindent
set autowrite
set autoread
set laststatus=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent smartindent
set tabstop=2
set hlsearch

colorscheme habamax

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" NERDTree
let NERDTreeShowHidden=1 " Show hidden files
nnoremap <silent> <C-e> :NERDTreeFind<CR>

" Key Mappings (Pane)
nnoremap <silent> <C-a> ^
nnoremap <silent> <C-\> :vertical split<CR>
nnoremap <silent> <C-_> :split<CR>

" Key Mappings (Pane Size)
nnoremap <A-S-Left> <C-W>>
nnoremap <A-S-Right> <C-W><
nnoremap <A-S-Up> <C-W>+
nnoremap <A-S-Down> <C-W>-

" Terraform auto fmt
let g:terraform_fmt_on_save=1

" Tab indent
vmap <Tab> >gv
vmap <S-Tab> <gv

" Vim-go
filetype plugin indent on

let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

let g:go_auto_type_info = 1

au filetype go inoremap <buffer> . .<C-x><C-o><C-p>
set completeopt-=preview
