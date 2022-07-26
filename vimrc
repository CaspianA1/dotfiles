""""" Plugins

" See how to install `plug` here: https://github.com/junegunn/vim-plug
" Type `:source %`, and then `:PlugInstall` to install any packages.
call plug#begin()

Plug 'valloric/youcompleteme' " Autocomplete (to fully install this, look up an installation guide)
Plug 'scrooloose/nerdtree' " A directory explorer
Plug 'vim-airline/vim-airline' " A nice status line
Plug 'bfrg/vim-cpp-modern' " Better C syntax highlighting
Plug 'tikhomirov/vim-glsl' " GLSL support

" Color schemes
Plug 'lifepillar/vim-gruvbox8' " A variety of dark and light colorschemes
Plug 'ghifarit53/tokyonight-vim' " A cool dark colorscheme

call plug#end()

""""" Package settings

let g:airline#extensions#tabline#enabled = 1 " Shows all buffers in Airline
let g:cpp_member_highlight = 1 " Highlights directly referenced struct members (none via pointers)
let g:cpp_simple_highlight = 1 " Differentiates keywords and typenames when highlighted

""""" Various formatting settings

set number relativenumber " Hybrid line numbers
set autoindent smartindent " Automatic newline indentation
set shiftwidth=2 " Automatic indents have a width of two spaces
set tabstop=2 " One indentation level looks like two spaces
set softtabstop=2 " Backspaces have a width of two

" Associating the .pl extension with Prolog files, not Perl files
au BufRead,BufNewFile *.pl setlocal filetype=prolog

""""" Colorscheme settings

function ColorCmd(colorscheme, bg_color)
	execute printf("colorscheme %s | set bg=%s", a:colorscheme, a:bg_color)
endfunction

command Light call ColorCmd("gruvbox8_soft", "light")
command Dark call ColorCmd("tokyonight", "dark")
command DarkSoft call ColorCmd("gruvbox8_soft", "dark")
command DarkHard call ColorCmd("gruvbox8_hard", "dark")
command Default call ColorCmd("default", "light")

DarkSoft " The default colorscheme

""""" Other stuff

function Windowed()
	vert term
	wincmd r " Swap terminal and code window positions
	wincmd w " Cursor to code window
	NERDTree

	wincmd w " Cursor to code window
	vertical resize +30 " More space for the code window
endfunction

command S call Windowed()

" Random note on how to use buffers: :e opens one, :bn goes to the next one,
" :bp to the last one, :bX goes to buffer number X, and :bd closes the current buffer.
" Also, to redo a command that was undone, press Ctrl-R.
