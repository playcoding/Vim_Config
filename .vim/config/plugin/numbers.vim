" numbers.vim
" 智能显示相对行号的插件

" 插件安装：
Plugin 'myusuf3/numbers.vim'

" 插件配置：
" 按 F3 打开／按 F4 关闭
nnoremap <F3> :NumbersToggle<CR>
" nnoremap <F4> :NumbersOnOff<CR>
"
" 在以下插件中关闭显示相对行号功能
let g:numbers_exclude = ['unite', 'minibufexpl', 'goyo', 'nerdtree', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m']
