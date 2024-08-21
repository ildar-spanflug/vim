" It could be ~/.config/nvim or $VIMHOME or something.
" Just to have a controll over it I use the variable.
let b:vhome = "~/.vim/"

function! s:homeSource(file)
	execute 'source ' . b:vhome . a:file
endfunction

call s:homeSource("packages.vim")

nmap ; :
vmap ; :

let mapleader = ","

set clipboard+=unnamed                       " use system copy/past buffer

set autoindent
set smartindent

set hlsearch
set incsearch
set ignorecase
set smartcase

set laststatus=2

set mouse=a
set nowrap

set hidden " allows to change a buffer without saving

if (has("termguicolors"))
	set termguicolors
endif
set t_ut=

" set showbreak=↪\
" set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,space:·,extends:⟩,precedes:⟨
set listchars=tab:→\ ,trail:•,space:·
set fillchars=vert:\│


"""
" Colors
let g:gruvbox_contrast_light='hard' " It's for sunny days.
let g:gruvbox_contrast_dark='hard' " It's for sunny days.
if has('nvim')
	colorscheme github_dark
else
	colorscheme gruvbox
endif
set background=dark
" nmap <C-F12> :set background=light<cr>
" nmap <F12> :set background=dark<cr>

" Load local config
silent! source .vimlocal

" Fern
nmap <C-left> :Fern . -drawer -toggle<cr>
nmap <leader>ff :Fern . -drawer -reveal=%<cr>
call s:homeSource("fern_settings.vim")
" let g:netrw_liststyle=3

" Vista
nmap <C-right> :Vista!!<cr>
let g:vista_icon_indent = ["▸ ", ""]
let g:vista#renderer#enable_icon = 0

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


nmap <leader>gc :Git commit<cr>
nmap <leader>gs :Git<cr>
nmap <leader>gB :Git blame<cr>


" Ugrep
" https://github.com/Genivia/ugrep?tab=readme-ov-file#using-ugrep-within-vim
if executable('ugrep')
    set grepprg=ugrep\ -RInk\ -j\ -u\ --tabs=1\ --ignore-files
    set grepformat=%f:%l:%c:%m,%f+%l+%c+%m,%-G%f\\\|%l\\\|%c\\\|%m
endif

" vim-test
let test#strategy = "makegreen"



function! BuildAptPackage()
  let l:current_file_folder = expand('%:p:h')
  let l:git_folder = trim(system('git rev-parse --show-toplevel'))
  let l:builder = 'NUM_CORES=15 ' . l:git_folder . '/DEB/build-deb-dir.sh'
  let &makeprg = l:builder . ' ' . l:current_file_folder
  make
endfunction

nmap <leader>F :silent grep! <cword> .<cr>



call s:homeSource("statusline.vim")


if has('nvim')
   """
   " Move it to a file
   lua require'lsp-rust'
   
   " GoTo code navigation.
   nmap <silent> gd <cmd>lua vim.lsp.buf.definition()<cr>
   nmap <silent> gy <cmd>lua vim.lsp.buf.type_definition()<cr>
   " nmap <silent> gi <Plug>(coc-implementation)
   nmap <silent> gr <cmd>lua vim.lsp.buf.references()<cr>
   " nmap <silent> gR <Plug>(coc-refactor)
   " " Symbol renaming.
   nmap <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>

   " Telescope

    nmap <leader>l <cmd>Telescope buffers<cr>
    nmap <leader>B :Telescope marks<cr>
    nmap <leader>gb <cmd>Telescope git_branches<cr>
    nmap <c-p> <cmd>Telescope find_files<cr>
endif
