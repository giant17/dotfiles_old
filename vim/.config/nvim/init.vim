" Vim Config


" Download Plug manager if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List of plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'daeyun/vim-matlab'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'yinflying/matlab.vim'
Plug 'tpope/vim-markdown'
Plug 'reedes/vim-pencil'
Plug 'zchee/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
" Plug 'vim-syntastic/syntastic', {'for': 'python'}
Plug 'neomake/neomake'
Plug 'nvie/vim-flake8'
Plug 'xarthurx/taskwarrior.vim', {'on': 'TW' }
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'jreybert/vimagit', {'on': ['Magit', 'MagitOnly']}
Plug 'vimwiki/vimwiki' , {'on': ['VimwikiIndex', 'VimwikiMakeDiaryNote'] }
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'lambdalisue/suda.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'kassio/neoterm'
Plug 'altercation/vim-colors-solarized'
Plug 'dylanaraps/wal.vim'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
" Plug 'jvirtanen/vim-octave'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'jpalardy/vim-slime'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

call neomake#configure#automake('w')
"" GENERAL
let mapleader =","				" Set leader key to ,
syntax on						" Syntax detection TODO polyglot
filetype plugin on				" Filetype detection
set nocompatible				" Allow non user vim
set wildmode=longest,list,full	" Enable autocompletion
set tabstop=4					" Tab spaces
set shiftwidth=4				" When using Shift + > or <

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

set t_Co=16										" True colors
set encoding=utf-8								" Encoding stuff
set number relativenumber						" Display current line number


" Remember last position
if has("autocmd")
	  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif

""APPEARANCE
syntax enable
set background=dark
colorscheme solarized
"colorscheme wal

let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'


let g:limelight_conceal_ctermfg = 241  			" Solarized Base01
"let g:limelight_conceal_guifg = '#586e75' 		" Solarized Base02


" NAVIGATION
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

"Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Markdown
let g:table_mode_map_prefix = '<leader>m'		" Enable table mode
" Set vim wiki
let g:vimwiki_list = [{'path': '~/.wiki',
	                  \'syntax': 'markdown', 'ext': '.md',}]

let g:vimwiki_ext2syntax = {'.Rmd': 'markdown',
						   \'.rmd': 'markdown',
						   \'.md': 'markdown',
                           \'.markdown': 'markdown',
						   \'.mdown': 'markdown'}			" Vim Wiki

" Latex

" Filetypes tex
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd FileType tex set complete+=kspell
autocmd FileType tex setlocal spell

call deoplete#custom#var('omni', 'input_patterns', {
			\ 'tex': g:vimtex#re#deoplete
			\})

" Vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g_tex_conceal='abdmg'
"let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
autocmd FileType tex nnoremap <leader>c :VimtexCompile<cr>
autocmd FileType tex nnoremap <leader>w :VimtexCountWords<cr>

" autocmd FileType mail,tex,markdown,vimwiki nnoremap <leader>s :PencilToggle<cr>


augroup vimtex_config
  au!
  au User VimtexEventQuit call vimtex#compiler#clean(0)
augroup END

" Filetype
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd		" Update Binds
autocmd BufWritePost *Xresources,*Xdefaults !xrdb	" Run xrdb
autocmd BufRead bspwm_sxhkd set filetype=sxhkd

" Goyo

" Shortcut definition
map <leader>f :Goyo \| set linebreak<cr>

" Enable Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Goyo in Neomutt
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

" CODING

" Deoplete
autocmd InsertEnter * call deoplete#enable()
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:pymode_rope = 0
let g:pymode_folding=0

" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:loaded_python_provider = 1
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/bin/python3'
let g:UltiSnipsSnippetDir=["~/.config/nvim/UltiSnips"]
let g:vimwiki_table_mappings = 0
nmap <leader>b :UltiSnipsEdit<cr>
let g:vimwiki_autowriteall = 1


" Neoterm

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
" au VimEnter,BufRead,BufNewFile *.m set filetype=octave
let g:neoterm_repl_octave_qt = 1 " Activate Qt widgets for Octave

" Python
let g:SimpylFold_docstring_preview=1
let python_highlight_all=1

" let g:pymode_doc = 1
" let g:pymode_doc_bind = 'K'

" let g:pymode_run = 1
" let g:pymode_run_bind = '<leader>r'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:deoplete#sources#jedi#show_docstring = 1


xmap ga <Plug>(EasyAlign)

" Vifm
nnoremap <leader>n :Vifm<CR>


" Cursor
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" Neomake

" Run NeoMake on read and write operations
autocmd! BufReadPost,BufWritePost * Neomake

" Disable inherited syntastic
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": [],
  \ "passive_filetypes": [] }

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1


