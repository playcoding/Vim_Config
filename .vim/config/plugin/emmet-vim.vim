
" 快速写Html、Css代码的插件
"
" 插件安装：
Plugin 'mattn/emmet-vim'

" 插件配置：
"
" let g:user_emmet_mode='n'    " 此插件在 Normal 模式下有效
" let g:user_emmet_mode='inv'  " 此插件在 insert normal visual 模式下有效
let g:user_emmet_mode='a'    " 此插件在所有模式下有效

" let g:emmet_html5 = 0

" 此插件只有在html、css文件生效
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
"
" 更改触发键:
let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_expandabbr_key = '<C-y>,'
let g:user_emmet_expandword_key = '<C-y>;'
let g:user_emmet_update_tag = '<C-y>u'
let g:user_emmet_balancetaginward_key = '<C-y>d'
let g:user_emmet_balancetagoutward_key = '<C-y>D'
let g:user_emmet_next_key = '<C-y>n'
let g:user_emmet_prev_key = '<C-y>N'
let g:user_emmet_imagesize_key = '<C-y>i'
let g:user_emmet_togglecomment_key = '<C-y>/'
let g:user_emmet_splitjointag_key = '<C-y>j'
let g:user_emmet_removetag_key = '<C-y>k'
let g:user_emmet_anchorizeurl_key = '<C-y>a'
let g:user_emmet_anchorizesummary_key = '<C-y>A'
let g:user_emmet_mergelines_key = '<C-y>m'
let g:user_emmet_codepretty_key = '<C-y>c'
