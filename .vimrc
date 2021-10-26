" Color ""
set background=dark

" Positional "
set number
set cursorline

" Indentation "
set expandtab
set shiftwidth=2
set tabstop=2

" Status "
set laststatus=2
"set statusline+=%f

"hi cCustomFunc  gui=bold guifg=yellowgreen
"hi cCustomClass gui=reverse guifg=#00FF00

syntax on
filetype on
au BufNewFile,BufRead *.pde set filetype=cpp

call plug#begin('~/.vim/plugged')
  function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
      !./install.py --all
    endif
  endfunction
  Plug 'PProvost/vim-ps1'
  Plug 'andreasvc/vim-256noir'
  " Plug 'ctrlpvim/ctrlp.vim'
  Plug 'dyng/ctrlsf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'morhetz/gruvbox'
  Plug 'puremourning/vimspector'
  Plug 'rust-lang/rust.vim'
  Plug 'w0rp/ale'
  " ciaranm/inkpot
  " chriskempson/base16-vim
  " Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
call plug#end()

let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

nmap <F12> :ALEGoToDefinition<CR>

set termguicolors
" colorscheme mayo
" colorscheme 256_noir
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_root_markers = [ 'Cargo.toml', 'pom.xml', '.p4ignore' ]
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --no-messages --glob ""'
endif
let g:ctrlp_clear_cache_on_exit = 0

" ctrlsf
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" fzf
nmap <C-P> :FZF<CR>

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

set wildignore+=*/.git/*,*/tmp/*,*.swp
