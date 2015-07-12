" vim-gitgutter
" 显示 git 差异对比插件

" 插件安装：
Plugin 'airblade/vim-gitgutter'

" 插件配置：
" 查看diff的修改，快捷键 <Leader>df ,显示diff差异
nmap <Leader>gf <Plug>GitGutterPreviewHunk

" 支持在每个diff区块之间跳转（像图中就分了3块）。默认快捷键为 [c 和 ]c
nmap ]n <Plug>GitGutterNextHunk
nmap [n <Plug>GitGutterPrevHunk
" 暂存 <Leader>hs 和回退 <Leader>hr 修改
" nmap <Leader>hs <Plug>GitGutterStageHunk
" nmap <Leader>hr <Plug>GitGutterRevertHunk
" gitgutter还支持自定义git diff的参数
" let g:gitgutter_diff_args = '-w'
" 禁止使用 vim-gitgutter 所有的快捷键
" let g:gitgutter_map_keys = 0
"
