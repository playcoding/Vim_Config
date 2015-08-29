# Vim 及插件安装手册

## 安装 Vim

### 安装 Brew for Mac

参考 “Mac开发终端配置（一）Homebrew安装教程”

### 安装 Vim 

#### Mac

    brew install macvim --env-std --override-system-vim  
    brew install vim --env-std --override-system-vim  

> Vim 的部分功能与插件需要 python 才能正常使用

    brew install python                // 安装 python 2.x
    brew install python3               // 安装 python 3.x
    
#### Ubuntu Linux

##### 安装源方式(不安装任何插件时推荐此方式安装)：

	sudo apt-get update  
	sudo apt-get install software-properties-common  
	sudo apt-get install python-software-properties

> 要先安装上面的 python-software-properties 才能使用下面的 add-apt-repository 命令

	sudo add-apt-repository ppa:nmi/vim-snapshots
	
	sudo apt-get update
	
	sudo apt-get install vim
	
##### 源码安装方式：

一、下载所需工具

编译Vim之前，需要下载编译的相关工具和一些库

	sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev 
	                     libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev
	                     libx11-dev libxpm-dev libxt-dev python-dev ruby-dev 
	                     mercurial texinfo git subversion build-essential


> YouCompleteMe 插件需要 cmake 2.8.11 以上版本，最好安装最新的版本。

如果需要先卸载旧版CMake

	apt-get autoremove cmake
	
下载安装cmake:

    cd /usr/local	
	wget http://www.cmake.org/files/v3.2/cmake-3.2.2.tar.gz
	tar zxvf cmake-3.2.2.tar.gz       // 解压压缩包
	cd cmake-3.2.2
	sudo ./configure
	sudo make
	sudo make install
    sudo mv cmake-3.2.2 cmake  // 修改文件夹名 
    
添加环境变量  
用vi在文件/etc/profile文件中增加变量，使其永久有效：
	
	vi /etc/profile   // 修改环境变量   

在文件末尾追加以下两行代码：

	PATH=/usr/local/cmake/bin:$PATH  
	export PATH   
	
然后执行以下操作：	

	source /etc/profile   //使修改生效  
	
	echo $PATH   //查看PATH值   
	
检验cmake安装
	
	cmake --version
	

二、卸载老版本vim

在安装新版本的Vim之前，你需要卸载原来安装的老版本Vim，依次在终端下执行下列命令：

    sudo apt-get remove vim  
    sudo apt-get remove vim-runtime  
    sudo apt-get remove gvim  
    sudo apt-get remove vim-tiny  
    sudo apt-get remove vim-common  
    sudo apt-get remove vim-gui-common  

三、下载新版

网址为：(ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2)

	tar -xjvf vim-7.4.tar.bz2

解压至 ~/downloads/vim74/

四、编译安装

	cd ~/downloads/vim74/

设置Vim源码的编译属性

	./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp
	            --with-python-config-dir=/usr/lib/python2.7/config-i386-linux-gnu/
	            --enable-perlinterp --enable-gui=gtk2 --enable-cscope 
	            --enable-luainterp --enable-perlinterp --enable-multibyte
	            --prefix=/usr

需要重新配置可 输入 make distclean #清理一下上一次编译生成的所有文件

其中参数说明如下：

	--with-features=huge：支持最大特性
	--enable-rubyinterp：启用Vim对ruby编写的插件的支持
	--enable-pythoninterp：启用Vim对python编写的插件的支持
	--enable-luainterp：启用Vim对lua编写的插件的支持
	--enable-perlinterp：启用Vim对perl编写的插件的支持
	--enable-multibyte：多字节支持 可以在Vim中输入中文
	--enable-cscope：Vim对cscope支持
	--enable-gui=gtk2：gtk2支持,也可以使用gnome，表示生成gvim
	--with-python-config-dir=/usr/lib/python2.7/config-i386-linux-gnu/ 指定 python 路径
	--prefix=/usr：编译安装路径

	sudo make VIMRUNTIMEDIR=/usr/share/vim/vim74

	sudo make install


（英语参考）

Compiling Vim from source is actually not that difficult. Here's what you should do:

1. First, install all the prerequisite libraries, including Mercurial. For a Debian-like Linux distribution like Ubuntu, that would be the following:

	   sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
	        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
            libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    		ruby-dev mercurial


	For Fedora 20, that would be the following:

	   sudo yum install -y ruby ruby-devel lua lua-devel luajit \
            luajit-devel ctags mercurial python python-devel \
            python3 python3-devel tcl-devel \
            perl perl-devel perl-ExtUtils-ParseXS \
            perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
            perl-ExtUtils-Embed
            
	This step is needed to rectify an issue with how Fedora 20 installs XSubPP:

	    symlink xsubpp (perl) from /usr/bin to the perl dir
        sudo ln -s /usr/bin/xsubpp /usr/share/perl5/ExtUtils/xsubpp 

