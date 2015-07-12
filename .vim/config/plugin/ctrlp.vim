" CtrlP
" 搜索工作目录下目录名与文件名的插件
"
" 插件安装：
Plugin 'kien/ctrlp.vim'

" 插件配置：
" Change the default mapping and the default command to invoke CtrlP:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable:
let g:ctrlp_working_path_mode = 'ra'

" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
" 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file.
" 0 or '' (empty string) - disable this feature.
" Define additional root markers with the g:ctrlp_root_markers option.
"
" Exclude files and directories using Vim's wildignore and CtrlP's own
" g:ctrlp_custom_ignore:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"
let g:ctrlp_match_window_bottom = 0		" 显示 CtrlP 的窗口在顶部
let g:ctrlp_by_filename = 1             " 把默认从目录名里搜索改成搜索文件名
let g:ctrlp_max_height = 15				" 设置 CtrlP 的窗口高度
let g:ctrlp_switch_buffer = 'et'		" jump to a file if it's open already
let g:ctrlp_use_caching = 1				" enable caching
let g:ctrlp_clear_cache_on_exit=0  		" speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250 				" number of recently opened files
"
" 搜索时忽略下面的文件与目录
let g:ctrlp_custom_ignore = {
 \ 'dir':  '\v[\/]\.(git|hg|svn)$',
 \ 'file': '\v\.(exe|so|dll|jpg|jpeg|png)$',
 \ 'link': 'some_bad_symbolic_links',
 \ }

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
"
"----------------------------------------------------------------------
"
" CtrlP-funky
" 附加在 Ctrlp 的函数导航扩展插件
"
" 插件安装：
Plugin 'tacahiroy/ctrlp-funky'
"
" 插件配置：
let g:ctrlp_extensions = ['funky']

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

let g:ctrlp_funky_syntax_highlight = 1
