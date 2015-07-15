# Vim 及插件安装手册

## 安装 Vim

### 安装 Brew for Mac

参考 “Mac开发终端配置（一）Homebrew安装教程”

### 安装 Vim for Mac

    brew install macvim --env-std --override-system-vim  
    brew install vim --env-std --override-system-vim  

> Vim 的部分功能与插件需要 python 才能正常使用

    brew install python                // 安装 python 2.x
    brew install python3               // 安装 python 3.x

## 安装 Vundle

Vundle 是 Vim 的插件管理工具，可以通过一个命令自动安装、升级、卸载 Vim 的所有插件在系统终端下执行下面的命令安装 Vundle 插件管理工具：

> 需要使用 git 命令安装，如果没有执行下面的指令安装：

    apt-get install git                // Ubuntu Linux
    brew    install git                // OS X

> 使用下面的命令安装 Vundle：

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## 安装 Vim 插件

### CoVim 

> 团队协作插件，通过网络多人同时编辑一个文件

插件安装准备工作：

> 需要 python 2.5＋

需要在终端下先执行命令安装依赖包:

    pip install twisted argparse

### syntastic

> syntastic 语法检测插件

插件安装准备工作：

> JavaScript 语法检查器的安装，需要安装 jshint，通过 npm 安装

    Ubuntu:
    sudo apt-get install nodejs
    sudo npm i -g jshint

    OS X:
    brew install nodejs
    npm i -g jshint

> 如果是 12.10 的 nodejs 可执行文件的命名不符合常规，要做个链接

    sudo ln -s /usr/bin/nodejs /usr/bind/node


### Ag

> 快速搜索目录下全部文件内的关键词的插件，需要安装客户端（比ack速度要快）

插件安装准备工作：

> OS X   安装 Ag 客户端

    brew install the_silver_searcher

> Ubuntu 安装 Ag 客户端
> 需要 Ubuntu >= 13.10 (Saucy) or Debian >= 8 (Jessie)

    apt-get install silversearcher-ag

### Vim-LESS

> LESS 语法插件与 LESS 转换 CSS 文件的插件

插件安装准备工作：

    npm install -g less
    
### Tagbar

> 一款基于ctags,显示当前的代码结构概览,增加代码浏览的便利程度的插件

插件安装准备工作：

> 安装 ctags

	brew install ctags
	
### Coffee-script

> 运行 Coffee-script 的插件，也可以把 Coffee-script 转换成 javascript

插件安装准备工作：

> 安装 Coffee-Script

	npm i -g coffee

	

### 安装 Vim 配置文件

把 .vimrc 文件 copy 到你的 ~（Home） 目录下

把 .vim   目录 copy 到你的 ~（Home） 目录下

> 如果 Vim 安装的 Airline 需要使用 Powerline 符号的话必须把使用的终端字体都改成 Powerline 的专用字体

**（完成）**

## 安装 Vim 界面风格（如果不安装新的界面风格此步骤可忽略）

> 安装准备工作：
> 在终端下执行

    git clone git://github.com/altercation/solarized.git
    cd solarized
    cd vim-colors-solarized/colors
    mkdir -p ~/.vim/colors
    cp solarized.vim ~/.vim/colors/

> 也可以把其它颜色风格文件拷贝到下面的目录：

    ~/.vim/colors            // "~" 符号代表您的用户主目录

> 拷贝后可以使用下面的命令或其它文本编辑软件修改 ~/.vim/config/ui.vim 文件的相关配置

    vi ~/.vim/config/ui.vim

>> 修改要使用的风格，比如您的风格文件名为：solarized.vim ，设定如下：

    colorscheme solarized

## 更新插件（如果不需要更新插件此步骤可忽略）

> 启动 Vim 后输入 : 进入 Ex 命令模式

    :PluginInstall           // 安装所有插件

    :PluginInstall!          // 升级全部插件到最新版本



