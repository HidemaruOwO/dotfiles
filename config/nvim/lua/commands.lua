local api = vim.api

api.nvim_create_user_command('FernToggle', 'Fern . -reveal=% -drawer -toggle -width=33', {})
api.nvim_create_user_command('DduFiler', 'call ddu#start({ "name": "filer", "searchPath": expand("%:p") })', {})

