-- vscode and nvim only settings
if (vim.g.vscode) then
  -- VSCode extension

  -- map keyboard quickfix
  vim.cmd[[nnoremap('z=', "<Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<Cr>")]]

else
  -- ordinary neovim
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  end

  require('plugins/packer')
  require('settings')
end
