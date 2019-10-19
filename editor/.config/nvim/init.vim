
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif


call plug#begin('~/.config/nvim/plugged')
Plug 'jreybert/vimagit', {'on': ['Magit', 'MagitOnly']}
Plug 'vimwiki/vimwiki'
Plug 'daeyun/vim-matlab'
Plug 'yinflying/matlab.vim'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
call plug#end()


let mapleader =","
syntax enable
filetype plugin on
set nocompatible
set wildmode=longest,list,full
set tabstop=4	
set shiftwidth=4
set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" Copy Paste
vnoremap <C-c> "+y
map <C-p> "+P
nnoremap c "_c

set t_Co=16										" True colors
set background=light


nnoremap <leader>M :Magit<CR>
autocmd BufWritePost ~/.config/shortcuts/directories,~/.config/shortcuts/files !shortcuts
