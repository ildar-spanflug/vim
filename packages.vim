call plug#begin()
" Colors
Plug 'morhetz/gruvbox'
Plug 'projekt0n/github-nvim-theme'

" It opens file:line_num 
Plug 'bogado/file-line'

" NERDTree replacement
Plug 'lambdalisue/fern.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'

" Convenient commands for qf filtering.
" It's also easy to do manually, but a command like Keep is easier to
" remember.
Plug 'romainl/vim-qf'

" Some autocompletition and better colors for the actions.
Plug 'yasuhiroki/github-actions-yaml.vim' 

Plug 'christoomey/vim-tmux-navigator'
Plug 'NoahTheDuke/vim-just'
Plug 'rhysd/vim-clang-format', { 'for': 'cpp' }

" It runs make and shows the test run status with a red or green bar.
Plug 'reinh/vim-makegreen'

Plug 'vim-test/vim-test'

" Tagbar replacement
Plug 'liuchengxu/vista.vim'

if has('nvim')
	" Entire block for lsp
	Plug 'neovim/nvim-lspconfig'
	Plug 'j-hui/fidget.nvim'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	" See hrsh7th other plugins for more great completion sources!
	" Snippet engine. Not sure I need that....
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/cmp-vsnip'

	" it's replacement for rust-tools
	Plug 'mrcjkb/rustaceanvim'

	" telescope (maybe switch to LeaderF to be compatible with Vim?)
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

	" Debugger. I think it's better to write my own plugin, but I'm too
	" lazy for that.
	Plug 'sakhnik/nvim-gdb'
endif

call plug#end()

filetype plugin on

