+++
title = "macOS 的一些开发环境搭建"
lastmod = 2018-12-05T11:13:27+08:00
tags = ["macOS"]
categories = ["macOS"]
draft = false
+++

## Docker 环境搭建 {#docker-环境搭建}


### 安装步骤 {#安装步骤}

Mac 下 Docker 的安装真心建议跟着官方的文档走一遍，官网已经讲的很详细了。

<https://docs.docker.com/docker-for-mac/install/#what-to-know-before-you-install>


### 使用 Docker for Mac {#使用-docker-for-mac}

<https://docs.docker.com/docker-for-mac/#check-versions-of-docker-engine-compose-and-machine>


### 配置 Docker 加速器 {#配置-docker-加速器}

Docker 加速器是什么，我需要使用吗？

使用 Docker 的时候，需要经常从官方获取镜像，但是由于显而易见的网络原因，拉取镜像的过程非常耗时，严重影响使用 Docker 的体验。因此 DaoCloud 推出了加速器工具解决这个难题，通过智能路由和缓存机制，极大提升了国内网络访问 Docker Hub 的速度，目前已经拥有了广泛的用户群体，并得到了 Docker 官方的大力推荐。如果您是在国内的网络环境使用 Docker，那么 Docker 加速器一定能帮助到您。

到这<https://www.docker-cn.com/registry-mirror> 获得配置：

{{< figure src="media/15334013744291/docker-mirrors.png" caption="Figure 1: docker-mirrors" >}}


### 入门案例 {#入门案例}

跟着下面的文章进行敲一遍，熟悉下 Docker 整个的使用。

<https://www.jianshu.com/p/cf6e7248b6c7>


### Docker 常用命令 {#docker-常用命令}

下面列出些自己常用的命令，目的就是记录下来，以后忘记了，再拿来跟着敲就行！

