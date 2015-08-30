" 插件安装
Plugin 'scrooloose/syntastic'
"
" 插件配置
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }

" 因为Python已经有pylint来检查, 而且syntastic检查Python会在保存时有很长时间的卡顿, 所以禁用它对Python文件的检查
let g:syntastic_ignore_files=[".*\.py$"]
