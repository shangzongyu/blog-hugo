---
id: 3orpe75ehazyv7ryvw21fhf
title: 使用 launchctl 管理 MacOS 服务
desc: ''
updated: 1669460077360
created: 1669457837846
---

https://www.jianshu.com/p/d6f09bc4142e

```sh
# 查看所有的 plist 服务
launchctl list

# 禁用服务
launchctl disable /Library/LaunchDaemons/com.simonkuang.macos.coredns.plist

# 启用服务
launchctl disable /Library/LaunchDaemons/com.simonkuang.macos.coredns.plist

# 杀死进程（不优雅地杀，直接杀进程）并重启服务。对一些停止响应的服务有效。
launchctl kickstart -k /Library/LaunchDaemons/com.simonkuang.macos.coredns.plist

# 在不修改 Disabled 配置的前提下启动服务
launchctl start /Library/LaunchDaemons/com.simonkuang.macos.coredns.plist

# 在不修改 Disabled 配置的前提下停止服务
launchctl stop /Library/LaunchDaemons/com.simonkuang.macos.coredns.plist
```

https://www.jianshu.com/p/d6f09bc4142e


## FAQ

要注意权限，还要设置 dbPath 的位置

