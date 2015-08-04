# Vim 使用手册

[TOC]

## Vim 基础命令

### 1. 各种插入模式

    a  →  在光标后插入  
    o  →  在当前行后插入一个新行  
    O  →  在当前行前插入一个新行  
    cw →  替换从光标所在位置后到一个单词结尾的字符  

### 2. 简单的移动光标  

    0 → 数字零，到行头  
    ^ → 到本行第一个不是blank字符的位置（所谓blank字符就是空格，tab，换行，回车等）  
    $ → 到本行行尾  
    g_ → 到本行最后一个不是blank字符的位置。  
    /pattern → 搜索 pattern 的字符串（陈皓注：如果搜索出多个匹配，可按n键到下一个）  

### 3. 拷贝/粘贴 （注：p/P都可以，p是表示在当前位置之后，P表示在当前位置之前）  

    P → 粘贴  
    yy → 拷贝当前行当行于 ddP  

### 4. Undo/Redo  

    u → undo  
    <C-r> → redo  

### 5. 打开/保存/退出/改变文件(Buffer)  

    :e <path/to/file> → 打开一个文件  
    :w → 存盘  
    :saveas <path/to/file> → 另存为 <path/to/file>  
    :x， ZZ 或 :wq → 保存并退出 (:x 表示仅在需要时保存，ZZ不需要输入冒号并回车)  
    :q! → 退出不保存 :qa! 强行退出所有的正在编辑的文件，就算别的文件有更改。  
    :bn 和 :bp → 你可以同时打开很多文件，使用这两个命令来切换下一个或上一个文件。（陈皓注：我喜欢使用:n到下一个文件）  
    
### 6. Vim 保存时获取sudo权限
    
        :w !sudo tee %
    
命令`:w !{cmd}`: 让 vim 执行一个外部命令 {cmd} ,然后把当前缓冲区的内容从 stdin 传入.
`tee` 是一个把 stdin 保存到文件的小工具
`%` 是vim当中一个只读寄存器的名字, 总保存着当前编辑文件的文件路径所以执行这个命令,就相当于从vim外部修改了当前编辑的文件

## Vim 进阶
		. (小数点) 可以重复上一次的命令
		N<command> 重复某个命令N次
		下面是一个示例，找开一个文件你可以试试下面的命令：
    	2dd   删除2行
    	3p    粘贴文本3次
    	5iabc [ESC]    会写下 "abcabcabcabcabc"
    	3. → 重复上一个命令3次

* NG → 到第 N 行 （注：注意命令中的G是大写的，一般使用 : N 到第N行，如 :137 到第137行）
* gg → 到第一行。（注：相当于1G，或 :1）
* G → 到最后一行。
* 按单词移动：
    w → 到下一个单词的开头。
    e → 到下一个单词的结尾。
    > 如果你认为单词是由默认方式，那么就用小写的e和w。默认上来说，一个单词由字母，数字和下划线组成（注：程序变量）
    >
    > 如果你认为单词是由blank字符分隔符，那么你需要使用大写的E和W。（注：程序语句）
    >
    > 光标移动：
    >
    > % : 匹配括号移动，包括 (, {, [. （注：你需要把光标先移到括号上）
    > * 和 #:  匹配光标当前所在的单词，移动光标到下一个（或上一个）匹配单词（*是下一个，#是上一个）
    > 上面这三个命令对程序员来说是相当强大的。
    >

很多命令都可以和这些移动光标的命令连动。很多命令都可以按照下面的方法使用：

    <start position><command><end position>

例如 0y$ 命令意味着：

    0 → 先到行头
    y → 从这里开始拷贝
    $ → 拷贝到本行最后一个字符

你可可以输入 ye，从当前位置拷贝到本单词的最后一个字符。

你也可以输入 y2/foo 来拷贝2个 “foo” 之间的字符串。

还有很多时候并不一定按 y 才会拷贝，下面的命令执行后也会拷贝内容到剪贴板：

d (删除 )
v (可视化的选择)
gU (变大写)
gu (变小写)
等等

（注：可视化选择命令，你可以先按v，然后移动光标，文本被选择，然后，你可能d，也可y，也可以变大写等）

在当前行上移动光标: 0 ^ $ f F t T , ;

* 0 → 到行头
* ^ → 到本行的第一个非blank字符
* $ → 到行尾
* g_ → 到本行最后一个不是blank字符的位置。
* fa → 到下一个为a的字符处，你也可以fs到下一个为s的字符。
* t, → 到逗号前的第一个字符。逗号可以变成其它字符。
* 3fa → 在当前行查找第三个出现的a。
* F 和 T → 和 f 和 t 一样，只不过是相反方向。

还有一个很有用的命令是 dt" → 删除所有的内容，直到遇到双引号 " 。

区域选择 <action>a<object> 或 <action>i<object>
在visual 模式下，这些命令很强大，其命令格式为

    <action>a<object> 和 <action>i<object>

action可以是任何的命令，如 d (删除), y (拷贝), v (可以视模式选择)。
object 可能是： w 一个单词， W 一个以空格为分隔的单词， s 一个句字， p 一个段落。也可以是一个特别的字符："、 '、 )、 }、 ]。
假设你有一个字符串 (map (+) ("foo")).而光标键在第一个 o 的位置。

* vi" → 会选择 foo.
* va" → 会选择 "foo".
* vi) → 会选择 "foo".
* va) → 会选择("foo").
* v2i) → 会选择 map (+) ("foo")
* v2a) → 会选择 (map (+) ("foo"))

