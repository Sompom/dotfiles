call plug#begin('~/.vim/plugged')

" basics
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-fugitive'

" snippet support
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" ctags
Plug 'craigemery/vim-autotag'

" autocomplete
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'Rip-Rip/clang_complete'

" navigating and searching
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/a.vim'

" smart tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color scheme
Plug 'tyrannicaltoucan/vim-quantum'

" Go Support
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
call plug#end()

" general settings
set nocp      
filetype plugin on      

" colorscheme and font
colorscheme quantum
let g:airline_theme='quantum'
set guifont=Cousine\ for\ Powerline:h13

" non-meta key mappings
:nmap ga <Plug>(EasyAlign)

" key mappings
" for xterm2
" opening, browsing, and closing the error list
:map ¬ :lopen<CR>
:map <M-l> :lopen<CR>
:map ∆ :lnext<CR>
:map <M-j> :lnext<CR>
:map ˚ :lprevious<CR>
:map <M-k> :lprevious<CR>
:map ˙ :lclose<CR>
:map <M-h> :lclose<CR>

" yanking and pasting
:map ç "*y<CR>
:map <M-c> "*y<CR>
:map √ "+p<CR> 
:map <M-v> "+p<CR>

" buffer navigation
:map ƒ :bn<CR>
:map <M-f> :bn<CR>
:map ∫ :bp<CR>
:map <M-b> :bp<CR>

" nerdtree
:map † :NERDTreeToggle<CR>
:map <M-t> :NERDTreeToggle<CR>

" easy align
:nmap å gaip
:nmap <M-a> gaip

" ycmcompleter
:nmap ¥ :YcmCompleter GetType<CR>
:nmap <M-y> :YcmCompleter GetType<CR>
:nmap ˜ :YcmCompleter GoToInclude<CR>
:nmap <M-n> :YcmCompleter GoToInclude<CR>
:nmap ∂ :YcmCompleter GoToDefinition<CR>
:nmap <M-d> :YcmCompleter GoToDefinition<CR>
:nmap ® :YcmCompleter GoToDeclaration<CR>
:nmap <M-r> :YcmCompleter GoToDeclaration<CR>

" smart tabline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" autocomplete settings
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" automatically open and close the popup menu / preview window      
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif      
set completeopt=menuone,menu,longest,preview

" fix the delete key in terminal
set backspace=indent,eol,start

" syntax highlighting
syntax on
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" set line numbers
set number

" set tab settings
" show existing tabs with my tab settings
filetype plugin indent on

" set tab to 2 spaces
set tabstop=4
set shiftwidth=4

" make sure pressing tab converts to 4 space
set expandtab

" auto insert header
autocmd bufnewfile *.c,*.cpp,*.h,*.cc
            \ exe "normal i" . 
            \ "/*" . "\n" .
            \ "filename: " . expand("%") . "\n" .
            \ "created by: Graham Zuber" . "\n" .
            \ "github: github.com/gzuber" . "\n" .
            \ "created: " . strftime("%d.%m.%Y") . "\n" .
            \ "last modified: " . strftime("%c") . "\n" .
            \ "\n" .
            \ "description: " . "\n\n" .
            \ "/" . "\n\n"

" auto update last modified line
autocmd bufwritepre *.c,*.cpp,*.h,*.cc
            \ silent!
            \ exe "normal mj"
autocmd bufwritepre *.c,*.cpp,*.h,*.cc
            \ silent!
            \ exe "1,10s/last modified:.*/last modified: " . strftime("%c") . "/g"
autocmd bufwritepre *.c,*.cpp,*.h,*.cc
            \ silent!
            \ exe "normal `j"