2. Remove vim if you have it already.

	    sudo apt-get remove vim vim-runtime gvim

	On Ubuntu 12.04.2 you probably have to remove these packages as well:

	    sudo apt-get remove vim-tiny vim-common vim-gui-common
	    
3. Once everything is installed, getting the source is easy. If you're not using vim 7.4, make sure to set the VIMRUNTIMEDIR variable correctly below (for instance, with vim 7.4a, use /usr/share/vim/vim74a):

		cd ~  
		hg clone https://code.google.com/p/vim/  
		cd vim  
		./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr

		make VIMRUNTIMEDIR=/usr/share/vim/vim74

		sudo make install

	If you want to be able to easily uninstall the package use checkinstall instead of sudo make install

		sudo apt-get install checkinstall
		cd vim
		sudo checkinstall

	Set vim as your default editor with update-alternatives.

		sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
		sudo update-alternatives --set editor /usr/bin/vim
		sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
		sudo update-alternatives --set vi /usr/bin/vim
		
4. Double check that you are in fact running the new Vim binary by looking at the output of vim --version.

	If you don't get gvim working (on ubuntu 12.04.1 LTS), try changing --enable-gui=gtk2 to --enable-gui=gnome2

	You may need to add

		--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ to the configure call.

	These configure and make calls assume a Debian-like distro where Vim's runtime files directory is placed in /usr/share/vim/vim74/, which is not Vim's default. Same thing goes for --prefix=/usr in the configure call. Those values may need to be different with a Linux distro that is not based on Debian. In such a case, try to remove the --prefix variable in the configure call and the VIMRUNTIMEDIR in the make call (in other words, go with the defaults).

	If you get stuck, here's some other useful information on building Vim.


## 安装 Vundle

Vundle 是 Vim 的插件管理工具，可以通过一个命令自动安装、升级、卸载 Vim 的所有插件在系统终端下执行下面的命令安装 Vundle 插件管理工具：

> 需要使用 git 命令安装，如果没有执行下面的指令安装：

    apt-get install git                // Ubuntu Linux
    brew    install git                // OS X

> 使用下面的命令安装 Vundle：

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

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

### YouCompleteMe

#### Ubuntu Linux 安装

> Ubuntu12.04 LTS默认GCC G++为4.6.*版本（新版本 Clang 要求 G++ 4.7 - 5.1 版），4.6不支持最新的c++11标准。 

以下介绍升级GCC/G++：  

加入此源为必须，否则查找不到要升级的版本  

	sudo add-apt-repository ppa:ubuntu-toolchain-r/test 
	sudo apt-get update  
	sudo apt-get install gcc-4.8  
	sudo apt-get install g++-4.8  
	sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20  
	sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20  
	sudo update-alternatives --config gcc  
	sudo update-alternatives --config g++  

	gcc --version  
	g++ --version  

显示为升级之后的版本，接下来就可以放心使用-std=c++11命令了。  

- LLVM、clang 源码安装:

		mkdir ~/llvm-clang
    
  	    cd ~/llvm-clang
  	    
        svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm
        
        cd llvm/tools
        
        svn co http://llvm.org/svn/llvm-project/cfe/trunk clang
        
        cd ../..
        
        cd llvm/tools/clang/tools
        
        svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra
        
        cd ../../../..
        
        cd llvm/projects
        
        svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt
        
        cd ..
        
返回~/llvm-clang目录，并新建一个目录build专门用于编译llvm-clang，使得不污染源码。

	sudo mkdir build

	cd build/

	../llvm/configure --enable-optimized

建立编译环境

此种配置后，llv-clang默认安装到目录 /usr/local/ 下， 如果想改变安装目录，则加上配置： --prefix=Path 来制定 输入 

	make -j4

