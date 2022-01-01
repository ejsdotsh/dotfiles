-- vscode and nvim only settings
if (vim.g.vscode) then
  -- VSCode extension

  -- map keyboard quickfix
  nnoremap('z=', "<Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<Cr>")
else
  -- ordinary neovim
  require('plugins')
  require('settings')
end
