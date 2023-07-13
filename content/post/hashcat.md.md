---
id: cdxlx2xkucf2a4u00ph0eqc
title: Hashcat
desc: ''
updated: 1669089398875
created: 1669014804650
---


```sh
# 安装
pip install hashid
```

## 内容详情

Hashcat 是最快的密码恢复工具，它旨在在短时间内破解高度复杂的密码。而且这个工具还能够进行单词列表和暴力破解。

支持 Linux, Windows, and macOS, CPU、GPU 和其他硬件加速器。

## 特性

- 世界上最快的的密码恢复器
- 同时也是世界上第一个以及唯一的内核规则引擎
- 开源、自由
- 支持多平台多操作系统（Linux、Windows、macOS，CPU、GPU、APU 等）
- 支持分布式破解
- 支持交互式暂停、恢复
- 支持会话
- 支持还原
- 支持从文件和标准输入读入密码
- 支持十六进制盐和十六进制字符集
- 支持自动性能调优
- 内置基准测试系统
- 集成热监控器
- 支持 350 多种哈希算法

## 测试

创建一些密码：

使用命令行创建哈希，只需遵循以下格式。

```sh
echo -n "input" | algorithm | tr -d "-">>outputfiename
```

使用 md5:

```sh
echo -n "geekflare" | md5sum | tr -d "-">> crackhash.txt
echo -n "password123" | md5sum | tr -d "-">> crackhash.txt
echo -n "Webtechnology" | md5sum | tr -d "-">> crackhash.txt
echo -n "microsoftteams" | md5sum | tr -d "-">>c rackhash.txt
echo -n "recyclebin" | md5sum | tr -d "-">> crackhash.txt
echo -n "123456" | md5sum | tr -d "-">> crackhash.txt
echo -n "654321" | md5sum | tr -d "-">> crackhash.txt
```

命令的一般形式是：

```sh
$ hashcat -a num -m num hashfile wordlistfile
```

> “num” 表示要使用的特定攻击和哈希模式。如果滚动终端，您可以找到每种攻击和哈希模式的确切数字，例如 md4 - 数字是 0，而 sha256 算法 - 数字是 1740。如果说要使用的词表是 rockyou wordlist，可以在路径 /usr/share/wordlists 中轻松找到该词表。

甚至可以使用 locate 命令来查找该词表路径：

```sh
# locate rockyou.txt
```

最后，要使用 wordlist 文件破解哈希，请使用以下命令：

```sh
hashcat -a 0 -m 0 ./crackhash.txt rockyou.txt
```

运行此命令后，可能会遇到运行时错误，不过不用担心，这是正常的，可以轻松解决。

要解决此问题，请将每个哈希分别保存在不同的文件中。如果设备的 CPU 或 GPU 速度较低，则会出现此错误。如果配置具有高速处理器，则完全没有这个问题了。
所以在修复错误和一切之后，结果将是这样的。

```sh
hashcat (v6.2.6) starting

METAL API (Metal 263.8)
=======================
* Device #1: AMD Radeon Pro 5500M, skipped
* Device #2: Intel(R) UHD Graphics 630, skipped

OpenCL API (OpenCL 1.2 (Apr 19 2022 18:44:25)) - Platform #1 [Apple]
====================================================================
* Device #3: Intel(R) Core(TM) i9-9880H CPU @ 2.30GHz, 8160/16384 MB (2048 MB allocatable), 16MCU
* Device #4: Intel(R) UHD Graphics 630, skipped
* Device #5: AMD Radeon Pro 5500M Compute Engine, skipped

Minimum password length supported by kernel: 0
Maximum password length supported by kernel: 256

Hashes: 7 digests; 7 unique digests, 1 unique salts
Bitmaps: 16 bits, 65536 entries, 0x0000ffff mask, 262144 bytes, 5/13 rotates
Rules: 1

Optimizers applied:
* Zero-Byte
* Early-Skip
* Not-Salted
* Not-Iterated
* Single-Salt
* Raw-Hash

ATTENTION! Pure (unoptimized) backend kernels selected.
Pure kernels can crack longer passwords, but drastically reduce performance.
If you want to switch to optimized kernels, append -O to your commandline.
See the above message to find out about the exact limits.

Watchdog: Temperature abort trigger set to 100c

Host memory required for this attack: 4 MB

Dictionary cache built:
* Filename..: /Users/tomshine/Downloads/rockyou.txt
* Passwords.: 14344391
* Bytes.....: 139921497
* Keyspace..: 14344384
* Runtime...: 1 sec

e10adc3949ba59abbe56e057f20f883e:123456
c33367701511b4f6020ec61ded352059:654321
482c811da5d5b4bc6d497ffa98491e38:password123
caae8dd682acb088ed63e2d492fe1e13:recyclebin
Approaching final keyspace - workload adjusted.


Session..........: hashcat
Status...........: Exhausted
Hash.Mode........: 0 (MD5)
Hash.Target......: crackhash.txt
Time.Started.....: Tue Nov 22 11:39:19 2022 (1 sec)
Time.Estimated...: Tue Nov 22 11:39:20 2022 (0 secs)
Kernel.Feature...: Pure Kernel
Guess.Base.......: File (/Users/tomshine/Downloads/rockyou.txt)
Guess.Queue......: 1/1 (100.00%)
Speed.#3.........: 12653.9 kH/s (0.36ms) @ Accel:1024 Loops:1 Thr:1 Vec:4
Recovered........: 4/7 (57.14%) Digests (total), 4/7 (57.14%) Digests (new)
Progress.........: 14344384/14344384 (100.00%)
Rejected.........: 0/14344384 (0.00%)
Restore.Point....: 14344384/14344384 (100.00%)
Restore.Sub.#3...: Salt:0 Amplifier:0-1 Iteration:0-1
Candidate.Engine.: Device Generator
Candidates.#3....: $HEX[2321676f7468] -> $HEX[042a0337c2a156616d6f732103]
Hardware.Mon.SMC.: Fan0: 32%, Fan1: 32%
Hardware.Mon.#3..: Temp: 58c

Started: Tue Nov 22 11:39:13 2022
Stopped: Tue Nov 22 11:39:21 2022
```

<https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt>
