
" 定义 <Leader> 键，此配置必须在使用到它的插件前定义才能生效，不设定默认为 /
let mapleader = ";"

" 退出Vim后再次编辑文件时，光标在上次关闭之前的位置
" 解释下上面的autocmd命令。首先，当打开任何文件时，首先判断上次退出该文件时光标所在行，
" 如果不在第一行，那么执行exe命令，即:开头的命令，:normal! g'”命令是在normal模式下执行g'”，
" 即将光标定位到上次退出文件时所在行。为了使光标准确定位至“某一行的某一列”，需要使用`来跳转至标记”，而不是’。
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
