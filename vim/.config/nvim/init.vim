" PLUGINS {{{

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
" Testing
Plug 'vifm/vifm.vim'
Plug 'neomake/neomake'

Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-commentary'
Plug 'jreybert/vimagit', {'on': ['Magit', 'MagitOnly']}
Plug 'vimwiki/vimwiki' , {'on': ['VimwikiIndex', 'VimwikiMakeDiaryNote'] }
Plug 'daeyun/vim-matlab'
Plug 'yinflying/matlab.vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'

call plug#end()

" }}}
" TESTING {{{

" Neomake
call neomake#configure#automake('w')

" Vifm
nnoremap - :Vifm<CR>
" }}}
" GENERAL {{{
syntax enable						" Syntax detection TODO polyglot
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
"
"" Handle copy paste
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

" enable sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" }}}
" APPEARANCE {{{

set background=dark
colorscheme solarized

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" Cursor
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
" }}}
" NAVIGATION {{{
set splitbelow splitright 	" Split open at the bottom and right

" Shortcuts
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
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

" }}}
" WRITING {{{

"Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Markdown
let g:table_mode_map_prefix = '<leader>m'		" Enable table mode
" Set vim wiki
let g:vimwiki_list = [{'path': '~/repos/writings/wiki',
	                  \'syntax': 'markdown', 'ext': '.md',}]

let g:vimwiki_ext2syntax = {'.Rmd': 'markdown',
						   \'.rmd': 'markdown',
						   \'.md': 'markdown',
                           \'.markdown': 'markdown',
						   \'.mdown': 'markdown'}			" Vim Wiki

" Latex

map <leader>s :!clear && shellcheck %<CR>

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %


" Filetypes tex
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd FileType tex set complete+=kspell
autocmd FileType tex setlocal spell

" Filetype
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd		" Update Binds
autocmd BufWritePost *Xresources,*Xdefaults !xrdb	" Run xrdb
autocmd BufRead bspwm_sxhkd set filetype=sxhkd

" Goyo
map <leader>f :Goyo \| set linebreak<cr>

" Goyo in Neomutt
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo
" }}}
" MATLAB {{{

let g:matlab_server_split = 'horizontal' "launch the server in a horizontal split
let g:matlab_server_launcher = 'tmux' "launch the server in a tmux split
let g:matlab_auto_mappings = 0 "automatic mappings disabled

nmap <leader>q :MatlabLaunchServer
autocmd FileType matlab nnoremap <buffer>,c :MatlabLaunchServer<cr>
autocmd FileType matlab vnoremap <buffer><silent><C-c><C-c> <ESC>:MatlabCliRunSelection<CR>
autocmd FileType matlab nnoremap <buffer><silent><C-c><C-c> <ESC>:MatlabCliRunCell<CR>
autocmd FileType matlab nnoremap <buffer><silent>,s :MatlabCliRunLine<CR>
autocmd FileType matlab nnoremap <buffer><silent><C-c><C-l> :MatlabNormalModeCreateCell
autocmd FileType matlab nnoremap <buffer><silent>,h <ESC>:MatlabCliHelp<CR>


"autocmd FileType matlab nnoremap <buffer>         <leader>rn :MatlabRename
"autocmd FileType matlab nnoremap <buffer><silent> <leader>fn :MatlabFixName<CR>
"autocmd FileType matlab nnoremap <buffer><silent> <M-h> :MatlabCliRunLine<CR>
"autocmd FileType matlab nnoremap <buffer><silent> ,i <ESC>:MatlabCliViewVarUnderCursor<CR>
"autocmd FileType matlab vnoremap <buffer><silent> ,i <ESC>:MatlabCliViewSelectedVar<CR>
"autocmd FileType matlab nnoremap <buffer><silent> ,e <ESC>:MatlabCliOpenInMatlabEditor<CR>
"autocmd FileType matlab nnoremap <buffer><silent> <leader>c :MatlabCliCancel<CR>

autocmd FileType matlab setlocal commentstring=%\ %s
" }}}
" SNIPPETS {{{
"" matlab {{{

"" }}}
"" latex {{{
	nnoremap ,latex :-1read $HOME/.local/share/templates/latex.tex<CR>


	autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

	" Word count:
	autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>
	" Code snippets
	autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
	autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,li <Enter>\item<Space>
	autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
	autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
	autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,bt {\blindtext}
	autocmd FileType tex inoremap ,nu $\varnothing$
	autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i
"" }}}
"" markdown {{{
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
	autocmd Filetype markdown,rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO
	autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
"" }}}
" }}}
" vim: set fdm=marker fmr={{{,}}} fdl=0 :
