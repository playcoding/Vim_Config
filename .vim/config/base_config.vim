"=============================================================================================================
"
" Start 其他配置
"
"
"
" 设置 session 保存的信息
set sessionoptions=blank,buffers,curdir,resize,folds,tabpages,globals,help,localoptions,options,slash,tabpages,winsize
"
set number                                         " 显示行号
set fillchars+=stl:\ ,stlnc:\                      " 在被分割的窗口间显示空白，便于阅读
set term=xterm-256color                            " 终端使用256色模式
set showmatch                                      " 设置匹配模式,当输入一个左括号时会匹配相应的那个右括号
set autoread                                       " 文件在外部被其它程序修改后,VIM自动读入修改
set autowrite                                      " 自动保存文件
set history=1000                                   " 设置历史记录条数
" set cursorline                                   " 突出显示当前行
" set cursorcolumn                                 " 突出显示当前列
" set ignorecase                                     " 设置搜索时忽略大小写

" set wrap                                         " 当一行文字很长时换行显示
set nowrap                                         " 当一行文字很长时不换行显示
set nobackup                                       " 设置取消备份
set noswapfile                                     " 禁止临时文件生成
set autochdir                                      " 自动切换当前目录为当前文件所在的目录"
"
set showcmd                                        " 输入的命令在底部状态栏右下角显示出来
set tabstop=4                                      " 设置Tab宽度
set shiftwidth=4                                   " 设置自动对齐空格数
set softtabstop=4                                  " 设置按退格键时可以一次删除4个空格
set smarttab                                       " 设置按退格键时可以一次删除4个空格
set expandtab                                      " 将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
" set noexpandtab                                  " 不将Tab键自动转换成空格
"
setl foldlevelstart=99                             " 总是关闭所有的折叠 (0) 关闭某些折叠 (1) 或者没有折叠 (99)
"
set nrformats-=octal                               " 在 007 这类以 0 开头的数字上使用 CTRL-A 进行增长时，不以八进制处理而是当十进制处理
"
set textwidth=0                                    " 每行设定输入多少个字自动加入换行符，设置为 0 不自动加入换行符

set vb t_vb=                                       " 当vim进行编辑时，如果命令错误，会发出警报，该设置去掉警报
"
"-------------------------------------------------------------------------------------------------------------
"
" 与OS X 或者 windows共享剪贴板
set clipboard+=unnamed
"
"-------------------------------------------------------------------------------------------------------------
"
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a                                        " 设置在Vim中可以使用鼠标,防止在Linux终端下无法拷贝
set selection=exclusive
set selectmode=mouse,key
"
"-------------------------------------------------------------------------------------------------------------
"
" 文件编码设置
set encoding=utf-8                                 " 设置文件的编码
set fileencoding=utf-8                             " 创建新文件不使用 UTF-8 作为文件编码时，需要手工设定该选项，如“:set fileencoding=gb2312”
set termencoding=utf-8                             " 终端的编码模式，仅在使用 UTF-8 的情况下，PuTTY 才能可靠地支持中文的显示和输入
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1      " 自动判断文件编码时，依次尝试文件编码
"
"-------------------------------------------------------------------------------------------------------------
"
" 信息文件 viminfo 被用来储存状态信息，存储的内容与设置方法如下:
"
" 命令行和模式搜索的历史记录
" 寄存器内文本
" 各种文件的标记
" 缓存器列表
" 全局变量
"
" 你每次退出 Vim，它就把此种信息存放在一个文件内。即 viminfo 信息文件。当 Vim
" 重新起动时，就读取这个信息文件, 而那些信息就被还原了。
"
" 选项 ‘ 用于规定你为多少个文件保存标记 (a-z)。为此选项挑一个偶数 (比如 1000).
" 你的命令现在看起来像这样:

" :set viminfo=’1000
"
" 选项 f 控制是否要储存全局标记 (A-Z 和 0-9)。如果这个选项设为 0，那么什么也不
" 存储。如果设为 1 ，或你对 f 选项不作规定, 那么标记就被存储.:
"
" :set viminfo=’1000,f1
"
" 选项 < 控制着每个寄存器内保存几行文本。默认情况下，所有的文本行都被保存. 如果
" 设为 0，则什么也不保存。为了避免成千上万行文本被加入你的信息文件 (那些文本可能
" 永远也没用，徒然使 Vim 起动得更慢), 你采用 1000 行的上限:
"
set viminfo='1000,f1,<1000,:500,@500,/500
"
" 其它选项:
" : 保存命令行历史记录内的行数
" @ 保存输入行历史记录内的行数
" / 保存搜索历史记录内的行数
" r 可移介质，其中没有任何标记存入 (可用多次)
" ! 以大写字母开头的全局变数，并且不含有小写字母
" h 起动时解除选项 'hlsearch' 的高亮度显示
" % 缓冲列表 (只有当不带参数起动 Vim 时才还原)
" c 用编码 'encoding' 转换文本
" n 用于 viminfo 文件的名称 (必须为最后一项选项)
"
"-------------------------------------------------------------------------------------------------------------
"
" End 其他配置
"
"=============================================================================================================
"