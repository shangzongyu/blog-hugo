+++
title = "APUE 和 UNP 环境搭建"
date = 2020-12-30
lastmod = 2021-01-11T12:32:32+08:00
draft = false
weight = 2001
+++

这篇文章主要介绍 APUE 和 UNP 环境在 Linux 和 FreeBSD 系统下搭建的介绍。

<!--more-->

-   网站：<http://www.apuebook.com/code2e.html>
-   版本：APUE 第三版


## 准备 {#准备}

1.  到官网下载 APUE 的源码: `wget http://www.apuebook.com/src.3e.tar.gz`
2.  解压: `tar -zxvf src.3e.tar.gz`


## 编译 {#编译}


### Linux {#linux}

Linux 自己平常使用的 Ubuntu，因此这里介绍在 Ubuntu 20.04 下的搭建。

```sh
# 安装编译需要的工具
sudo apt install make gcc
# 安装开发工具
sudo apt-get install libbsd-dev

# 进入到刚才解压的目录中
$ cd apue.3e/
# 执行 make 进行编译，如果编译过程中出现错误，看错误解决即可
$ make
...

# 测试
$ cd intro
$ ./hello
hello world from process ID 3380
```

复制生成的静态库 `libapue.a` 到 `/usr/lib` 目录下:

```sh
sudo cp include/apue.h /usr/include/
sudo cp lib/error.c /usr/include/
sudo cp lib/libapue.a /usr/lib
```

如果使用 `err_sys` 等函数在编译时找不到的问题： 在 `apue.h` 文件里 添加 `#include "error.c"` 即可。


#### 错误处理 {#错误处理}

<!--list-separator-->

-  devrdev.c:(.text+0xc5): undefined reference to \`minor'

    详细错误如下：

    ```text
    /usr/bin/ld: /tmp/cc3oujjJ.o: in function `main':
    devrdev.c:(.text+0xc5): undefined reference to `minor'
    /usr/bin/ld: devrdev.c:(.text+0xdb): undefined reference to `major'
    /usr/bin/ld: devrdev.c:(.text+0x128): undefined reference to `minor'
    /usr/bin/ld: devrdev.c:(.text+0x13e): undefined reference to `major'
    collect2: error: ld returned 1 exit status
    make[1]: *** [Makefile:18: devrdev] Error 1
    make[1]: Leaving directory '/home/shine/apue.3e/filedir'
    make: *** [Makefile:6: all] Error 1
    ```

    解决方法:

    ```text
    编译 makefile 不编译 filedir
    ```

<!--list-separator-->

-  buf.c: In function ‘is\_unbuffered’:

    详细错误如下：

    ```text
     make[1]: Entering directory '/home/shine/apue.3e/stdio'
    gcc -ansi -I../include -Wall -DLINUX -D_GNU_SOURCE  buf.c -o buf  -L../lib -lapue
    buf.c: In function ‘is_unbuffered’:
    buf.c:90:15: error: ‘FILE’ {aka ‘struct _IO_FILE’} has no member named ‘__pad’; did you mean ‘__pad5’?
       90 | #define _flag __pad[4]
          |               ^~~~~
    buf.c:98:13: note: in expansion of macro ‘_flag’
       98 |  return(fp->_flag & _IONBF);
          |             ^~~~~
    buf.c: In function ‘is_linebuffered’:
    buf.c:90:15: error: ‘FILE’ {aka ‘struct _IO_FILE’} has no member named ‘__pad’; did you mean ‘__pad5’?
       90 | #define _flag __pad[4]
          |               ^~~~~
    buf.c:104:13: note: in expansion of macro ‘_flag’
      104 |  return(fp->_flag & _IOLBF);
          |             ^~~~~
    buf.c: In function ‘buffer_size’:
    buf.c:92:15: error: ‘FILE’ {aka ‘struct _IO_FILE’} has no member named ‘__pad’; did you mean ‘__pad5’?
       92 | #define _base __pad[2]
          |               ^~~~~
    buf.c:111:13: note: in expansion of macro ‘_base’
      111 |  return(fp->_base - fp->_ptr);
          |             ^~~~~
    buf.c:91:14: error: ‘FILE’ {aka ‘struct _IO_FILE’} has no member named ‘__pad’; did you mean ‘__pad5’?
       91 | #define _ptr __pad[1]
          |              ^~~~~
    buf.c:111:25: note: in expansion of macro ‘_ptr’
      111 |  return(fp->_base - fp->_ptr);
          |                         ^~~~
    buf.c: In function ‘is_unbuffered’:
    buf.c:99:1: warning: control reaches end of non-void function [-Wreturn-type]
       99 | }
          | ^
    buf.c: In function ‘is_linebuffered’:
    buf.c:105:1: warning: control reaches end of non-void function [-Wreturn-type]
      105 | }
          | ^
    buf.c: In function ‘buffer_size’:
    buf.c:115:1: warning: control reaches end of non-void function [-Wreturn-type]
      115 | }
          | ^
    make[1]: *** [Makefile:16: buf] Error 1
    make[1]: Leaving directory '/home/shine/apue.3e/stdio'
    make: *** [Makefile:6: all] Error 1
    ```

    解决方法:

    修改 `stdio/buf.c` 文件, 把 `flag` 字段全部替换为 =flalgs=。

    修改函数 `buffer_size` :

    `return(fp->_base - fp->_ptr);` 修改为 `return(fp->_IO_buf_end - fp->_IO_buf_base);`

<!--list-separator-->

-  Makefile:31: recipe for target 'badexit2' failed

    详细错误如下：

    ```text
    ...
    gcc -ansi -I../include -Wall -DLINUX -D_GNU_SOURCE  badexit2.c -o badexit2  -L../lib -lapue -pthread -lrt -lbsd
    /usr/bin/ld: cannot find -lbsd
    collect2: error: ld returned 1 exit status
    Makefile:31: recipe for target 'badexit2' failed
    make[1]: *** [badexit2] Error 1
    ...
    ```

    解决方法:

    ```sh
    # 安装包 libbsd-dev=
    sudo apt install -y libbsd-dev
    ```


### FreeBSD {#freebsd}

FreeBSD 没有那么多发行版，只需要选择版本就可以了，自己日常使用 FreeBSD 12。

FreeBSD 现在默认使用 `llvm` 而不是使用 =gcc=，因此需要安装 =gcc=。

不过自己想使用 `clang` 编译，而不是使用 `gcc` 编译，因此需要修改 Makefile, 这个需要耗费一些时间，因此 TODO 吧，尽快更新。
