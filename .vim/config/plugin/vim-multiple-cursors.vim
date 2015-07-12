" vim-multiple-cursors
" 选择多个文本、修改的插件

" 插件的安装：
Plugin 'terryma/vim-multiple-cursors'
"
"插件饿配置
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"
" Map start key separately from next key
let g:multi_cursor_start_key='<F6>'
