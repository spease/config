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

" Turn off Vim's built-in syntax for LSP-capable languages
autocmd FileType rust syntax off
autocmd FileType python syntax off
autocmd FileType typescript syntax off

" Automatically resize panes when vim is resized
au VimResized * wincmd =

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
  Plug 'LnL7/vim-nix'
  Plug 'PProvost/vim-ps1'
  Plug 'andreasvc/vim-256noir'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'dyng/ctrlsf.vim'
  " Plug 'gergap/vim-ollama'
  Plug 'kchmck/vim-coffee-script'
  " Plug 'morhetz/gruvbox'
  Plug 'puremourning/vimspector'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  " Plug 'rust-lang/rust.vim'
  Plug 'dense-analysis/ale'
  " ciaranm/inkpot
  " chriskempson/base16-vim
  " Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
call plug#end()

" Colorscheme

set termguicolors
let &t_Cs = "\e[4:3m"   " start undercurl
let &t_Ce = "\e[4:0m"   " end undercurl

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "reddish"
set background=dark

let s:bright = '#e00000'
let s:orange = '#ff7700'
let s:yellow = '#e0a000'
let s:green = '#a0a000'
let s:normal = '#ff706e'
let s:red = '#d03000'
let s:dark_green = '#505000'
let s:dark_orange = '#803000'
let s:dark_red = '#400000'
let s:dark_yellow = '#805000'
let s:background = '#000000'

exe "hi NonText cterm=italic gui=italic guifg=" . s:dark_red . " guibg=" . s:background
exe "hi Normal guifg=" . s:red . " guibg=" . s:background
exe "hi Visual guifg=" . s:bright . " guibg=" . s:dark_red
exe "hi StatusLine cterm=italic gui=italic guifg=" . s:normal . " guibg=" . s:dark_red
exe "hi StatusLineNC cterm=italic gui=italic guifg=" . s:background . " guibg=" . s:dark_red
exe "hi VertSplit guifg=" . s:dark_red . " guibg=" . s:background

exe "hi Comment guifg=" . s:green . " guibg=" . s:background
exe "hi Todo cterm=bold gui=bold guifg=" . s:green . " guibg=" . s:background

exe "hi Function cterm=bold gui=bold guifg=" . s:red . " guibg=" . s:background
exe "hi Identifier cterm=none gui=none guifg=" . s:red . " guibg=" . s:background
exe "hi Statement cterm=bold gui=bold guifg=" . s:yellow . " guibg=" . s:background
exe "hi PreProc cterm=bold gui=bold guifg=" . s:orange . " guibg=" . s:background
exe "hi Type cterm=bold gui=bold guifg=" . s:red . " guibg=" . s:background
exe "hi Operator cterm=bold gui=bold guifg=" . s:red . " guibg=" . s:background

exe "hi Constant guifg=" . s:orange . " guibg=" . s:background
" exe "hi Special cterm=bold gui=bold guifg=" . s:orange . " guibg=" . s:background

exe "hi CursorLine cterm=none gui=none guibg=" . s:dark_red
exe "hi CursorLineNr cterm=italic gui=italic guifg=" . s:bright . " guibg=" . s:background
exe "hi LineNr cterm=italic gui=italic guifg=" . s:dark_red . " guibg=" . s:background
exe "hi SignColumn guibg=" . s:background

exe "hi SpellBad cterm=underline gui=undercurl guisp=" . s:red
exe "hi SpellCap cterm=underline gui=undercurl guisp=" . s:orange
exe "hi SpellLocal cterm=underline gui=undercurl guisp=" . s:yellow
exe "hi SpellRare cterm=underline gui=undercurl guisp=" . s:green

hi link ALEErrorSign LspErrorSign
hi link ALEWarningSign LspWarningSign
hi link ALEInfoSign LspInformationSign
hi link ALEStyleErrorSign LspHintSign
exe "hi ALESyleWarningSign cterm=italic gui=italic guifg=" . s:dark_red . " guibg=" . s:dark_green

exe "hi ALEVirtualTextError cterm=italic gui=italic guifg=" . s:green . " guibg=" . s:red
exe "hi ALEVirtualTextWarning cterm=italic gui=italic guifg=" . s:background . " guibg=" . s:orange
exe "hi ALEVirtualTextInfo cterm=italic gui=italic guifg=" . s:green . " guibg=" . s:yellow
exe "hi ALEVirtualTextSyleError cterm=italic gui=italic guifg=" . s:green . " guibg=" . s:dark_red
exe "hi ALEVirtualTextSyleWarning cterm=italic gui=italic guifg=" . s:green . " guibg=" . s:dark_green

exe "hi lspInlayHintsParameter cterm=italic gui=italic guifg=" . s:dark_green
exe "hi lspInlayHintsType cterm=bold,italic gui=bold,italic guifg=" . s:dark_green

exe "hi LspHint cterm=italic gui=italic guifg=" . s:background . " guibg=" . s:background

exe "hi LspCodeActionText cterm=italic gui=italic guifg=" . s:red . " guibg=" . s:background
exe "hi LspErrorText cterm=italic gui=italic guifg=" . s:red . " guibg=" . s:dark_red
exe "hi LspWarningText cterm=italic gui=italic guifg=" . s:orange . " guibg=" . s:dark_orange
exe "hi LspInformationText cterm=italic gui=italic guifg=" . s:yellow . " guibg=" . s:dark_yellow
exe "hi LspHintText cterm=italic gui=italic guifg=" . s:green . " guibg=" . s:dark_green

exe "hi LspWarningHighlight cterm=underline gui=undercurl guisp=" . s:orange

exe "hi LspErrorSign cterm=italic gui=italic guifg=" . s:red . " guibg=" . s:background
exe "hi LspWarningSign cterm=italic gui=italic guifg=" . s:dark_orange . " guibg=" . s:background
exe "hi LspInformationSign cterm=italic gui=italic guifg=" . s:yellow . " guibg=" . s:background
exe "hi LspHintSign cterm=italic gui=italic guifg=" . s:green . " guibg=" . s:background
exe "hi LspReference cterm=underline"

hi link rustLifetime Type
" hi link rustModPath Include
exe "hi Include guifg=" . s:red . " guibg=" . s:background

let g:ale_disable_lsp = 1 " use vim-lsp
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_linters = {'rust': ['analyzer']}
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_rust_analyzer_config = {
\   'rust-analyzer': {
\     'semanticHighlighting': v:true,
\     'procMacro': {
\       'enable': v:true,
\     },
\     'cargo': {
\       'loadOutDirsFromCheck': v:true,
\     },
\   }
\}

nmap <F12> :ALEGoToDefinition<CR>

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_root_markers = [ 'BUCK', 'Cargo.toml', 'pom.xml', '.p4ignore' ]
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --no-messages --glob ""'
endif
let g:ctrlp_clear_cache_on_exit = 0

autocmd FileType rust syntax clear
autocmd FileType rust setlocal syntax=
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_highlight_references_enabled = 1
let g:lsp_inlay_hints_enabled = 1
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:lsp_semantic_force = 1
let g:lsp_semantic_enabled = 1
let g:lsp_semantic_highlighting = 1

autocmd User lsp_server_init call timer_start(500, {-> execute('doautocmd BufEnter')})

" ctrlsf
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

set wildignore+=*/.git/*,*/tmp/*,*.swp