(本人机器为双核）开始编译

	sudo make install

进行安装

如要卸载则在该目录下输入

	sudo make uninstall

安装好后，输入 clang -v查看版本信息：

安装clang标准库

clang 的标准库————libc++(接口层)和 libc++abi(实现层)需要安装头文件和动态链接库(*.so)。

安装libc++

    cd ~/llvm-clang  
    svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx  
    cd libcxx/lib
    ./buildit
        
头文件已经生成到 ~/llvm-clang/libcxx/include/,要让 clang 找到必须复制到 /usr/include/c++/v1/

cp -r ~/llvm-clang/libcxx/include/ /usr/include/c++/v1/

*.so 文件已生成 ~/llvm-clang/libcxx/lib/libc++.so.1.0,要让 clang 访问必须复 制到 /usr/lib/,并创建软链接

    ln -s ~/llvm-clang/libcxx/lib/libc++.so.1.0 ~/llvm-clang/libcxx/lib/libc++.so.1
    ln -s ~/llvm-clang/libcxx/lib/libc++.so.1.0 ~/llvm-clang/libcxx/lib/libc++.so
    cp ~/dllvm-clang/libcxx/lib/libc++.so* /usr/lib/
    
类似,源码安装 libc++abi 的头文件和动态链接库:

    cd  ~/llvm-clang/
    svn co http://llvm.org/svn/llvm-project/libcxxabi/trunk libcxxabi
    cd libcxxabi/lib
    ./buildit
    
头文件已经生成到 ~/llvm-clang/libcxxabi/include/,要让 clang 找到必须复制到 /usr/include/c++/v1/

	cp -r ~/llvm-clang/libcxxabi/include/ /usr/include/c++/v1/

*.so 文件已生成 ~/llvm-clang/libcxx/lib/libc++abi.so.1.0,要让 clang 访问必 须复制到 /usr/lib/,并创建软链接

	ln -s ~/llvm-clang/libcxxabi/lib/libc++abi.so.1.0 ~/llvm-clang/libcxxabi/lib/libc++abi.so.1

	ln -s ~/llvm-clang/libcxxabi/lib/libc++abi.so.1.0 ~/llvm-clang/libcxxabi/lib/libc++abi.so

	cp ~/llvm-clang/libcxxabi/lib/libc++abi.so* /usr/lib/

后续可以通过如下选项进行代码编译:

	clang++ -std=c++11 -stdlib=libc++ -Werror -Weverything 
	        -Wno-disabled-macro-expansion -Wno-float-equal -Wno-c++98-compat 
	        -Wno-c++98-compat-pedantic -Wno- global-constructors 
	        -Wno-exit-time-destructors -Wno-missing-prototypes -Wno-padded 
	        -lc++ -lc++abi main.cpp

参数说明：

-std=c++11: 使用 C++11 新特性;  
-stdlib=libc++: 指定使用 clang 的标准库头文件 /usr/include/c++/v1/;  
-Werror: 将所有编译警告视为编译错误;  
-Weverything: 打开所有编译警告选项。在 GCC 中,无法通过单个选项打开所有 编译警告,必须繁琐的同时指定 -Wall、-Wextra、以及大量分散的其他选项,为此clang 新增了 -Weverything。当然,有些警告意义不大,完全可忽略,如下;  
-Wno-disabled-macro-expansion:禁止使用宏表达式,忽略此警告;  
-Wno-float-equal:浮点类型不应使用 != 和 == 运算符,忽略此警告;  
-Wno-c++98-compat、-Wno-c++98-compat-pedantic:采用 C++11 新特性的代 码无法兼容 C++98,忽略此警告;  
-Wno-global-constructors:在 main() 之前存在执行的代码,忽略此警告;  
-Wno-exit-time-destructors:在 main() 之后存在执行的代码,忽略此警告;  
-Wno-missing-prototypes:虽有函数定义但缺失函数原型,忽略此警告;  
-Wno-padded:结构体大小应为 4 字节整数倍,忽略此警告(编译器自动调整对齐 边界);  
-lc++:指定链接 /usr/lib/libc++.so 标准库;  
-lc++abi:指定链接 /usr/lib/libc++abi.so 标准库。注意:这两个选项非常重要,缺失将导致链接失败!  
这些参数在YouCompleteMe的配置文件.ycm_extra_conf.py的flags中设置  

LLVM、Clang 的安装目录为

	/usr/local/bin
	
	/usr/local/lib/libclang.so 




- LLVM、clang 二进制安装

到 www.llvm.org 下载最新的 clang Pre-built Binaries包

	sudo wget http://www.llvm.org/releases/3.6.2/clang+llvm-3.6.2-x86_64-linux-gnu-ubuntu-14.04.tar.xz
	
解压文件：

	sudo tar zxvf clang+llvm-3.6.2-x86_64-linux-gnu-ubuntu-14.04.tar.xz
	
	sudo mv 上面解压出的目录 ~/llvm_temp     // 目录改名


安装配置YouCompleteMe

 
 Ubuntu Linux
 
 	首先用文章起始的方法安装最新版本的 cmake
 	
 	sudo apt-get install python-dev
 
 Mac
 	
 	brew install cmake      // Mac 系统 brew 安装 cmake 是最新版本

	安装 python-dev          // Mac下默认提供，否则请安装command line tools
 	
    

1. 使用vundle，在vimrc文件中加入（推荐使用下面的编号2.手动编译安装） 

	    Plugin 'Valloric/YouCompleteMe'  //配置文件中是默认注释掉未生效的状态，手动打开
	
	    :PluginInstall                   // 在 Vim 的 EX 扩展模式输入命令自动安装
	    
   等待vundle将YouCompleteMe安装完成后进行编译安装：
   
   > 下面的方法只部分适应于 Linux 与 Mac，有时候会安装失败，推荐使用下面的方法2.手动编译安装，如果使用的是源代码编译安装的 LLVM 与 Clang 则必须使用 方法2.手动编译安装

	    cd ~/.vim/bundle/YouCompleteMe  
	    
   > （下面的命令在 Mac 上测试成功）
   
	    ./install.py --clang-completer --system-libclang --system-boost
	
   > 如果不需要c-family的补全，可以去掉--clang-completer。如果需要c#的补全，请加上--omnisharp-completer。
   YCM会去下载clang的包，用系统clang的包 --system-libclang。
   打开vim，如果没有提示YCM未编译，则说明安装已经成功了。	    
	    
2. 手动编译安装（此插件容量较大，推荐使用此方式，因为此方式下载时有百分比进度）

        cd ~/.vim/bundle

	    sudo git clone --recursive https://github.com/Valloric/YouCompleteMe.git  
	    
获取最新的仓库

		cd YouCompleteMe

		sudo git submodule update --init --recursive     //下载依赖包
		

执行命令：

    cd ~
    
    mkdir ~/ycm_build
    
    cd ~/ycm_build
    
**llvm、clang源码编译使用下面的命令：**

> （下面的命令在 Ubuntu 12.04 下测试成功）

    sudo cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=/usr/local/lib/libclang.so . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
    
> Mac 系统下上面的参数要改成 -DEXTERNAL_LIBCLANG_PATH=/path/to/libclang.dylib
    
执行命令： 
	
	sudo make ycm_core
	
	在~/.vim/bundle/YouCompleteMe/python/目录下自动生成两个文件(libclang.so和ycm_core.so)

执行命令：

	sudo make ycm_support_libs
	
	这条命令生成文件ycm_client_support.so。因为，YouCompleteMe是C/S架构的，所以存在服务器和服务端的说法。



**llvm、clang 二进制包使用下面的命令：** (支持 Ubuntu 14.04 与 Mac、不支持 Ubuntu 12.04)

> Mac 系统下面的参数要改成 -DEXTERNAL_LIBCLANG_PATH=/path/to/libclang.dylib
   
    sudo cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DPATH_TO_LLVM_ROOT=~/llvm_temp/ . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
    
> 上面的命令不成功的话则必须使用 -DEXTERNAL_LIBCLANG_PATH=/path/to/libclang.so 指定 libclang.so 的位置

_**重要信息**_
> 
使用中发现 Mac 系统必须使用 `-DUSE_SYSTEM_LIBCLANG=ON`标签（使用系统自带的 Libclang ），此标签不能与 `-DPATH_TO_LLVM_ROOT`标签（指定LLVM_Clang 二进制包的安装目录）同时使用 ，后者只能用在 LLVM Clang 是 BIN 二进制安装的方式，不能用在源码安装的方式，Clang 源码方式只能使用 `-DEXTERNAL_LIBCLANG_PATH` 标签（指定 libclang.so 的位置），但 Clang BIN 二进制方式可以同时使用 `-DPATH_TO_LLVM_ROOT` 与 `-DEXTERNAL_LIBCLANG_PATH`

执行命令：

	sudo make ycm_support_libs
	
这条命令生成文件ycm_client_support.so。因为，YouCompleteMe是C/S架构的，所以存在服务器和服务端的说法。



### 安装 Vim 配置文件

把 .vimrc 文件 copy 到你的 ~（Home） 目录下

把 .vim   目录 copy 到你的 ~（Home） 目录下

> 如果 Vim 安装的 Airline 需要使用 Powerline 符号的话必须把使用的终端字体都改成 Powerline 的专用字体

**（完成）**

## 安装 Vim 界面风格（安装包中以包含下面的风格，并默认启用）

> 安装准备工作：
> 在终端下执行

    git clone git://github.com/altercation/solarized.git
    cd solarized
    cd vim-colors-solarized/colors
    mkdir -p ~/.vim/colors
    cp solarized.vim ~/.vim/colors/

> 也可以把其它颜色风格文件拷贝到下面的目录：

    ~/.vim/colors            // "~" 符号代表您的用户主目录

> 可以使用下面的命令或其它文本编辑软件修改 ~/.vim/config/ui.vim 文件的相关显示风格

    vi ~/.vim/config/ui.vim

>> 修改要使用的风格，比如您的风格文件名为：solarized.vim ，设定如下：

    colorscheme solarized

## 更新插件（如果不需要更新插件此步骤可忽略）

> 启动 Vim 后输入 : 进入 Ex 命令模式

    :PluginInstall           // 安装所有插件

    :PluginInstall!          // 升级全部插件到最新版本



