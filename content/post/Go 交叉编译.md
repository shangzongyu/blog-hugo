---
id: mn74mshwhceebhafjf8xqfl
title: Go 交叉编译
desc: ''
updated: 1657516747360
created: 1657516738843
---

```sh
$ GOARCH=amd64 GOOS=linux go build
$ file api
ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped
```
