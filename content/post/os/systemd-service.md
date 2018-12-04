+++
title = "Systemd Service 文件编写"
lastmod = 2018-12-04T23:06:19+08:00
tags = ["macOS"]
categories = ["macOS"]
draft = false
+++

`systemd` 可以帮助我们很方便的管理和控制我们的服务，它被用在多种 Linux 发行版本中，例如 CentOS/REHL/Fedaro、Ubuntu/Debain、Arch Linux、openSuse 等。我们也可以使用 `systemd` 来很方便管理我们自己的服务。

<!--more-->

你应该 Copy 你的 service 文件到 /etc/systemd/system，不要对它进行软连接，原因有二：

1.  因为你没有遵循一个软连接的规则，因此你不能使用 `systemctl enable` 命令
2.  你打开了一个潜在的安全隐患（e.g. shell）。例如，你以一个低权限用户运行了 service 文件，但是这个 service 文件是你软链接过来的，如果有人在你的 service 文件找到缺陷，他们可以修改或者覆盖你的 service 文件。他们可以改变 .service 文件要执行的代码，因为你的低权限用户允许他这么修改文件，修改运行命令(Exec Start)。当 .service 文件重新启动的时候，攻击命令就会启动。这也是为什么你不应该以 root 运行 .service 文件的原因。

> 注意：你也可以把文件放到 /user/lib/systemd 目录中，但是不应该预留系统级别的包。/etc/systemd/system 中存放的任何东西都将被它覆盖，这是用户更改的地方。


## `.service` 文件 {#dot-service-文件}

在 `systemd` 的目录下，创建一个 `my_daemon.service` 。比如 `/etc/system/my_daemon.service` 。下面是一个 service 文件的例子：

```ini
[Unit]
Description=My Daemon Service
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/root
ExecStart=/root/my_daemon
Restart=on-failure # or always, on-abort, etc

[Install]
WantedBy=multi-user.target
```

.service 文件可以指定很多选项。例如， `ExecStop` 和 `ExecRestart` 允许我们控制停止和重启服务。 `ExecStop` 有足够聪明知道你要 kill 这个进程。如果你要热关闭最好指定 `ExecStop` 。可以通过 `man systemd.service` 来查看更多的信息： [Freedesktop.org's man systemd.service](https://www.freedesktop.org/software/systemd/man/systemd.service.html).

```sh
# Read all the service options
man systemd.service
```


## 控制 Service {#控制-service}

```sh
# Control whether service loads on boot
systemctl enable
systemctl disable

# Manual start and stop
systemctl start
systemctl stop

# Restarting/reloading
systemctl daemon-reload # Run if .service file has changed
systemctl restart
```


## 查看状态和日志 {#查看状态和日志}

```sh
# See if running, uptime, view latest logs
systemctl status
systemctl status [service_name]

# See all systemd logs
journalctl

# Tail logs
journalctl -f

# Show logs for specific service
journalctl -u my_daemon.service
```


## 参考 {#参考}

-   [Create Systemd Service Fils](https://www.devdungeon.com/content/creating-systemd-service-files)
-   <https://access.redhat.com/documentation/en-us/red%5Fhat%5Fenterprise%5Flinux/7/html/system%5Fadministrators%5Fguide/sect-managing%5Fservices%5Fwith%5Fsystemd-unit%5Ffiles>
