local executable
local args

lspconfig.texlab.setup({
    setting = {
        texlab = {
            forwardSearch = {
                executable = executable,
                args = args,
            },
        },
    },
})

local executable = 'sioyek'
local args = {
    '--reuse-window',
    '--inverse-search',
    [[nvim-texlabconfig -file %1 -line %2]],
    '--forward-search-file', '%f',
    '--forward-search-line', '%l', '%p'
}
