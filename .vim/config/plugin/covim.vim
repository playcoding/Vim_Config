" Vim 团队协作插件，通过网络多用户同时编辑一个文件
"
" 插件安装
Plugin 'FredKSchott/CoVim'

" 插件配置
" 设置建立服务时使用的用户名与使用的端口
let CoVim_default_name = "Will"
let CoVim_default_port = "8000"

" 使用方法：
" To start a new CoVim server: :CoVim start [port] [name] (or, from the command line: ./CoVimServer.py [port])
" To connect to a running server: :CoVim connect [host address / 'localhost'] [port] [name]
" To disconnect: :CoVim disconnect
" To quit Vim while CoVim is connected: :CoVim quit or :qall!
"
