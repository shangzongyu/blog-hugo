---
id: b7i92kxt7q1nlqltttac4p9
title: 加密算法 - RSA
desc: ''
updated: 1657515690259
created: 1657515645837
tags:
  - blog
  - TODO
---

RSA（*Rivest–Shamir–Adleman*）加密是使用最广的安全数据加密算法之一。

它是一种非对称加密算法，也叫”单向加密“。用这种方式，任何人都可以很容易地对数据进行加密，而只有用正确的”秘钥“才能解密。

RSA 是通过生成一个公钥和一个私钥进行加/解密的。公钥和私钥是一起生成的，组成一对秘钥对。

![](https://raw.githubusercontent.com/studygolang/gctt-images2/master/20200408-Implementing-RSA-Encryption-and-Signing-in-Golang/01.svg)

公钥可以用来加密任意的数据，但不能用来解密。

![](https://raw.githubusercontent.com/studygolang/gctt-images2/master/20200408-Implementing-RSA-Encryption-and-Signing-in-Golang/02.svg)

私钥可以用来解密由它对应的公钥加密的数据。

![](https://raw.githubusercontent.com/studygolang/gctt-images2/master/20200408-Implementing-RSA-Encryption-and-Signing-in-Golang/03.svg)

这意味着我们可以把我们的公钥给任何想给的人。之后他们可以把想发送给我们的信息进行加密，唯一能访问这些信息的方式就是用我们的私钥进行解密。

![](https://raw.githubusercontent.com/studygolang/gctt-images2/master/20200408-Implementing-RSA-Encryption-and-Signing-in-Golang/04.svg)

> 秘钥的生成过程，以及信息的加密解密过程不在本文讨论范围内，但是如果你想研究详细信息，这里有一个关于此主题的 [Public Key Cryptography: RSA Encryption Algorithm](https://www.youtube.com/watch?v=wXB-V_Keiu8)