块操作: <C-v>
块操作，典型的操作： 0 <C-v> <C-d> I-- [ESC]

^ → 到行头
<C-v> → 开始块操作
<C-d> → 向下移动 (你也可以使用hjkl来移动光标，或是使用%，或是别的)
I-- [ESC] → I是插入，插入“--”，按ESC键来为每一行生效。

在Windows下的vim，你需要使用 <C-q> 而不是 <C-v> ，<C-v> 是拷贝剪贴板。

自动提示： <C-n> 和 <C-p>
在 Insert 模式下，你可以输入一个词的开头，然后按 <C-p>或是<C-n>，自动补齐功能就出现了

宏录制： qa 操作序列 q, @a, @@
qa 把你的操作记录在寄存器 a。
于是 @a 会replay被录制的宏。
@@ 是一个快捷键用来replay最新录制的宏。
示例

在一个只有一行且这一行只有“1”的文本中，键入如下命令：

    qaYp<C-a>q→
   * qa 开始录制
   * Yp 复制行.
   * <C-a> 增加1.
   * q 停止录制.

@a → 在1下面写下 2
@@ → 在2 正面写下3
现在做 100@@ 会创建新的100行，并把数据增加到 103.

可视化选择： v,V,<C-v>
前面，我们看到了 <C-v>的示例 （在Windows下应该是<C-q>），我们可以使用 v 和 V。一但被选好了，你可以做下面的事：

J → 把所有的行连接起来（变成一行）
< 或 > → 左右缩进
= → 自动给缩进 （注：这个功能相当强大）

在所有被选择的行后加上点东西：

<C-v>
选中相关的行 (可使用 j 或 <C-d> 或是 /pattern 或是 % 等……)
$ 到行最后
A, 输入字符串，按 ESC。

分屏: :split 和 vsplit.
下面是主要的命令，你可以使用VIM的帮助 :help split. 你可以参考本站以前的一篇文章VIM分屏。

    :split → 创建分屏 (:vsplit创建垂直分屏)
    <C-w><dir> : dir就是方向，可以是 hjkl 或是 ←↓↑→ 中的一个，其用来切换分屏。
    <C-w>_ (或 <C-w>|) : 最大化尺寸 (<C-w>| 垂直分屏)
    <C-w>+ (或 <C-w>-) : 增加尺寸

## Vim 快捷键设定说明

例子中经常使用 <> 记法。有时这只是用来说明你需要输入什么，但经常它需要照本义键入，例如在 ":map" 命令里。

