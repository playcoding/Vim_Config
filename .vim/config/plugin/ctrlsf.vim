" CtrlSF
" 使 ag/ack 的搜索结果从单行变成同时显示多行搜索结果的上下文的插件，需要先安装 ag 或 ack 插件
"
" 插件安装：
Plugin 'dyng/ctrlsf.vim'
"
" 插件配置：
let g:ctrlsf_ackprg = 'ag'
"
" 输入后在底部 Ex 命令行出现 :CtrlSF 后输入搜索关键词按回车键搜索
" 如果不输入任何关键词直接按回车键，将自动提取光标所在关键字进行查找，你也可以指定 ack 的选项
" 例 ':CtrlSF -i -C 1 [pattern] /my/path/]'
"
nmap     <C-F>f <Plug>CtrlSFPrompt
"
" 在 VISUAL 模式选择一个词语后自动添加到搜索内容的位置
vmap     <C-F>f <Plug>CtrlSFVwordPath
"
" 在 VISUAL 模式选择一个词语后自动执行搜索操作
vmap     <C-F>F <Plug>CtrlSFVwordExec

nmap     <C-F>n <Plug>CtrlSFCwordPath

nmap     <C-F>p <Plug>CtrlSFPwordPath
"
" 再次打开 CtrlSF 搜索结果窗口
nnoremap <C-F>o :CtrlSFOpen<CR>
