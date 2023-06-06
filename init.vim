set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

""""" Plugins

" See how to install `plug` here: https://github.com/junegunn/vim-plug
" Type `:source %`, and then `:PlugInstall` to install any packages.
call plug#begin()

Plug 'scrooloose/nerdtree' " A directory explorer
Plug 'vim-airline/vim-airline' " A nice status line
Plug 'bfrg/vim-cpp-modern' " Better C syntax highlighting
Plug 'tikhomirov/vim-glsl' " GLSL support
Plug 'lifepillar/vim-gruvbox8' " A variety of light and dark colorschemes
Plug 'sickill/vim-monokai' " A cool bright colorscheme

call plug#end()

""""" Package settings

let g:airline#extensions#tabline#enabled=1 " Shows all buffers in Airline, instead of just one at a time
let g:cpp_member_highlight=1 " Highlights directly referenced struct members (none via pointers)
let g:cpp_simple_highlight=1 " Differentiates keywords and typenames when highlighted

""""" Various line number + formatting settings

set number relativenumber " Hybrid line numbers
set autoindent smartindent " Automatic indentation

set tabstop=2 " 1 tab looks like 2 spaces
set softtabstop=-1 " Pressing the tab key gives `tabstop` spaces
set shiftwidth=0 " Automatic indents give `tabstop` spaces

" Associating the .pl extension with Prolog files, not Perl files
au BufRead,BufNewFile *.pl setlocal filetype=prolog

""""" Neovim terminal settings (https://vi.stackexchange.com/questions/3670)

" Vim's Ctrl-w now maps to the Neovim equivalent
tnoremap <C-w> <C-\><C-n><C-w>

" Entering a terminal window starts you in insert mode (without this, you're put in normal mode)
autocmd BufEnter * if &buftype == "terminal" | :startinsert | endif

""""" Colorscheme settings

function ColorCmd(colorscheme, bg_color)
	execute printf("colorscheme %s | set bg=%s", a:colorscheme, a:bg_color)
endfunction

command Default call ColorCmd("default", "light")
command Light call ColorCmd("gruvbox8_hard", "light")
command DarkSoft call ColorCmd("gruvbox8_soft", "dark")
command DarkHard call ColorCmd("gruvbox8_hard", "dark")

command Rainbow call ColorCmd("monokai", "dark")
command Retro call ColorCmd("darkblue", "dark")

""""" Some split-window functions

function SimpleTerminal(split_call, swap_window_positions)
	execute printf("%s | term", a:split_call)
	set ma

	if (a:swap_window_positions)
		wincmd r
	endif

	wincmd w " Cursor back to code window
endfunction

function WindowEnv()
	call SimpleTerminal("vsp", v:true)
	NERDTree " The directory explorer
	wincmd w " Cursor back to code window
	vertical resize +50 " More space for the code window
endfunction

command T call SimpleTerminal("vsp", v:true) " Vertical split
command Y call SimpleTerminal("sp", v:false) " The alternative split option
command U call WindowEnv()

""""" Initial commands to be run when Neovim starts

DarkHard " The default colorscheme
" autocmd VimEnter * NERDTree " Starts NERDTree at startup
" autocmd VimEnter * wincmd p " Puts the cursor in the code window

"""""

" Random note on how to use buffers: :e opens one, :bn goes to the next one,
" :bp to the last one, :bX goes to buffer number X, and :bd closes the current buffer.
" Also, to redo a command that was undone, press Ctrl-R.