规则是:
1.  任何可显示的字符都可以直接键入，反斜杠和 '<' 除外。
2.  反斜杠用两个反斜杠表示 "\\"，或者用 "<Bslash>"。
3.  真正的 '<' 用 "\<" 或 "<lt>" 表示。只有在没有歧义的时候才可以直接用 '<' 表示。
4.  "<key>" 的意思是特殊键。其含义上面的表格都有介绍，下面是一些例子:

        <Esc>                Escape 键
        <C-G>                CTRL-G
        <Up>                 光标上移键
        <C-LeftMouse>        Control＋鼠标左键点击
        <S-F11>              Shift＋功能键 11
        <Space>              插入空格
        <Tab>                插入Tab
        <CR>                 等于<Enter>

## Vim 快捷键占用信息

### 配置文件`[~/.vim/config/init.vim]`

    <Leader>
    ","（逗号）
    
### 配置文件`[~/.vim/config/shortcut_key.vim]`

    开关折叠区块代码区块
    <Space>（空格键）
    
    去除文件内所有空白行
    <F2>
    
    窗口切换
    <Ctrl-w>
    <Ctrl-j>
    <Ctrl-k>
    <Ctrl-l>
    <Ctrl-h>
    
### 配置文件`[~/.vim/config/plugin/ctrlp.vim]`

    CtrlP 与 ctrlp-funky（搜索文件名与函数导航）
    CtrlP：
    <Ctrl-p>
    <Leader><Ctrl-p>
    CtrlP-funky：
    <Leader>fu
    <Leader>fU

### 配置文件`[~/.vim/config/plugin/ctrlsf.vim]`

    CtrlSF（使 ag/ack 的搜索显示多行搜索结果）
    <Ctrl-f>f
    <Ctrl-f>n
    <Ctrl-f>p
    <Ctrl-f>o

### 配置文件`[~/.vim/config/plugin/vim-easymotion.vim]`

    vim-easymotion（快速搜索／跳转插件）
    <Leader><Leader>w
    <Leader><Leader>f
    <Leader>j
    <Leader>k
    /
    s

### 配置文件`[~/.vim/config/plugin/nerdtree.vim]`

    Nerdtree（显示目录树与加强功能的插件）
    <F8>

### 配置文件`[~/.vim/config/plugin/vim-multiple-cursors.vim]`

    vim-multiple-cursors（同时选择多个文本）
    <F6>
    
### 配置文件`[~/.vim/config/plugin/vim-indent-guides]`
    
    vim-indent-guides（显示缩进对齐线）
    <Leader>si

### 配置文件`[~/.vim/config/plugin/vim-surround.vim]`

    vim-surround（字符串包围／改变或者去除引号）
      ysiw"   当前光标所在的单词包围上双引号
      yssb    为一行包围圆括号
      yss"    为一行包围双引号
      ySS     在上一行与下一行添加符号
      cs"(    是将双引号变成圆括号
      cst<p>  把 <> 标签里的内容改成 <p> 标签
      cst"    是将 <p> 这种类型的包围替换成双引号
      ds"     是去除双引号包围
      dst     是删除 <div> 这种类型的包围
      
### 配置文件`[~/.vim/config/plugin/goyo.vim]`

    Goyo（全屏写作）
    <Leader>z
    

### 配置文件`[~/.vim/config/plugin/vim-airline.vim]`

    vim-airline（底部信息栏增强显示） 
    <Leader>1
    <Leader>2
    <Leader>3
    <Leader>4
    <Leader>5
    <Leader>6
    <Leader>7
    <Leader>8
    <Leader>9

### 配置文件`[~/.vim/config/plugin/gundo.vim]`

    gundo（编辑文件时可以恢复到任意修改点）
    <F5>
    
