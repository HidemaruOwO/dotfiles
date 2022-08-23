set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set hls
set virtualedit=onemore
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
set helplang=ja
syntax enable
filetype plugin indent on

" LinuxとMacでの条件分岐
if (has("linux"))
  let g:previm_open_cmd = 'xdg-open'
  let g:python3_host_program = '/usr/sbin/python3'
elseif (has("mac"))
  let g:previm_open_cmd = 'open -a floorp'
  let g:python3_host_prog='/opt/homebrew/bin/python3'
endif


