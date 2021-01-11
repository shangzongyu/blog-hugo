+++
title = "Go1.16 新特性 - 内嵌文件"
date = 2021-01-11
lastmod = 2021-01-11T15:59:06+08:00
tags = ["Go", "新特"]
categories = ["Go"]
draft = false
weight = 2001
+++

Go1.16 添加了一个新的特性 - 内嵌文件，可以用 `embed` 包很容易的嵌入文件到 Go 程序中。 这里简单的介绍下。

内嵌的文件内容必须是 `string` 、 `[]byte` 或者 `FS` 三个中的一个中。


## 安装 go1.16beta1 {#安装-go1-dot-16beta1}

Go1.16 还是个 beta 版本，在这篇文件发布的时候，为了不和自己使用的 Go 版本冲突，因此可以使用 `go` 命令和 `gvm` 来安装 go1.16beta 。


### 使用 Go 命令 {#使用-go-命令}

```sh
$ go get golang.org/dl/go1.16beta1
$ go1.16beta1 download

# 运行 go1.16beta1
$ go1.16beta1
```

安装好后命令和 `go` 类似，只是之前的 `go` 替换成为 `go1.16beta1` 即可。


### 使用 GVM {#使用-gvm}

> 接下来会写一篇关于 Gvm 的文章。

```sh
# 安装 go1.16beta1
$ gvm install go1.16beta1

# 使用 go1.16beta1
$ gvm use go1.16beta1
Now using version go1.16beta1

# 查看 go 的版本
$ go version
go version go1.16beta1 darwin/amd64
```


## 实例 {#实例}


### 简单 {#简单}

文件的内容如下:

```gnuplot
package main

import "embed"

func main() {
    // 以 string 的格式读取文件内容
    //go:embed hello.txt
    var s string
    print(s)

    // 以 []byte 的格式读取文件内容
    //go:embed hello.txt
    var b []byte
    print(string(b))

    // 以 embed.FS 的格式读取文件内容
    //go:embed hello.txt
    var f embed.FS
    data, _ := f.ReadFile("hello.txt")
    print(string(data))
}
```

运行结果如下:

```sh
$ go run embed.go
Hello Go Embed
Hello Go Embed
```


### 实现文件服务器 {#实现文件服务器}

新建目录 `assets`, 并且新建一个文件 `hello.txt` 。

> 注意：如果 assets 目录为空，则运行下面程序报错 =pattern assets/\*: no matching files found=，只需要放一个文件到这个目录就可以了。

文件的内容如下:

```go
package main

import (
    "embed"
    "net/http"
)

func main() {
    //go:embed assets/*
    var assets embed.FS

    fs := http.FileServer(http.FS(assets))
    println("server listen on port: 8080")
    if err := http.ListenAndServe(":8080", fs); err != nil {
        panic(err)
    }
}
```

运行结果如下:

```sh
$ go run static_srver.go
server listen on port: 8080
```

然后就可以在浏览器上去查看 `assets` 目录里面的文件了。


## 资料 {#资料}

-   [Go 1.16 Release Notes - The Go Programming Language](https://tip.golang.org/doc/go1.16)
-   [embed - The Go Programming Language](https://tip.golang.org/pkg/embed/)
