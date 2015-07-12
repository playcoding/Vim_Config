" --------------------------------------------------------------------------------------------------
"
" vim-powerline 是 Vim 底部状态栏增强显示插件

" 插件安装
" Plugin 'Lokaltog/vim-powerline'

" 插件配置
" set laststatus=2                                   " 底部状态栏显示两行
" set t_Co=256                                       " 指定配色方案为256色
" let g:Powerline_symbols = 'fancy'
"
" ----------------------------------------------------------------------------------------
"
" vim-airline 是与 vim-powerline 类似的 Vim 底部显示增强插件

" 插件安装
Plugin 'bling/vim-airline'

" 插件配置
set laststatus=2                                   " 底部状态栏显示两行
set t_Co=256                                       " 指定配色方案为256色

" 使用 powerline 符号，需要安装 powerline 字体
let g:airline_powerline_fonts = 1

" enable/disable enhanced tabline. >
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"
" enable/disable displaying buffers with a single tab. >
" let g:airline#extensions#tabline#show_buffers = 1

" enable/disable displaying tabs, regardless of number. >
" let g:airline#extensions#tabline#show_tabs = 1

let g:airline_section_c = '%{getcwd()}/%t'         " 在底部 C 段落显示当前的工作目录与编辑的文件名

" 切换 buffer 里的各个 tab
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
"
" --------------------------------------------------------------------------------------------------
