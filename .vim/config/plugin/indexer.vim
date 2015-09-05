
" 插件安装
"
Plugin 'indexer.tar.gz'

" 依赖下面两个插件
Plugin 'DfrankUtil'
Plugin 'vimprj'

" 插件配置
"
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
"
" C++
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" PHP
" let g:indexer_ctagsCommandLineOptions="-h '.php' -R --totals=yes --tag-relative=yes --PHP-kinds=+cf --regex-PHP='/abstract class ([^ ]*)/\1/c/' --regex-PHP='/interface ([^ ]*)/\1/c/' --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/' --exclude='*cache*'"
"

let g:indexer_disableCtagsWarning=1
let g:indexer_lookForProjectDir=0
let g:indexer_ctagsJustAppendTagsAtFileSave=1

" 项目配置文件
let g:indexer_indexerListFilename="/Users/will/.vim/tags/indexer_files"

" tags 文件生成的目录设置
let g:indexer_tagsDirname="/Users/will/.vim/tags/indexer_files_tags"