### 配置文件`[~/.vim/config/plugin.vim]`

    tabular（让代码以=或其它符号对齐）
    <Leader>a&
    <Leader>a&
    <Leader>a=
    <Leader>a=
    <Leader>a=>
    <Leader>a=>
    <Leader>a:
    <Leader>a:
    <Leader>a::
    <Leader>a::
    <Leader>a,
    <Leader>a,
    <Leader>a,,
    <Leader>a,,
    <Leader>a<Bar>
    <Leader>a<Bar>
            
    vim-less（Less 转换成 Css）
    <Leader>m
    
    vim-easy-align（快速对齐）
    <Enter>
    ga
    
    emmet-vim（快速写Html、Css代码）
    <Ctrl＋y>  然后输入 <Leader> 键 
    
    nerdcommenter（添加软件注释）
    <Leader>cc
    <Leader>cn
    <Leader>c
    <Leader>cm
    <Leader>ci
    <Leader>cs
    <Leader>cy
    <Leader>c$
    <Leader>cA
    <Leader>ca
    <Leader>cl
    <Leader>cb
    <Leader>cu
    
    
## Vim 插件使用教程

### Vundle（插件管理）

> 自动安装、管理其它的 Vim 插件 

插件使用说明：

可以在 Vim Ex 模式下执行的Vundle命令

    :PluginList             -显示所有安装的插件
    :PluginInstall          -安装列表中的全部插件
    :PluginInstall!         -升级全部插件到最新版本
    :PluginSearch foo       -查找foo插件
    :PluginSearch! foo      -刷新foo插件缓存
    :PluginClean            -清除列表中没有的插件
    :PluginClean!           -清除列表中没有的插件

### CoVim（团队协作插件）

> 团队协作插件，通过网络多人同时编辑一个文件

插件使用说明：
    
    启动一个 CoVim 服务器端，在 Vim 下执行
    :CoVim start [port] [name] 
    (或在终端下执行: ./CoVimServer.py [port])

    客户端使用下面的命令连接到服务器端
    :CoVim connect [host address / 'localhost'] [port] [name]
    
    断开同步连接
    :CoVim disconnect
    
    退出 CoVim 
    :CoVim quit or :qall!

### Ag（搜索文件内关键词）
 
> 快速搜索目录下全部文件内的关键词的插件，需要安装客户端（比ack速度要快）

插件使用说明：

命令格式：  

    Ag [options] {pattern} [{directory}]

键盘快捷键：

    In the quickfix window, you can use:
    e    to open file and close the quickfix window
    o    to open (same as enter)
    go   to preview file (open but maintain focus on ag.vim results)
    t    to open in new tab
    T    to open in new tab silently
    h    to open in horizontal split
    H    to open in horizontal split silently
    v    to open in vertical split
    gv   to open in vertical split silently
    q    to close the quickfix window

### CtrlP 与 ctrlp-funky（搜索文件名与函数导航）

> 搜索工作目录下目录名与文件名的插件与函数导航插件，需要先安装 ag 或 ack 插件

插件使用说明:

    CtrlP：
    <CTRL-p>
    
    CtrlP-funky：
    <Leader>fu
    <Leader>fU

运行 `:CtrlP` 或 `:CtrlP 要检索的目录` 来运行CtrlP，也可以在 Vim 的 NORMAL 模式下用快捷键 `<Leader><Ctrl+P>` 来运行

Run :CtrlPBuffer or :CtrlPMRU to invoke CtrlP in find buffer or find MRU file mode.

Run :CtrlPMixed to search in Files, Buffers and MRU files at the same time.

Check :help ctrlp-commands and :help ctrlp-extensions for other commands.

> 以下快捷键在 CtrlP 打开时才能在下方 CtrlP 窗口内使用:

按 `<F5>` 为当前目录清除缓存来显示新的文件，去除已删除的文件和应用新的忽略选项

Press `<c-f>` and `<c-b>` to cycle between modes

输入 `<ctrl＋d>` 切换在目录名还是在文件名搜索关键词

Press `<c-r>` to switch to regexp mode

Use `<c-j>`, `<c-k>` or the arrow keys to navigate the result list

选择文件后按 `<ctrl＋t>` 用新的 Tab 打开，`<ctrl＋v>` 用新的竖屏分割打开， `<ctrl+x>` 用新的横屏分割打开

按 `<ctrl＋n>` 或 `<ctrl＋p>` 来切换前一个或后一个执行过的命令历史记录

