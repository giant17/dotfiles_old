let mapleader =","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" List of plugins
call plug#begin('~/.config/nvim/plugged')

" TRYING
Plug 'vifm/vifm.vim'



" Syntax
Plug 'yinflying/matlab.vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'PotatoesMaster/i3-vim-syntax'

" Theme
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/goyo.vim'
Plug 'daeyun/vim-matlab'
Plug 'reedes/vim-pencil'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
" Plug 'vim-syntastic/syntastic', {'for': 'python'}
Plug 'neomake/neomake'
Plug 'nvie/vim-flake8'
Plug 'xarthurx/taskwarrior.vim', {'on': 'TW' }
"Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'jreybert/vimagit', {'on': ['Magit', 'MagitOnly']}
Plug 'vimwiki/vimwiki' , {'on': ['VimwikiIndex', 'VimwikiMakeDiaryNote'] }
Plug 'tpope/vim-commentary'
Plug 'lambdalisue/suda.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/vim-easy-align'
call plug#end()

map <leader>n :Vifm<CR>

" netrw
let g:netrw_banner=0
let g:netrw_listyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

" Tag Jumping
command! MakeTags !ctags -R .

" lightline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

set path+=**
set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd

" TODO: Sudo setup
" Shortcut for writing with sudo permissions
cmap w!! w suda://%


"cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

call neomake#configure#automake('w')
"" GENERAL
let mapleader =","				" Set leader key to ,
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
set background=dark
colorscheme solarized
"colorscheme wal

"let g:airline_powerline_fonts = 1
"let g:airline_solarized_bg='dark'


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

" call deoplete#custom#var('omni', 'input_patterns', {
" 			\ 'tex': g:vimtex#re#deoplete
" 			\})

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
" autocmd InsertEnter * call deoplete#enable()
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
" let g:deoplete#sources#jedi#show_docstring = 1


xmap ga <Plug>(EasyAlign)

" Vifm
"nnoremap <leader>n :Vifm<CR>


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


















" SNIPPETS

"""LATEX
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

"""HTML
	autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
	autocmd FileType html inoremap ,it <em></em><Space><++><Esc>FeT>i
	autocmd FileType html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
	autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
	autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
	autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
	autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
	autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
	autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
	autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
	autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
	autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
	autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
	autocmd FileType html inoremap &<space> &amp;<space>
	autocmd FileType html inoremap á &aacute;
	autocmd FileType html inoremap é &eacute;
	autocmd FileType html inoremap í &iacute;
	autocmd FileType html inoremap ó &oacute;
	autocmd FileType html inoremap ú &uacute;
	autocmd FileType html inoremap ä &auml;
	autocmd FileType html inoremap ë &euml;
	autocmd FileType html inoremap ï &iuml;
	autocmd FileType html inoremap ö &ouml;
	autocmd FileType html inoremap ü &uuml;
	autocmd FileType html inoremap ã &atilde;
	autocmd FileType html inoremap ẽ &etilde;
	autocmd FileType html inoremap ĩ &itilde;
	autocmd FileType html inoremap õ &otilde;
	autocmd FileType html inoremap ũ &utilde;
	autocmd FileType html inoremap ñ &ntilde;
	autocmd FileType html inoremap à &agrave;
	autocmd FileType html inoremap è &egrave;
	autocmd FileType html inoremap ì &igrave;
	autocmd FileType html inoremap ò &ograve;
	autocmd FileType html inoremap ù &ugrave;


""".bib
	autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

"MARKDOWN
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
	autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

""".xml
	autocmd FileType xml inoremap ,e <item><Enter><title><++></title><Enter><guid<space>isPermaLink="false"><++></guid><Enter><pubDate><Esc>:put<Space>=strftime('%a, %d %b %Y %H:%M:%S %z')<Enter>kJA</pubDate><Enter><link><++></link><Enter><description><![CDATA[<++>]]></description><Enter></item><Esc>?<title><enter>cit
	autocmd FileType xml inoremap ,a <a href="<++>"><++></a><++><Esc>F"ci"