-   =docker run -i -t /bin/bash=：启动容器并启动bash（交互方式）
-   =docker run -d -it image\_name=：启动容器以后台方式运行(更通用的方式）
-   =docker ps=：列出当前所有正在运行的container
-   =docker ps -a=：列出所有的container
-   =docker ps -l=：列出最近一次启动的container
-   =docker images=：列出本地所有的镜像
-   =docker rmi imagesID=：删除指定的镜像id
-   =docker rm CONTAINER ID=：删除指定的CONTAINER id
-   =docker diff 镜像名=：查看容器的修改部分
-   =docker kill CONTAINER ID=：杀掉正在运行的容器
-   =docker logs 容器ID/name=：可以查看到容器主程序的输出
-   =docker pull image\_name=：下载image
-   =docker push image\_name=：发布docker镜像
-   =docker version=：查看docker版本
-   =docker info=：查看docker系统的信息
-   =docker inspect 容器的id=：可以查看更详细的关于某一个容器的信息
-   =docker run -d image-name=：后台运行镜像
-   =docker search 镜像名=：查找公共的可用镜像
-   =docker stop 容器名/容器 ID=：终止运行的容器
-   =docker restart 容器名/容器 ID=：重启容器
-   =docker commit=：提交，创建个新镜像
-   =docker build [OPTIONS] PATH | URL | -=：利用 Dockerfile 创建新镜像


## Kubernetes 环境搭建 {#kubernetes-环境搭建}


### 介绍 {#介绍}

Minikube 是一个简单实用 K8S 部署 Docker 的工具，详细的文章参考 [Hello Minikube](https://kubernetes.io/docs/tutorials/hello-minikube)
，这个文章主要是为了 macOS 写的，不过也可以找到 Linux/Windows
下相关的信息。


### 准备工作 {#准备工作}


#### 1.1、Mac 电脑环境需求 {#1-dot-1-mac-电脑环境需求}

Minikube 要求在 BIOS 中启用 `VT-x / AMD-v` 虚拟化， 要检查这是否在 macOS 上运行，请执行以下操作：

```sh
sysctl -a | grep machdep.cpu.features | grep VMX
```

如果有输出，说明支持虚拟化。我的输入如下：

```sh
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
```


#### 安装相关软件 {#安装相关软件}

-   kubernetes-cli
-   docker
-   minikube
-   virtualbox

```sh
brew update
brew install kubernetes-cli
brew cask install virtualbox
brew cask install docker
brew cask install minikube
```

校验软件版本信息

```sh
docker --version                # Docker version 18.06.1-ce, build e68fc7a
docker-compose --version        # docker-compose version 1.22.0, build f46880fd
docker-machine --version        # docker-machine version 0.15.0, build b48dc28d
minikube version                # minikube version: v0.30.0
kubectl version --client        # Client Version: version.Info{Major:"1", Minor:"12", GitVersion:"v1.12.0", GitCommit:"0ed33881dc4355495f623c6f22e7dd0b7632b7c0", GitTreeState:"clean", BuildDate:"2018-09-28T15:18:13Z", GoVersion:"go1.11", Compiler:"gc", Platform:"darwin/amd64"}
```


### 开始 {#开始}


#### 启动 kubernetes 集群 {#启动-kubernetes-集群}

```sh
minikube start --bootstrapper=localkube
```

一会后，会有如下输出

```sh
~ » minikube start --bootstrapper=localkube
Starting local Kubernetes v1.10.0 cluster...
Starting VM...
Downloading Minikube ISO
 170.78 MB / 170.78 MB [============================================] 100.00% 0s


Getting VM IP address...
F1024 21:35:51.914683    7031 start.go:231] Error getting cluster bootstrapper: Unknown bootstrapper: localkube
```

Minikube 为你启动了一个虚拟机，并在该虚拟机中运行了 Kubernetes 集群。


#### 查看集群节点信息 {#查看集群节点信息}

```sh
$kubectl get nodes
NAME       STATUS    ROLES     AGE       VERSION
minikube   Ready     <none>    15m       v1.10.0
```


### 资料 {#资料}

-   <https://github.com/kubernetes/minikube>
-   <https://kubernetes.io/docs/tutorials/hello-minikube>


## Clojure 环境搭建 {#clojure-环境搭建}


## 关于 Java {#关于-java}

`Clojure` 是运行在 `JVM` 上的语言，所以依赖一个 Java 运行环境。虽然在 UNIX 平台上有 Oracle JDK 和 OpenJDK 之分，但对于进行基于 JVM 的开发而言，仍旧推荐使用Oracle JDK，好在OS X 为我们提供了这样的环境。Clojure 对 Java 版本并没有特别的要求，于是只要正确设置 Java 的相关环境变量，Clojure就能正常运行。

安装 java：

```sh
brew update
brew caks install java
```

运行 java 和 javac 命令检查相应的版本，以确定这两个命令都能够正常运行即可。

```sh
$ java -version

java version "1.7.0_60"
Java(TM) SE Runtime Environment (build 1.7.0_60-b19)
Java HotSpot(TM) 64-Bit Server VM (build 24.60-b09, mixed mode)

$ javac -version

javac 1.7.0_60
```


## Homebrew 安装 {#homebrew-安装}

对于Clojure而言，Homebrew不是必要的；不过我们要通过 **\*Homebrew** 来安装 **\*Leiningen** 。


### Clojure核心组件 {#clojure核心组件}


#### Clojure {#clojure}

Clojure是一个运行在JVM上的语言，说到底，它的核心就是一个 **\*jar** 包。
可以在Clojure的[官网](http://clojure.org) 上下载到最新的稳定版，现是 **\*Clojure 1.8** 。

解压, 把其中的 **\*clojure-1.8.0.jar** 重新命名为 **\*clojure.jar** 并移动到 **\*/usr/local/lib** 目录下：

```sh
unzip clojure-1.8.0.zip
cd clojure-1.8.0
sudo mkdir /usr/local/lib/clojure
sudo cp clojure-1.8.0.jar /usr/local/lib/clojure/clojure.jar
```

进入 **\*usr/local/lib/clojure** ，进入 **REPL**:

```sh
$ java -cp clojure.jar clojure.main
```

在进入的交互式命令行中，可以用经典的Lisp语法尝试输入一些运算，以及调用一些熟悉的Java函数：

```clojure
(println "Clojure is awesome!")
(+ 2 5)
(System/exit 0)
```


#### clj Script {#clj-script}

如果每次都要切换目录，输入一大串命令来运行 **\*Clojure REPL** ，比较麻烦, 这有一种解决方案：\*clj脚本\*

clj脚本是对Clojure的调用，可以让我们快速进入REPL，也可以直接通过clj命令来运行写好的简单Clojure程序。

clj脚本存放在 **\*/usr/local/bin/** 目录下：

```sh
#!/bin/sh
# Parts of this file come from:
# http://en.wikibooks.org/wiki/Clojure_Programming/Getting_Started#Create_clj_Script

BREAK_CHARS="\(\){}[],^%$#@\"\";:''|\\"
CLOJURE_DIR=/usr/local/lib/clojure
CLOJURE_JAR=$CLOJURE_DIR/clojure.jar
CLASSPATH="$CLOJURE_DIR/*:$CLOJURE_JAR"

while [ $# -gt 0 ]
do
    case "$1" in
    -cp|-classpath)
            CLASSPATH="$CLASSPATH:$2"
    shift ; shift
    ;;
-e) tmpfile="/tmp/`basename $0`.$$.tmp"
    echo "$2" > "$tmpfile"
    shift ; shift
    set "$tmpfile" "$@"
    break # forces any -cp to be before any -e
    ;;
*)  break
    ;;
esac
done

if [ $# -eq 0 ]
then
  exec rlwrap --remember -c -b $BREAK_CHARS \
    -f "$HOME"/.clj_completions \
      java -cp $CLASSPATH clojure.main
else
  exec java -cp $CLASSPATH clojure.main $1 -- "$@"
fi
```

然后给它加上权限：

```sh
sudo chmod +x /usr/local/bin/clj
```

这样就可以通过运行clj命令来进入REPL，同时可以运行clj xxx.clj来测试写好的简单的Clojure程序。


#### Leiningen {#leiningen}

clj命令针对的是小型Clojure程序的调试，如果想用Clojure做上规模的项目，就需要解决各种库和依赖的问题，同时还需要遵循规范的项目目录结构、打包Jar进行部署等问题。

**\*Leiningen** 是一个命令行工具，用来解决Clojure项目的包管理、依赖、打包、部署等问题。关于Leiningen的使用，请参考[这篇教程](http://a0z.me/blog/2015/03/10/lein-tutorial/)。下面介绍它的安装。

Leiningen[官网](http://leiningen.org/)有介绍安装方法，而在 macOS 上，有强大的Homebrew，就可以利用Homebrew进行安装。

```sh
$ brew install leiningen
```


### Clojure 扩展组件 {#clojure-扩展组件}


#### rlwrap Plugin {#rlwrap-plugin}

在运行REPL的时候，会经常遇到输入很长的路径、文件名、包名、函数名的情况，默认的REPL并不像bash一样能有自动补全功能，而 **\*rlwrap** 插件则提供了这个功能，所以这是个非常方便又十分必要的插件。

同样是利用Homebrew安装：

```sh
$ brew install rlwrap
```

**\*rlwrap** 需要配置，而一部分的配置文件已经写在上面的clj中了，接下来要利用一段Clojure程序生成一个文件：

```clojure
; generating the completion file
(def completions (keys (ns-publics (find-ns 'clojure.core))))

(with-open [f (java.io.BufferedWriter. (java.io.FileWriter. (str (System/getenv "HOME") "/.clj_completions")))]
    (.write f (apply str (interpose \newline completions))))

; 如果要生成Clojure中所有的命名空间，把上述第一行改为：
(def completions (mapcat (comp keys ns-publics) (all-ns)))
```

在clj中运行以上代码，就可以生成 **\*<sub>/clj</sub>completions~** 文件。

同时，还要添加 **\*~/.inputrc** 文件：

```sh
set editing-mode vi
tab: complete
set completion-ignore-case on
set blink-matching-paren on
```

接下来，打开clj，体验命令自动补全在Clojure中带来的快感吧！

```clojure
user> clj
Clojure 1.8.0
user=> (re<tab>
re-find                 read-string             ref-min-history         repeat                  reset!
re-groups               reader                  ref-set                 repeatedly              reset-meta!
re-matcher              realized?               refer                   repl                    resolve
re-matches              record?                 refer-clojure           repl-caught             resource
re-pattern              reduce                  reify                   repl-exception          resources
re-quote-replacement    reduce-kv               release-pending-sends   repl-prompt             rest
re-seq                  reduced                 rem                     repl-read               restart-agent
read                    reduced?                remove                  repl-requires           resultset-seq
read-instant-calendar   reductions              remove-all-methods      replace                 reverse
read-instant-date       ref                     remove-method           replace-first           reversible?
read-instant-timestamp  ref-history-count       remove-ns               replicate
read-line               ref-max-history         remove-watch            require
```


#### 关于 clojure contrib {#关于-clojure-contrib}

在当前的1.8版本中，并不需要特别配置clojure<sub>contrib</sub>，如果在老版本（1.3或更早）的项目中，请单独配置并管理clojure<sub>contrib</sub>。


## 结束 {#结束}

简单的Clojure配置就是这样，接下来就可以尝试者做一些Clojure程序啦！

这里先写一个，因为REPL中并没有类似exit的命令，所以我就写了这么个函数：

```clojure
(defn exit [] (System/exit 0))
```

把这行代码保存到 **\*~/.clojure.clj** 文件里，这样在每次退出REPL时候，输入(exit)即可。


## MASM 的汇编环境 {#masm-的汇编环境}

<https://app.yinxiang.com/shard/s18/nl/19217884/5d2e04c6-f98b-453a-a9d8-07ec1c6708bf/>


### 安装 nasm {#安装-nasm}

```sh
# install
$ brew install nasm

# 查询版本
$ nasm -v
NASM version 0.98.40 (Apple Computer, Inc. build 11) compiled on Feb 13 2018
```


### 实例 {#实例}

写一个汇编的 hello world, 文件名为 hello.asm:

```nasm
global start

section .text
start:
    push    dword msg.len
    push    dword msg
    push    dword 1
    mov     eax, 4
    sub     esp, 4
    int     0x80
    add     esp, 16

    push    dword 0
    mov     eax, 1
    sub     esp, 12
    int     0x80

section .data

msg:    db      "hello world", 10
.len:   equ     $ - msg
```


### 安装 Command Line Tools {#安装-command-line-tools}

如果已经安装了 Xcode 就不需要执行这条命令了。

```sh
sudo xcode-select --install
```


### 编译/链接/运行 {#编译-链接-运行}

注意: mac 上面的 gcc 编译 .o 文件的时候默认的入口是 \_main ，而使用 ld 命令时，默认的是 start 。

分步执行:

1.  编译: `nasm -o hello.o -f macho hello.asm`
2.  连接: `ld -arch i386 -macosx_version_min 10.7.0 -no_pie -e_main -o hello hello.o`


#### nasm {#nasm}

-   `-o hello.o` : 输入文件
-   `-f macho` : 指定文件格式
    -   `Linux` : elf 或 elf64
    -   `macOS` : macho


#### ld {#ld}

-   `-arch i386` : 指定为架构(32位)
-   `-macosx_version_min 10.6` : macOS - complains about default specification
-   `-no_pie` : macOS, 删除 ld 的 warning
-   `-e main` : 指定 main symbol name (macOS - 默认是 start
-   `-o hello` : 输入文件