输入一个要建立的新文件名后输入 `<ctrl＋y>` 自动创建这个文件，如果这个文件的路径目录不存在，自动建立目录.

用 `<ctrl＋z>` 选择或者取消选择多个文件， 选择后按 `<ctrl＋o>` 打开这些文件.

### CtrlSF（使 ag/ack 的搜索显示多行搜索结果）

> 使 ag/ack 的搜索结果从单行变成同时显示多行搜索结果的上下文的插件，需要先安装 ag 或 ack 插件

插件使用说明：
 
键盘快捷键：

输入后在底部 Ex 命令行出现 :CtrlSF 后输入搜索关键词按回车键搜索

    <C-F>f

在 VISUAL 模式选择一个词语后自动添加到搜索内容的位置

    <C-F>f

在 VISUAL 模式选择一个词语后自动执行搜索操作

    <C-F>F

    <C-F>n

    <C-F>p

再次打开 CtrlSF 搜索结果窗口

    <C-F>o

> 下面的命令只能在 CtrlSF 窗口中使用：

    o, Enter - Jump to file that contains the line under cursor.
    t - Like o but open file in a new tab.
    p - Like o but open file in a preview window.
    O - Like o but always leave CtrlSF window opening.
    T - Lkie t but focus CtrlSF window instead of opened new tab.
    q - Quit CtrlSF window.
    <C-J> - Move cursor to next match.
    <C-K> - Move cursor to previous match.
    In preview window:
    q - Close preview window.
    
### vim-easymotion（快速搜索／跳转插件）

> 快速搜索／跳转插件

插件使用说明：

vim-easymotion 默认的快捷键：

    把下面的内容按单词快速搜索跳转
    <Leader><Leader>w

    通过一个字符进行搜索跳转
    <Leader><Leader>f

其它快捷键：

快速跳转到行：
输入 `<Leader>j` 或 `<Leader>k` 后输入下面行首出现的红色字母快速跳转到红色字母所在行

代替 Vim 的 / 搜索功能：
在 NORMAL 模式下输入 `/` 后输入要搜索的关键词后按回车，按 `n` 或 `N` 键跳转到上一个或下一个搜索的关键词

通过一个或两个字符进行搜索跳转
按 `s` 后输入一个或两个要跳转位置的字符，按红色字母跳转到红色字母所在位置，按 `t` 跳转到前一个字符

### Nerdtree（显示目录树与加强功能的插件）

> 显示目录树与加强功能的插件

插件使用说明：

按 `F8` 打开／关闭目录树

常用的快捷键：

    j、k    分别下、上移动光标
    o       或者回车打开文件或是文件夹，如果是文件的话，光标直接定位到文件中，想回到目录结构中，按住 Ctrl，然后点两下 w 就回来了
    go      打开文件，但是光标不动，仍然在目录结构中
    i、s    分别是水平、垂直打开文件，就像vim命令的 :vs、:sp一样
    gi、gs  水平、垂直打开文件，光标不动
    p       快速定位到上层目录
    P       快速定位到根目录
    K、J    快速定位到同层目录第一个、最后一个节点
    q       关闭
    
### vim-multiple-cursors（同时选择多个文本）

> 选择多个文本、修改的插件

插件使用说明：

Map start key separately from next key
`<F6>`

cursor next key=`<C-n>`
cursor prev key=`<C-p>`
cursor skip key=`<C-x>`
cursor quit key=`<Esc>`

### vim-indent-guides（显示缩进对齐线）

> 显示缩进对齐线的插件

插件使用说明：

输入 `<leader>si` 打开或关闭显示对齐线

### vim-surround（字符串包围／改变或者去除引号）

> 快速为字符串包围／改变或者去除引号／括号或者HTML标签

插件使用说明：

命令模式下：

    ysiw"   当前光标所在的单词包围上双引号
    yssb    为一行包围圆括号
    yss"    为一行包围双引号
    ySS     在上一行与下一行添加符号
    cs"(    是将双引号变成圆括号
    cst<p>  把 <> 标签里的内容改成 <p> 标签
    cst"    是将 <p> 这种类型的包围替换成双引号
    ds"     是去除双引号包围
    dst     是删除 <div> 这种类型的包围

