---
id: sthmm5ut7p84hz0zp5hi083
title: Navidrome
desc: 'Navidrome 搭建自己的音乐服务'
updated: 1669455617840
created: 1669447118003
---

https://github.com/navidrome/navidrome

配置开机自启动：

Navidrome 在后台运行，我们可让它以一个服务运行，我们应以个 serveric 文件在 `~/Library/LaunchAgents/`，文件名为 `navidrome.plist`，配置文件设置了如下：

- 二进制文件放在 `/opt/navidrome` 目录
- 在 `/opt/navidrome` 创建配置文件 `navidrome.toml` <https://www.navidrome.org/docs/usage/configuration-options/>
- 在 `/opt/navidrome` 创建日志 `navidrome.log`

文件内容如下：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>navidrome</string>
        <key>ProgramArguments</key>
        <array>
            <string>/opt/navidrome/navidrome</string>
            <string>-c</string>
            <string>/opt/navidrome/navidrome.toml</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>UserName</key>
        <string>tomshine<string>
        <key>StandardOutPath</key>
        <string>/opt/navidrome/navidrome.log</string>
        <key>StandardErrorPath</key>
        <string>/opt/navidrome/navidrome.log</string>
    </dict>
</plist>
```

```toml
LogLevel = 'INFO'
ScanSchedule = '@every 1h'
TranscodingCacheSize = '150MiB'
MusicFolder = '/Users/tomshine/Music/Tom‘s\ Music'
```

```sh
# 加载 service
launchctl load ~/Library/LaunchAgents/navidrome.plist

# 启动
launchctl start navidrome

# 关闭
launchctl stop navidrome
```

启动之后，可以在 <http://localhost:4533> 查看。

You can verify that Navidrome has started by navigating to , by running launchctl list | grep navidrome or by checking the log file specified.


