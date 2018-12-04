+++
title = "Linux 配置科学上网"
lastmod = 2018-11-17T22:14:44+08:00
tags = ["macOS"]
categories = ["macOS"]
draft = false
+++

## 前言 {#前言}

一直在使用 Linux 作为自己开发, 不过一直有个问题困扰着我, 就是 OVER GFW. 尤其自己想用 chrome 查询资料还是在终端下载一些软件. 尤其是下载 `go` 的一些包, 因为要到 google 去下在一些包.

<!--more-->

很早之前是使用 VPN ,但是现在 VPN 被禁了, 只能使用其他方法, 比如 shadowsocks、ssr 和 v2ray, 但是在 Linux 这样的工具不好找或者是不好用,  最近我发现一个好用的工具 clash, 它在命令行配置, 虽然有基于他的 GUI, 不过只有 macOS的, 幸好过他不是很难配置.

接下来说说如何使用, 主要说一下如何让终端使用代理.


## clash {#clash}

就不多介绍了, 具体介绍到[Github 项目主页](https://github.com/Dreamacro/clash)去看就好了, 这里主要介绍我自己使用途中遇到的问题.


### 下载 clash {#下载-clash}

clash 提供了两种方式下载,一种使用通过 `go get` 进行下载, 但是由于下载需要到 google 去下载一些包, 会导致下载不成功, 这就成了先有鸡还是蛋的问题, 幸好作者提供了已经编译好的二进制供我们下载.

到这里[下载](https://github.com/Dreamacro/clash/releases), 我使用 `wget` 下载, 版本为 `v0.9.1`:

```sh
# 下载
wget https://github.com/Dreamacro/clash/releases/download/v0.9.1/clash-linux.gz

# 解压
sudo gzip -d clash-linux.gz

# 把解压的二进制放到 /usr/local/bin 目录下
mv clash-linux /usr/local/bin
```


### 配置 {#配置}

配置这里也不想多说, 还是到[Github 项目主页](https://github.com/Dreamacro/clash)去看怎么配置, 我不想就花时间在这些配置上, 因此我买的服务他们提供了 clash 的配置.

假如配置名称是 `config.xml` , clash 的配置文件默认在 `~/.confg/clash` , 我也把配置文件放到这个目录, 不过 `~/.config/clash` 的目录不存在需要创建.

```sh
mkdir ~/.config/clash
mv config.xml ~/.config/clash/
```


### 启动 {#启动}

启动 clash 很简单, 命令如下:

```sh
clash -d config_path_dir
```

由于我们把配置放到了默认的位置, 因此可以不用加 `-d` 参数, 可以使用 `clash` 直接启动, 如下:

```sh
$ clash
INFO[0000] Can't find MMDB, start download
INFO[0002] RESTful API listening at: 127.0.0.1:6170
INFO[0002] SOCKS proxy listening at: 127.0.0.1:8889
INFO[0002] HTTP proxy listening at: 127.0.0.1:8888
```


### systemd 开机自启动 {#systemd-开机自启动}

clash 自己没有提供启动功能, 作者推荐使用[pm](https://github.com/Unitech/pm2), 不过pm需要node环境,因此就没有选择它,我使用 Linux Systemd 来开机开机自启动.

1.  在 `/etc/systemd/system/` 新建文件 `clash.service` , 内容如下:

    ```ini
    [Unit]
    Description=clash service
    After=network.target

    [Service]
    Type=simple
    User=shine # 修改为自己的用户名或者root都可以
    ExecStart=/usr/local/bin/clash
    Restart=on-failure # or always, on-abort, etc

    [Install]
    WantedBy=multi-user.target
    ```

2.  加载 service

    ```sh
    # 让 systemd 加载 service 文件
    $ sudo systemctl daemon-reload

    # 之后我们就可使用如下命令启动/关闭 clash
    $ service clash start
    $ service clash stop
    $ service clash restart
    ```

3.  启动 clash

    ```sh
    $ systemctl start clash
    # 也可以使用 service
    $ service clash start
    ```

4.  查看 clash 是否启动成功, 如果没有成功使用 == 查看日志

    ```sh
    $ ps aux | grep clash | grep -v grep
    shine     3820  0.1  0.6 113308 13792 ?        Ssl  20:04   0:00 /usr/local/bin/clash
    ```

5.  这还没有完, 没有添加到开机自启动, 执行如下命令就好

    ```sh
    $ systemctl enable acpid.service clash.service
    Created symlink /etc/systemd/system/multi-user.target.wants/acpid.service → /usr/lib/systemd/system/acpid.service.
    Created symlink /etc/systemd/system/multi-user.target.wants/clash.service → /etc/systemd/system/clash.service.
    ```


### 命令行配置 {#命令行配置}

把如下配置加到 `.zshrc` 或者 `.bashrc`:

```sh
# proxyon
proxyon() {
    export https_proxy=http://127.0.0.1:8888
    export http_proxy=http://127.0.0.1:8888
    export all_proxy=socks5://127.0.0.1:8889
    echo "HTTP/HTTPS Proxy on"
}

# proxyoff
proxyoff() {
    unset http_proxy
    unset https_proxy
    unset all_proxy
    echo "HTTP/HTTPS Proxy off"
}
```

然后 `source ~/.zshrc` 或者 `source ~/.bashrc`. 如果想在终端使用代理输入命令 `proxyon` 关闭 `proxyoff`

> ****8888**** 和 ****8889**** 是你配置的端口号.


### 浏览器配置 {#浏览器配置}

让浏览器走代理主要使用 [SwitchOmega](https://www.switchyomega.com/) 这个工具, 具体配置就说了, 这知道怎么配置, 不知道,去下面类列举这个网址去查询下,很简单.

FireFox和Chomre/Chrominumd 都支持这个插件.

-   <https://www.switchyomega.com/>
-   <https://github.com/FelisCatus/SwitchyOmega>
-   <https://github.com/FelisCatus/SwitchyOmega/wiki/GFWList>
