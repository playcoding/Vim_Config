" Goyo
" 类似 IA Writer 的全屏写作模式插件
"
" 插件安装：
Plugin 'junegunn/goyo.vim'
"
" 插件配置：
" 更改打开IA Writer全屏写作模式的快捷键
nnoremap <silent> <leader>z :Goyo<cr>
"
" 每行的字符数及其它设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:goyo_width = 80
let g:goyo_margin_top = 4
let g:goyo_margin_bottom = 4
let g:goyo_linenr = 0
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Goyo 启动/关闭此插件全屏模式时执行的设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
function! s:goyo_enter()
  silent !tmux set status off
" set noshowmode
" set noshowcmd
  set scrolloff=999
  set wrap
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set showmode
  set showcmd
  set scrolloff=5
  set nowrap
  Limelight!
endfunction

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 插件使用说明：
" 输入 <leader>z 打开IA Writer全屏写作模式