### Goyo（全屏写作）

> 类似 IA Writer 的全屏写作模式插件

插件使用说明：

输入 `<leader>z` 打开IA Writer全屏写作模式

### vim-airline（底部信息栏增强显示） 

> Vim 底部信息栏增强显示插件

插件使用说明：

使用 `<Leader>1` 至 `<Leader>9` 切换顶部各个 buffer（可以理解为打开的多个文件）

### rainbow_parentheses（成对括号显示）

> 成对括号显示增强插件

插件使用说明：

    :RainbowParenthesesToggle               " Toggle it on/off
    :RainbowParenthesesLoadRound            " (), the default when toggling
    :RainbowParenthesesLoadSquare           " []
    :RainbowParenthesesLoadBraces           " {}
    :RainbowParenthesesLoadChevrons         " <>


### gundo（编辑文件时可以恢复到任意修改点）

> 编辑文件时可以恢复到任意修改点的插件

插件使用说明：

按 `<F5>` 启动此功能，在左侧选择恢复的时间点后按回车键

### tabular（让代码以=或其它符号对齐）

> 让代码更加易于纵向排版，以=或,符号对齐

插件使用说明：

在 Vim Ex 模式输入 :Tabularize /= 则按照 ＝ 号对齐，其他符号使用方法一样

如果在 VISUAL 模式下选择多行文本后执行，则只对选择的行生效

下面的快捷键在配置文件里修改：

    <Leader>a&        等同于    :Tabularize /&
    <Leader>a&        等同于    :Tabularize /&
    <Leader>a=        等同于    :Tabularize /=
    <Leader>a=        等同于    :Tabularize /=
    <Leader>a=>       等同于    :Tabularize /=>
    <Leader>a=>       等同于    :Tabularize /=>
    <Leader>a:        等同于    :Tabularize /:
    <Leader>a:        等同于    :Tabularize /:
    <Leader>a::       等同于    :Tabularize /:\zs
    <Leader>a::       等同于    :Tabularize /:\zs
    <Leader>a,        等同于    :Tabularize /,
    <Leader>a,        等同于    :Tabularize /,
    <Leader>a,,       等同于    :Tabularize /,\zs
    <Leader>a,,       等同于    :Tabularize /,\zs
    <Leader>a<Bar>    等同于    :Tabularize /<Bar>
    <Leader>a<Bar>    等同于    :Tabularize /<Bar>
            
### vim-less（Less 转换成 Css）

> Less 语法与转换成 Css 文件的插件

    <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>            
### vim-easy-align（快速对齐）

> 按照空格、＝号、:号快速自动对齐的插件

插件使用说明：

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
`<Enter> <Plug>(EasyAlign)`

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
`ga <Plug>(EasyAlign)`

### emmet-vim（快速写Html、Css代码）

> 快速写Html、Css代码的插件

插件使用说明：

编辑一个 .html 文件，输入 html:5 后 按 `Ctrl＋y`  然后输入 `Leader` 键

### nerdcommenter（添加软件注释）

> 添加软件注释的插件

插件使用说明：

Comment out the current line or text selected in visual mode.

    <leader>cc

Same as <leader>cc but forces nesting.

    <leader>cn

Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.

    <leader>c

Comments the given lines using only one set of multipart delimiters.

    <leader>cm

Toggles the comment state of the selected line(s) individually.

    <leader>ci

Comments out the selected lines ``sexily''

    <leader>cs

Same as <leader>cc except that the commented line(s) are yanked first.

    <leader>cy

Comments the current line from the cursor to the end of line.

    <leader>c$

Adds comment delimiters to the end of line and goes into insert mode between them.

    <leader>cA

Switches to the alternative set of delimiters.

    <leader>ca

为选择行添加对齐的注释，对齐方式为左对齐`<leader>cl`或两头对齐`<leader>cb`.

    <leader>cl
    <leader>cb

删除选择行的注释

    <leader>cu

