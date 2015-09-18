"
" 重映射 Vim 的 Esc 键
" 默认情况下，当按 <ESC> 返回 Normal 模式时，光标会向左移动一个字符，下面的映射命令中添加了 `^，这样光标就能保持原来的位置
inoremap jj <Esc>`^
inoremap <C-c> <Esc>`^
inoremap <Esc> <Esc>`^
"
"-------------------------------------------------------------------------------------------------------------
"
" 用空格键来开关折叠区块
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
"
"-------------------------------------------------------------------------------------------------------------
"
" 与 Windows 复制／粘贴快捷键兼容 <Ctrl＋C>／<Ctrl＋V>
" vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
" nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p
"
" Ubuntu (running Vim in gnome-terminal) 与 Windows 复制／粘贴快捷键兼容 <Ctrl＋C>／<Ctrl＋V>
" vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\"))<CR>:call system("xclip -i", getreg("\""))<CR>
" nmap <C-v> :call setreg("\",system("xclip -o -selection clipboard"))<CR>p)))
"
"-------------------------------------------------------------------------------------------------------------
"
" NORMAL 模式下去除掉文件内所有空白行
nnoremap <F10> :g/^\s*$/d<CR>

" VISUAL 模式下去除选择的行内所有的空白行
vmap <F10> :g/^\s*$/d<CR>
"
"-------------------------------------------------------------------------------------------------------------
"
" 窗口切换
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
"
"-------------------------------------------------------------------------------------------------------------
"
" 在插入模式下 hjkl 移动光标
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

"-------------------------------------------------------------------------------------------------------------
"
" tags 标签导航
" 键入正向快捷键后遍历第一个匹配标签，再次键入快捷键遍历第二个，直到最后一个，
" 键入反向快捷键逆序遍历。vim 中有个叫标签栈（tags stack）的机制，
" :tnext、:tprevious 只能遍历已经压入标签栈内的标签，
" 所以，你在遍历前需要通过快捷键 ctrl-] 将光标所在单词匹配的所有标签压入标签栈中，
" 然后才能遍历。以后你只需先键入 ctrl-]，若没导航至需要的标签，
" 再键入 <leader>tn 往后或者 <leader>tp 往前遍历即可。

" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

"-------------------------------------------------------------------------------------------------------------

" 将当前光标下的列高亮并锁定，再按一次，取消高亮；并且可以同时多列高亮
map <Leader>sc :call SetColorColumn()<CR>
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction
