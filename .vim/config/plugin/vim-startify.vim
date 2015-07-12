" 自定义 Vim 启动时显示的默认信息

" 插件安装
"-------------------------------------------------------------------------------------------------------------
Plugin 'mhinz/vim-startify'

" 插件配置
"-------------------------------------------------------------------------------------------------------------
" 设置保存/读取 sessions 的目录，Windows 请设置成 '$HOME\vimfiles\session'
let g:startify_session_dir = '~/.vim/session'
" 自定义 Vim 启动时显示的内容
autocmd User Startified setlocal cursorline

" 显示 <empty buffer> 与 <quit>
let g:startify_enable_special         = 1
" 启动部分显示文件的数量
let g:startify_files_number           = 10
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

let g:startify_list_order = [
  \ ['   My most recently used files:'],
  \ 'files',
  \ ['   My most recently used files in the current directory:'],
  \ 'dir',
  \ ['   These are my Sessions:'],
  \ 'sessions',
  \ ['   These are my Bookmarks:'],
  \ 'bookmarks',
  \ ]

let g:startify_skiplist = [
  \ 'COMMIT_EDITMSG',
  \ $VIMRUNTIME .'/doc',
  \ 'bundle/.*/doc',
  \ '\.vimgolf',
  \ ]

let g:startify_bookmarks = [
  \ '~/.vimrc',
  \ '~/.zshrc',
  \ ]

let g:startify_custom_footer =
  \ ['', "  Commands to load, save or delete a session.", "  ':SLoad' ':SSave' ':SDelete'"]

let g:startify_custom_header = [
  \ '                                 ________  __ __',
  \ '            __                  /\_____  \/\ \\ \',
  \ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \',
  \ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_',
  \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
  \ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/',
  \ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/',
  \ '',
  \ '',
  \ ]

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240
"
"-------------------------------------------------------------------------------------------------------------
