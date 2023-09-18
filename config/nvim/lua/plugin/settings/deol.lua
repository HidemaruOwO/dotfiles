vim.cmd([[
function! RoundToInteger(number)
    let integer_part = float2nr(a:number)
    let decimal_part = a:number - integer_part
    let rounded_decimal = round(decimal_part)

    if rounded_decimal == 1
        return integer_part + 1
    else
        return integer_part
    endif
endfunction


function! DeolFloat() abort
  let my_winwidth = winwidth('0') / 2
  let my_winheight = RoundToInteger( winheight('0') / 3 )
  let cmd = 'Deol -split=floating -winheight=' . my_winheight . ' -winwidth=' . my_winwidth . ' '
  execute cmd
endfunction
]])
