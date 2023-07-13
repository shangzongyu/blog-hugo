---
title: FreeBSD Tips
updated: 1659930734796
created: 1657515553875
---

> FreeBSD 的一些小技巧整理。

## 允许 root 远程登录

修改配置文件 `/etc/ssh/sshd_config`，把 `PermitRootLogin` 修改为 `yes` 就可以了。

之后重启 `sshd` 就可以了。

```ini
PermitRootLogin yes
```

```sh
# /etc/rc.d/sshd restart
```

## FreeBSD 安装其他系统

```sh
doas pkg install vm-bhyve (optional: grub2-bhyve)
kldload if_bridge if_tap nmdm vmm
doas sysrc vm_enable="YES"
doas sysrc vm_dir="zfs:zroot/vms"
doas zfs create -o mountpoint=/vms zroot/vms
doas vm init
cp /usr/local/share/examples/vm-bhyve/* /vms/.templates/
vm switch create public
vm switch add public em0 (change em0 to whatever your network device is)
doas vm iso https://releases.ubuntu.com/20.04.4/ubuntu-20.04.4-desktop-amd64.iso (insert URL to your distro's image here)
doas vm create ubuntu
doas vm configure ubuntu
doas vm install -f ubuntu ubuntu-20.04.4-desktop-amd64.iso (change this to your image filename)
vncviewer 127.0.0.1:5999 (adjust port according to your configuration)
doas sysrc vm_list="ubuntu" (autostarts at boot)
doas vm start/stop/restart ubuntu
```

https://i-bsd.com/freebsd-vm-bhyve-linux/
