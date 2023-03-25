local map = vim.api.nvim_set_keymap

map("n", "<Space>v", ":call sml#mode_on()<CR>", { noremap = true, silent = true })
map("n", "<C-t>", ":call DeolFloat()<CR>", { noremap = true, silent = true })
map("n", "<C-s>", ":Ag<CR>", { noremap = true, silent = true })
map("n", "<C-q>", ":Lspsaga hover_doc<CR>", { noremap = true, silent = true })
map("n", "<C-j>", ":Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = true })
map("n", "<C-f>", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
map("n", "<C-h>", "<C-w>h<CR>", { noremap = true, silent = true })
map("n", "<C-j>", "<C-j>j<CR>", { noremap = true, silent = true })
map("n", "<C-k>", "<C-w>k<CR>", { noremap = true, silent = true })
map("n", "<C-l>", "<C-w>l<CR>", { noremap = true, silent = true })
map("n", "gd", ":Lspsaga lsp_finder<CR>", { noremap = true, silent = true })
map("n", "gp", ":Lspsaga preview_definition<CR>", { noremap = true, silent = true })
map("n", "gr", ":Lspsaga rename<CR>", { noremap = true, silent = true })
map("n", "fp", ":Prettier<CR>", { noremap = true, silent = true })
-- Fern mapping
map("n", "<C-n>", ":FernToggle<CR>", { noremap = true, silent = true })
-- Git Gutter mapping
map("n", "g[", ":GitGutterPrevHunk<CR>", { noremap = true, silent = true })
map("n", "g]", ":GitGutterNextHunk<CR>", { noremap = true, silent = true })
map("n", "gh", ":GitGutterLineHighlightsToggle<CR>", { noremap = true, silent = true })
-- LazyGit
map("n", "lg", ":LazyGit", { noremap = true, silent = true })

vim.cmd [[
let g:fern#disable_default_mappings = 1
function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <cr> <Plug>(fern-action-open-or-enter)
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> i <Plug>(fern-action-open:split)
  nmap <buffer> s <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END
]]
