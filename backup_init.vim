" NOTE: old config. We're now using init.lua. To use this config, rename it to init.vim
" and delete the init.lua in your $HOME/.config/nvim/



" https://vi.stackexchange.com/questions/12794/how-to-share-config-between-vim-and-neovim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin()
" Preview latex eqn
" backward in vim (using `b` extremely slow)
Plug 'jbyuki/nabla.nvim'

" Customize with popup({border = ...})  : `single` (default), `double`, `rounded`
nnoremap <leader>p :lua require("nabla").popup()<CR>




"
"Shade has some error when closing buffer on another tab
"https://github.com/sunjon/Shade.nvim/issues/4
" We'll use shade when this issue is fixed
" Plug 'sunjon/shade.nvim'
" augroup shade-nvim 
"     autocmd!
"     autocmd BufEnter * lua require'shade'.setup({overlay_opacity = 50,opacity_step = 1})
" augroup END

" show more context for functions ect...
" Doesn't seem to work for vim airline
" Plug 'SmiteshP/nvim-gps'
" augroup nvim-gps
"     autocmd!
"     autocmd BufEnter * lua require("nvim-gps").setup()
" augroup END

" for cheatsheet
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" nice tab
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim'

" alternative to airline
Plug 'nvim-lualine/lualine.nvim'
autocmd BufEnter * lua require('lualine').setup()

autocmd BufEnter * lua require('bufferline').setup({options={diagnostics="coc"}})
" "
" WARNING: do not these remaps. for some reasons, it slows down vim jumping backward `b`
" " " These commands will navigate through buffers in order regardless of which mode you are using
" " " e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
" nnoremap <silent>]b :BufferLineCycleNext<CR>
" nnoremap <silent>[b :BufferLineCyclePrev<CR>


" These commands will sort buffers by directory, language, or a custom criteria
" nnoremap <silent>be :BufferLineSortByExtension<CR>
" nnoremap <silent>bd :BufferLineSortByDirectory<CR>
call plug#end()




