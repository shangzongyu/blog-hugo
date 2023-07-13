---
id: i4s6vwqol1yi9xhhac1scra
title: Delve 调试 Go 程序
desc: 'Delve 调试 Go 程序'
updated: 1657515347188
created: 1656410611019
---

[Delve](https://github.com/go-delve/delve)  Go 语言调试器，该调试器工程于 2014 年由 [德里克・帕克（Derek Parker）](https://github.com/derekparker) 创建。

Delve 旨在为 Go 提供一个简单的、功能齐全、易用使用和调用的调试工具。它紧跟 Go 语言版本演进，是目前 Go 调试器的**事实标准**。

对并发程序有着很好支持，支持跨平台（至少是支持 Windows、MacOS、Linux 三大主流平台）并且它前后端分离的设计使得其可以非常容易地被集成到各种 IDE（如：Goland)、编译器插件 ([vscode go](https://github.com/Microsoft/vscode-go)、[vim-go](https://github.com/fatih/vim-go))、图形化调试器前端中 (如：[gdlv](https://github.com/aarzilli/gdlv))。接下来，我们就来看看如何使用 Delve 调试 Go 程序。

```sh
# install
go get github.com/go-delve/delve/cmd/dlv
```

成功后，可执行文件 `dlv` 将出现在 `$GOPATH/bin` 下面，确保你的环境变量 PATH 中包含该路
