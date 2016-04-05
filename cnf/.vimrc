filetype plugin indent on
syntax on

map! <F10> <Esc>:w<CR>i
map  <F10> :w<CR>
map! <F11> <Esc>ZZ
map  <F11> ZZ
map! <M-F12> <Esc>:q!<CR>
map  <M-F12> :q!<CR>

map! <D-e> <Esc>

set number
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab


" Shift lines
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <D-s-up> :call <SID>swap_up()<CR>
noremap <silent> <D-s-down> :call <SID>swap_down()<CR>


colorscheme hybrid
set guifont=Menlo\ Regular:h12
highlight LineNr guifg=#808480
hi Visual  guifg=#000000 guibg=#A0A8AF gui=none
