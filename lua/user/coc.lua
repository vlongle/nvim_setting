vim.cmd([[
    " install coc extensions
    let g:coc_global_extensions = ['coc-pyright', 'coc-tsserver', 'coc-langd', 'coc-css', 'coc-html', 'coc-vimlsp', 'coc-snippets', 'coc-explorer', 'coc-json']

    " intellisense for vim using coc
    " https://www.youtube.com/watch?v=OXEVhnY621M&t=3s&ab_channel=ChrisAtMachine
    " https://github.com/neoclide/coc.nvim/issues/3258. Go to the ~/.vim/bundle/coc.nvim/ folder and run:
    " `yarn install` and `yarn build`
    " https://github.com/neoclide/coc.nvim/wiki/Language-servers
    " Plugin 'neoclide/coc.nvim'
    " Python: :CocInstall coc-pyright
    " Javascript: :CocInstall coc-tsserver
    " C/C++/Objective-C: :CocInstall coc-clangd
    " CSS: :CocInstall coc-css
    " HTML: :CocInstall coc-html
    " Vim: :CocInstall coc-vimlsp
    " have github copilot.
    " Do :checlhealth to see if everything is installed for the current file

    " https://www.youtube.com/watch?v=ebrEY-6EwXI&t=294s&ab_channel=chris%40machine
    " CocInstall coc-snippets
    " coc-snippets lets you preview snippets and include
    " snippets (alternative https://github.com/SirVer/ultisnips)
    " vim-snippets are the actual snippets provided for different languages
    Plugin 'honza/vim-snippets'
    imap <C-l> <Plug>(coc-snippets-expand)


    " https://github.com/neoclide/coc.nvim
    " has a setup of keybindings for coc.
    " gd jump to definition using Coc (which can locate the definition of a symbol
    " across files in the current project. Without coc, `gd` only works for the
    " current file.)
    nmap <silent> gd <Plug>(coc-definition)
    " gD to jump definition in a new pane
    autocmd VimEnter * nmap  <silent> gD :call CocAction('jumpDefinition', 'vsplit')<CR>
    " gr highlight references to the symbol under the cursor across files in the
    " current project. This is equivalent to using fzf to do :Rg (ctrl+g) and
    " then search for the symbol
    nmap gr <Plug>(coc-references)
    " cool Coc :call CocAction('format') to format
    " :CocConfig to go to coc config and add stuff like
    "     {"coc.preferences.formatOnSaveFiletypes": ["python", "javascript", "typescript", "c", "cpp", "objective-c", "css", "html"]}
    "  to call :CocAction('format') on save (i.e. on :w)
    "  :h Coc to see documentation and search for e.g. formatOnSaveFiletypes

    " Use ctrl+space to trigger/bring out completion.
    if has('nvim')
      inoremap <expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif
    " :CocDiagnostics to see errors in the current file
    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocAction('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

    "issue: https://github.com/neoclide/coc.nvim/issues/1405
    " Fix: use ctrl+w ctrl+w (or <leader>n in our binding) to switch to the documentation preview window,
    " and scroll there


    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=100

    " Highlight the symbol under the cursor and its references within the file
    " e.g. we have a function def fn() and then we have fn() in the file. When the
    " cursor is on fn() then we want to highlight fn() and its references (including the def fn() part)
    " NOTE: updatetime=100 means that the cursor has to be on the symbol for only 100 ms
    " to trigger the highlighting instead of 4s as default.
    autocmd CursorHold * silent call CocActionAsync('highlight')



    " rename a symbol mostly within a file
    nmap <leader>r <Plug>(coc-rename)
    " search for the symbol under the cursor across files in the current project
    " useful to rename a symbol across files
    nnoremap <leader>f :CocSearch <C-R>=expand('<cword>')<CR><CR>

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    " Action like "extract method" or "extract variable"
    " Need module rope "pip install rope"
    " " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    " Commented out in favor of the coc-actions
    " <leader>a for the current selected range
    " <leader>aw for the current word
    " <leader>aas for the current sentence
    " <leader>aap for the current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)



    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    " xmap: visual mode map, omap: operator mode map
    " E.g. "daf" delete the current function
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " The following is __NOT__ needed. https://github.com/neoclide/coc.nvim/wiki/Statusline-integration
    " because I have vim airline plugin, which works out of the box.
    "set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    " coc videos: https://www.youtube.com/watch?v=q7gr6s8skt0&ab_channel=ThePrimeagen

    " coc-explorer: like vscode. Should use this instead of :Sex!
    " https://www.youtube.com/watch?v=vrEJ6NopAGo&ab_channel=ChrisAtMachine
    " https://github.com/weirongxu/coc-explorer
    " Issue: https://iboxshare.com/weirongxu/coc-explorer/issues/480
    " Add "explorer.icon.enableNerdfont": true
    " to coc-settings.json
    " To make it like Vscode, we'll use Cmd+b to open the explorer
    " but vim doesn't support cmd, so we'll have to use iterm key
    " sending trick. https://stackoverflow.com/questions/40990454/how-to-map-mac-command-key-in-vim.
    " Go to iterm preferences>keys and add a new key mapping with Cmd+b
    " and action "Send text with "vim" special chars" :CocCommand explorer\n
    " :nmap <leader>f <Cmd>CocCommand explorer<CR>
    " Default keybindings added from github
    " can be seen in :CocConfig
    " Left side is staged and right side is unstaged in coc-explorer

    let g:coc_explorer_open_win = 'g:open_float_win_for_coc_explorer'
    " quit
"" if only one buffer named 'coc-explorer' is shown, then exit

    function! SmartCloseFile()
        let has_good = 0
        for i in range(1, winnr('$'))
            " get filetype
           if getwinvar(i, '&ft') != '' && getwinvar(i, '&ft') != 'minimap'  " && getwinvar(i, '&ft') != 'coc-explorer'
                let has_good = 1
                break
            endif
        endfor
        if has_good == 0
             quit
        endif
    endfunction

" close vim if there's no vim file i.e. only coc-explorer or minimap are open
"autocmd BufEnter * call SmartCloseFile()


    " navigate between error
    nmap <silent> [e <Plug>(coc-diagnostic-prev)
    nmap <silent> ]e <Plug>(coc-diagnostic-next)
    " then <leader>q to close the diagnostic window!
    nmap <leader>d :CocDiagnostics<CR>

    " automatically organize imports on save in python files (see https://github.com/neoclide/coc.nvim/issues/888)
    autocmd BufWritePre *.py :silent call CocAction('runCommand', 'editor.action.organizeImport')


]])
