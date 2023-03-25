local api = vim.api

api.nvim_create_user_command('LazyGit',
  ':Deol -split=floating -winheight=35 -winwidth=120 -winrow=11.5 -wincol=45 -command=lazygit', {})
api.nvim_create_user_command('FernToggle', 'Fern . -reveal=% -drawer -toggle -width=33', {})
