require("scrollbar").setup({
    show = true,
    set_highlights = true,
    handle = {
        text = " ",
        color = "white",
        cterm = nil,
        highlight = "CursorColumn",
        hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    marks = {
        Search = {
            text = { "-", "=" },
            priority = 0,
            color = "orange",
            cterm = nil,
            highlight = "Search",
        },
        Error = {
            text = { "-", "=" },
            priority = 1,
            color = "red",
            cterm = "red",
            --highlight = "DiagnosticVirtualTextError",
            highlight = "CocErrorSign",
        },
        Warn = {
            text = { "-", "=" },
            priority = 2,
            color = "yellow",
            cterm = "yellow",
            highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
            text = { "-", "=" },
            priority = 3,
            color = "green",
            cterm = "green",
            --highlight = "DiagnosticVirtualTextInfo",
            highlight = "CocInfoVirtualText",
        },
        Hint = {
            text = { "-", "=" },
            priority = 4,
            color = "blue",
            cterm = "blue",
            highlight = "DiagnosticVirtualTextHint",
        },
        Misc = {
            text = { "-", "=" },
            priority = 5,
            color = "red",
            cterm = "red",
            highlight = "Normal",
        },
    },
    excluded_buftypes = {
        "terminal",
    },
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
    },
    autocmd = {
        render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
    },
    handlers = {
        diagnostic = true,
        search = true, -- Requires hlslens to be loaded, will run require("scrollbar.handlers.search").setup() for you
    },
})
