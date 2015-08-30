" YouCompleteMe
" 代码补全插件
"
" 插件安装：
Plugin 'Valloric/YouCompleteMe'
"
" 插件配置：
"
" YouCompleteMe 插件在补全 C 的时候只有在 ./-> 时才会弹出补全菜单, 为了正常补全, 可以在 .vimrc 下添加如下配置:
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&']

" YCM除了提供了基本的补全功能,自动提示错误的功能外,还提供了类似tags的功能：

" 跳转到定义GoToDefinition
" 跳转到声明GoToDeclaration
" 以及两者的合体GoToDefinitionElseDeclaration

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'

" YCM可以打开location-list来显示警告和错误的信息:YcmDiags。
nmap <F7> :YcmDiags<CR>

" 配置默认的ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" 打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0

" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1
