
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/plugged')
Plug 'xarthurx/taskwarrior.vim', {'on': 'TW' }
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'jreybert/vimagit', {'on': ['Magit', 'MagitOnly']}
Plug 'vimwiki/vimwiki'   ", {'on': ['VimwikiIndex', 'VimwikiMakeDiaryNote'] }
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'kassio/neoterm'
Plug 'altercation/vim-colors-solarized'
Plug 'dylanaraps/wal.vim'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'ap/vim-css-color'
Plug 'jvirtanen/vim-octave'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'jpalardy/vim-slime'
call plug#end()

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{bottom}"}

syntax enable
set background=dark
colorscheme solarized
call togglebg#map("<F6>")
" set termguicolors

"" GENERAL
let mapleader =","				" Set leader key to ,
syntax on						" Syntax detection TODO polyglot
filetype plugin on				" Filetype detection
set nocompatible				" Allow non user vim
set wildmode=longest,list,full	" Enable autocompletion
set tabstop=4					" Tab spaces
set shiftwidth=4				" When using Shift + > or <

" Enable sudo on vim
cmap w!! w !sudo tee > /dev/null %

" Stuff to understand
set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Handle copy paste
vnoremap <C-c> "+y
map <C-p> "+P
nnoremap c "_c

" Remeber last position TODO: control vim speed without
if has("autocmd")
	  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif

"" APPEARANCE
set t_Co=16										" True colors
set encoding=utf-8								" Encoding stuff
set number relativenumber						" Display current line number

" TODO Improve mune selection colors
hi Pmenu ctermfg=24 ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=236 ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE
" Limelight settings
" let g:limelight_conceal_ctermfg = 240  			" Solarized Base01
" let g:limelight_conceal_guifg = '#586e75' 		" Solarized Base02

"" NAVIGATION
set splitbelow splitright 	" Split open at the bottom and right

" Shortcuts
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-Q> <C-W><C-Q>
nnoremap <Space> <C-D>
nnoremap <C-Space> <C-U>
nnoremap <silent> <leader>+ :resize<space>+10<cr>
nnoremap <silent> <leader>- :resize<space>-10<cr>
nnoremap <silent> <leader>< :vertical resize<space>+10<cr>
nnoremap <silent> <leader>. :vertical resize<space>-10<cr>

" Guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

"" WRITING

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

let g:table_mode_map_prefix = '<leader>m'		" Enable table mode

" Set filetypes
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown',
			               \'.rmd': 'markdown',
						   \'.md': 'markdown',
						   \'.markdown': 'markdown',
						   \'.mdown': 'markdown'}			" Vim Wiki

" Set vim wiki
let g:vimwiki_list = [{'path': '~/documents/wiki',
	                  \'syntax': 'markdown', 'ext': '.md',}]


" TODO Spelling
" autocmd FileType vimwiki set complete+=kspell
" autocmd FileType vimwiki setlocal spell

" Filetypes tex
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd FileType tex set complete+=kspell
autocmd FileType tex setlocal spell

" Filetype
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff


autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd		" Update Binds
autocmd BufWritePost *Xresources,*Xdefaults !xrdb	" Run xrdb
autocmd BufRead bspwm_sxhkd set filetype=sxhkd


" TODO Set scripts

" Shortcut definition
map <leader>f :Goyo \| set linebreak<cr>

" Enable Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Goyo in Neomutt
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo


" TODO: set coding





" DEOPLETE
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:jedi#completions_enabled = 0
" " open the go-to function in split, not another buffer
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:pymode_rope = 0
let g:pymode_folding=0


" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" Ultisnips tabs
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
let g:UltiSnipsEditSplit="vertical"

" Ultisnips performance
let g:loaded_python_provider = 1
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/bin/python3'
" Ultisnips folders
let g:UltiSnipsSnippetDir=["~/.config/nvim/UltiSnips"]
let g:vimwiki_table_mappings = 0
autocmd FileType vimwiki UltiSnipsAddFiletypes markdown
nmap <leader>b :UltiSnipsEdit<cr>
let g:vimwiki_autowriteall = 1

" Terminal buffer exit as others
tnoremap <Esc> <C-\><C-n>

let g:neoterm_autoscroll = '1'			" Scroll with output
let g:neoterm_default_mod='belowright'  " Terminal lower in the right

" Send commands
nnoremap <leader>c :TREPLSendLine<cr>j
vnoremap <leader>c :TREPLSendSelection<cr>
map <leader>tt :Tnew<cr>
map <leader>tc :Tclear!<cr>
map <leader>tk :Tkill!<cr>
au VimEnter,BufRead,BufNewFile *.m set filetype=octave
let g:neoterm_repl_octave_qt = 1 " Activate Qt widgets for Octave
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd FileType tex set complete+=kspell
autocmd FileType tex setlocal spell

" Enable Vimtex plugin
let g:tex_flavor = 'latex'
let g:vimtex_view_method='zathura'
" let g:vimtex_quickfix_mode=0
" set conceallevel=1
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'

" Shortcut
autocmd FileType tex nnoremap <leader>c :VimtexCompile<cr>
autocmd FileType tex nnoremap <leader>w :VimtexCountWords<cr>

