+++
title = "Linux Terminator 介绍和使用"
lastmod = 2018-12-04T23:16:51+08:00
tags = ["linux"]
categories = ["linux"]
draft = false
+++

## 简介 {#简介}

可以分屏的终端.

<!--more-->


## 介绍 {#介绍}

首选项有5个 tab 页，分别是 Global 、Profiles、Layouts、KeyBindings、Plugins

-   **Global**: 这个全局设置参数，多个 `profiles` 公用的参数，可以理解为主体窗口的配置。比如光标的大小、分离窗口的大小、子窗口失去焦点的蒙层效果，标题 `bar` 的设置包括 标题的颜色、大小、标题栏的背景颜色等等。
-   **Profiles**: 配置个性主题的。在里面添加多个 `profiles` ,可以切换主题使用，减少审美疲劳。主要配置有，设置字体的大小、颜色、样式，光标颜色、形状等等。
-   **Layouts**: layout子窗口的配置。可以添加多个 `layout` ，子窗口可以多个 `proflies` 文件。
-   **Keybindings**: 终端的常用快捷键。可以自定义设置自己的快捷键。比如 打开关闭窗口、跳转、分割、复制粘贴等等。稍后会讲解常用的快捷键的使用。
-   **Plugins**: Terminator 的插件. 有 ActivityWatcher、Logger 等等. 根据需求，安装对应的插件。


## 安装 {#安装}

```sh
# ubuntu
sudo apt install terminator

# manjaro
sudo pacman -S terminator
```


## 配置 {#配置}

Terminator 自带的 theme 不多, 幸好有人整理出来在 [EliverLara/terminator-themes](https://github.com/EliverLara/terminator-themes). 参考这个安装主题,然后替换为自己喜欢的主题.

我的配置如下:

```ini
[global_config]
  focus = system
  suppress_multiple_term_dialog = True
  title_transmit_bg_color = "#d30102"
[keybindings]
[layouts]
  [[default]]
    [[[child1]]]
      parent = window0
      profile = default
      type = Terminal
    [[[window0]]]
      parent = ""
      type = Window
[plugins]
[profiles]
  [[default]]
    background_darkness = 0.85
    copy_on_selection = True
    cursor_color = "#2D2D2D"
    font = Monospace 10
    palette = "#2d2d2d:#f2777a:#99cc99:#ffcc66:#6699cc:#cc99cc:#66cccc:#d3d0c8:#747369:#f2777a:#99cc99:#ffcc66:#6699cc:#cc99cc:#66cccc:#f2f0ec"
    scroll_on_keystroke = False
    scrollback_infinite = True
    show_titlebar = False
    use_system_font = False
```


## 快捷键 {#快捷键}


### 第一部份：关于在同一个标签内的操作 {#第一部份-关于在同一个标签内的操作}

| 按键                           | 意义                        |
|------------------------------|---------------------------|
| Alt+U=                         | 移动到上面的终端            |
| Alt+Down                       | 移动到下面的终端            |
| Alt+Left                       | 移动到左边的终端            |
| Alt+Right                      | 移动到右边的终端            |
| Ctrl+Shift+O                   | 水平分割终端                |
| Ctrl+Shift+E                   | 垂直分割终端                |
| Ctrl+Shift+Right               | 在垂直分割的终端中将分割条向右移动 |
| Ctrl+Shift+Left                | 在垂直分割的终端中将分割条向左移动 |
| Ctrl+Shift+Up                  | 在水平分割的终端中将分割条向上移动 |
| Ctrl+Shift+Down                | 在水平分割的终端中将分割条向下移动 |
| Ctrl+Shift+S                   | 隐藏/显示滚动条             |
| Ctrl+Shift+F                   | 搜索                        |
| Ctrl+Shift+C                   | 复制选中的内容到剪贴板      |
| Ctrl+Shift+V                   | 粘贴剪贴板的内容到此处      |
| Ctrl+Shift+W                   | 关闭当前终端                |
| Ctrl+Shift+Q                   | 退出当前窗口，当前窗口的所有终端都将被关闭 |
| Ctrl+Shift+X                   | 最大化显示当前终端          |
| Ctrl+Shift+Z                   | 最大化显示当前终端并使字体放大 |
| Ctrl+Shift+N or Ctrl+Tab       | 移动到下一个终端            |
| Ctrl+Shift+P or Ctrl+Shift+Tab | `Crtl+Shift+Tab` 移动到之前的一个终端 |


### 第二部份：有关各个标签之间的操作 {#第二部份-有关各个标签之间的操作}

| 按键                | 意义                             |
|-------------------|--------------------------------|
| F11                 | 全屏开关                         |
| Ctrl+Shift+T        | 打开一个新的标签                 |
| Ctrl+PageDown       | 移动到下一个标签                 |
| Ctrl+PageUp         | 移动到上一个标签                 |
| Ctrl+Shift+PageDown | 将当前标签与其后一个标签交换位置 |
| Ctrl+Shift+PageUp   | 将当前标签与其前一个标签交换位置 |
| Ctrl+Plus (+)       | 增大字体                         |
| Ctrl+Minus (-)      | 减小字体                         |
| Ctrl+Zero (0)       | 恢复字体到原始大小               |
| Ctrl+Shift+R        | 重置终端状态                     |
| Ctrl+Shift+G        | 重置终端状态并clear屏幕          |
| Super+g             | 绑定所有的终端，以便向一个输入能够输入到所有的终端 |
| Super+Shift+G       | 解除绑定                         |
| Super+t             | 绑定当前标签的所有终端，向一个终端输入的内容会自动输入到其他终端 |
| Super+Shift+T       | 解除绑定                         |
| Ctrl+Shift+I        | 打开一个窗口，新窗口与原来的窗口使用同一个进程 |
| Super+i             | 打开一个新窗口，新窗口与原来的窗口使用不同的进程 |
