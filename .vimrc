" UTF-8
set encoding=UTF-8

" Fix NerdTree Color
let g:airline_powerline_fonts=1
" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

autocmd VimEnter * call NERDTreeHighlightFile('sh', 'green', 'none', 'green', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('adoc', 'blue', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('bashrc', 'yellow', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('bashprofile', 'yellow', 'none', '#686868', '#151515')

" Spell Check
"set spell spelllang=en_us,de_de
set spellfile=~/.vim/spell/en.utf-8.add
map <F6> :setlocal spell! spelllang=en_us,de_de<CR>

" https://github.com/moll/vim-bbye
set runtimepath^=~/.vim/bundle/bbye

" What to use for HTML, default `asciidoctor`.
let g:asciidoctor_executable = 'asciidoctor'

" What extensions to use for HTML, default `[]`.
let g:asciidoctor_extensions = ['asciidoctor-diagram', 'asciidoctor-rouge']

" Path to the custom css
let g:asciidoctor_css_path = '~/docs/AsciiDocThemes'

" Custom css name to use instead of built-in
let g:asciidoctor_css = 'haba-asciidoctor.css'

" What to use for PDF, default `asciidoctor-pdf`.
let g:asciidoctor_pdf_executable = 'asciidoctor-pdf'

" What extensions to use for PDF, default `[]`.
let g:asciidoctor_pdf_extensions = ['asciidoctor-diagram']

" Path to PDF themes, default `''`.
let g:asciidoctor_pdf_themes_path = '~/docs/AsciiDocThemes'

" Path to PDF fonts, default `''`.
let g:asciidoctor_pdf_fonts_path = '~/docs/AsciiDocThemes/fonts'

" Fold sections, default `0`.
" let g:asciidoctor_folding = 1

" Fold options, default `0`.
" let g:asciidoctor_fold_options = 1

" Conceal *bold*, _italic_, `code` and urls in lists and paragraphs, default `0`.
" See limitations in end of the README
let g:asciidoctor_syntax_conceal = 0

" Highlight indented text, default `1`.
let g:asciidoctor_syntax_indented = 1

" List of filetypes to highlight, default `[]`
let g:asciidoctor_fenced_languages = ['python', 'asciidoc', 'javascript']

" Function to create buffer local mappings and add default compiler
fun! AsciidoctorMappings()
    nnoremap <buffer> <leader>oo :AsciidoctorOpenRAW<CR>
    nnoremap <buffer> <leader>op :AsciidoctorOpenPDF<CR>
    nnoremap <buffer> <leader>oh :AsciidoctorOpenHTML<CR>
    nnoremap <buffer> <leader>ox :AsciidoctorOpenDOCX<CR>
    nnoremap <buffer> <leader>ch :Asciidoctor2HTML<CR>
    nnoremap <buffer> <leader>cp :Asciidoctor2PDF<CR>
    nnoremap <buffer> <leader>cx :Asciidoctor2DOCX<CR>
    nnoremap <buffer> <leader>p :AsciidoctorPasteImage<CR>
    " :make will build pdfs
    compiler asciidoctor2pdf
endfun

" Call AsciidoctorMappings for all `*.adoc` and `*.asciidoc` files
augroup asciidoctor
    au!
    au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
augroup END

set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" if has('filetype')
"  filetype indent plugin on
" endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
" Plug 'junegunn/seoul256.vim'
Plug 'preservim/nerdtree'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Nerdtree Sync - Sync file location with open file
Plug 'unkiwii/vim-nerdtree-sync'
" Better Bottom Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Shows Git status flags for files and folders in NERDTree.
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Adds filetype-specific icons to NERDTree files and folders,
" needs this font as console font on the SSH client! ttf-jetbrains-mono-nerd                              
Plug 'ryanoasis/vim-devicons' 
" Adds syntax highlighting to NERDTree based on filetype.                                                                                                                            
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
let g:airline_statusline_ontop=0
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
" ~/full/path-to/file-name.js
let g:airline#extensions#tabline#formatter = 'default'  " f/p/file-name.js
"let g:airline#extensions#tabline#formatter = 'jsformatter' " path-to/f
"let g:airline#extensions#tabline#formatter = 'unique_tail' " file-name.js
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " f/p/file-name.js


" Nerdtree Sync - Sync file location with open file 
let g:NERDTreeHighlightCursorline = 1

" Adds syntax highlighting to NERDTree based on filetype.
"let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
"let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1


" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<S-j>'
let g:UltiSnipsJumpBackwardTrigger='<S-k>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']  

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Nerdtree in the current dir
"nnoremap <C-y> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
" vmap ++ <plug>NERDTreeToggle
" nmap ++ <plug>NERDTreeToggle
let g:NERDTreeQuitOnOpen=1

" Nerdtree - jump to currently open file
"autocmd BufEnter * silent! if bufname('%') !~# 'NERD_tree_' | cd %:p:h | NERDTreeCWD | wincmd p | endif

" map nerdtree to the ctrl+n
function MyNerdToggle()
    if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction

nnoremap <C-y> :call MyNerdToggle()<CR>

" Nerdtree open automatically
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Split navigation
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

" Buffer navigation (Tabs)
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <C-t> :enew<cr>

" Move to the next buffer
nmap <C-l> :bnext<CR>

" Move to the previous buffer
nmap <C-h> :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab with: qb command
":nnoremap <C-e> :Bdelete<CR>
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("qb","Bdelete")

" Show all open buffers and their status
"nmap <leader>bl :ls<CR>

" Build asciidoxy files
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("build",":w<CR>:call system('/home/user/docs/build.sh')<CR>")

" Use F5 to save and build
map <F5> :w<CR>:call system('/home/user/docs/build.sh')<CR>
" Enable mouse scrolling
"set mouse=a

