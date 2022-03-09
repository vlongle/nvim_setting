-- load the config from vimrc!
vim.cmd([[
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath=&runtimepath
    source ~/.vimrc
]])

-- https://www.chrisatmachine.com/Neovim-2/03-plugins/
require ( 'user.plugins'     )
require ( 'user.lualine'     )
require ( 'user.bufferline'  )
require ( 'user.colorscheme' )
require ( 'user.scrollbar'   )
require ( 'user.hlslens'     )
require ( 'user.nabla'       )
require ( 'user.bufferline'  )
require ( 'user.gps'         )
require ( 'user.alpha'       )
require ('user.telescope')
require ('user.coc')
