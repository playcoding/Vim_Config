" vim-easymotion
" 快速搜索／跳转插件
"
" 插件安装：
Plugin 'Lokaltog/vim-easymotion'
"
" 插件配置：
" 禁止使用默认的快捷键
let g:EasyMotion_do_mapping = 0
"
" 搜索时忽略大小写
let g:EasyMotion_smartcase = 1
"
" 定义通过一个字符进行搜索跳转的功能键
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
"
" 定义通过两个字符进行搜索跳转的功能键
nmap s <Plug>(easymotion-overwin-f2)
"
" 定义快速跳转到行的功能键
map <Leader><Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>l <Plug>(easymotion-overwin-line)
"
" 定义代替 Vim 的 / 搜索功能键，在 NORMAL 模式下输入 / 后输入要搜索的关键词后按回车
map  / <Plug>(easymotion-sn)
nmap / <Plug>(easymotion-tn)
"
" 定义按 n 或 N 键跳转到下一个或上一个搜索结果的快捷键
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Move to word
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
