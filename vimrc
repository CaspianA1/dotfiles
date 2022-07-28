""""" Plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"The package manager I'm using
Plugin 'VundleVim/Vundle.vim'

Plugin 'valloric/youcompleteme' "Autocomplete (to fully install this, look up an installation guide)
Plugin 'scrooloose/nerdtree' "A directory explorer
Plugin 'vim-airline/vim-airline' "A nice status line
Plugin 'bfrg/vim-cpp-modern' "Better C syntax highlighting
Plugin 'tikhomirov/vim-glsl' "GLSL support

"Color schemes
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'lifepillar/vim-solarized8'

call vundle#end()

""""" Package settings

let g:airline#extensions#tabline#enabled = 1 "Shows all buffers in Airline
let g:cpp_member_highlight = 1 "Highlights directly referenced struct members (none via pointers)
let g:cpp_simple_highlight = 1 "Differentiates keywords and typenames when highlighted

""""" Various formatting settings

set number relativenumber "Hybrid line numbers
set autoindent smartindent "Automatic newline indentation
set shiftwidth=2 "Automatic indents have a width of two spaces
set tabstop=2 "One indentation level looks like two spaces
set softtabstop=2 "Backspaces have a width of two

"Associating the .pl extension with Prolog files, not Perl fikes
au BufRead,BufNewFile *.pl setlocal filetype=prolog

""""" Colorscheme settings

function ColorCmd(colorscheme, bg_color)
	execute printf("colorscheme %s | set bg=%s", a:colorscheme, a:bg_color)
endfunction

syntax enable

command Light call ColorCmd("solarized8", "light")
command Dark1 call ColorCmd("vim-monokai-tasty", "dark")
command Dark2 call ColorCmd("tokyonight", "dark")
command Default call ColorCmd("default", "light")

Dark2 "The default colorscheme

""""" Other stuff

function Windowed()
	vert term
	wincmd r "Swap terminal and code window positions
	wincmd w "Cursor to code window
	NERDTree

	wincmd w "Cursor to code window
	vertical resize +30 "More space for the code window
endfunction

command S call Windowed()

""""" 

"Random note on how to use buffers: :e opens one, :bn goes to the next one,
":bp to the last one, :bX goes to buffer number X, and :bd closes the current buffer.
":PluginInstall
