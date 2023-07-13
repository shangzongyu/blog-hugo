---
id: qnzloyt6n5qaf8uucnfjmg9
title: Rime
desc: ''
updated: 1670908817578
created: 1670908817578
---

## 用法

1.  安装 [Rime 输入法](https://rime.im/) , 并注销或重启
2.  下载仓库所有配置文件到本地
3.  将下载的除字体外的所有文件覆盖到用户设定文件夹
4.  安装字体 (font 目录)
5.  也可以在 “用户文件夹” 中查看
6.  右键点击 rime 输入法图标，点击重新部署，部署完毕即可用

用户设定文件夹在不同的系统下也有不同，如下

-   Windows
    -   Weasel: %APPDATA%\Rime
-   Mac OS X
    -   Squirrel: ~/Library/Rime
-   Linux
    -   iBus: ~/.config/ibus/rime
    -   Fcitx: ~/.config/fcitx/rime

## 配置文件说明

-   `default.custom.yaml` 设置输入法、如何切换输入法、翻页等
-   `double_pinyin_flypy.custom.yaml` 双拼方案，
-   `squirrel.custom.yaml` 鼠须管 (Mac 版本) 设置哪些软件默认英文输入，输入法皮肤等
-   `weasel.custom.yaml` 小狼毫 (Windows 版本) 设置哪些软件默认英文输入，输入法皮肤等
-   `custom_phrase.txt` 设置快捷输入，修改完成后要重新部署才能生效

配置文件中大部分都有注释。

## FAQ

### 快捷键

使用 Ctrl + ` (Tab 上面那个) 切换输入方案。

### 如何添加词库

将词库文件拷贝到文件夹，修改 `luna_pinyin.extended.dict.yaml` 文件

将词库名字加在 `import_tables` 下 (注意格式)(我的另一个仓库 [rime-dict](https://github.com/Iorest/rime-dict) 中收集了很多词库)

重新部署即可

### 添加短语和缩写

将短语和缩写添加至 `custom_phrase.txt` 文件中

**输入的字母和汉字之间是 `tab`，而不是空格**

使用不会自动替换 `tab` 为空格的编辑器修改此文件

### Linux 环境下配置问题

Linux 环境下，rime 输入法默认配置可能不在 `~/.config/ibus/rime` 下，此时如果需要用户设定，需要将所有的配置文件加入用户设定文件夹 (如果用 ibus, 那么就是 `~/.config/ibus/rime`), 否则配置可能出错.

另外，Linux 环境下输入法可能出现不生效的问题，这时可以在命令行中运行 `ibus engine rime`, 或可解决 (使用 ibus 框架时)

https://iorest.github.io/rime-setting/

〔方案選單〕 
https://github.com/alswl/Rime

- 纯简体方案：雾凇拼音
- mac 原生皮肤。

参考：https://github.com/NavisLab/rime-pifu

![](Pasted%20image%2020230313144453.png)
配置如下：

```yml
patch:
  #style/color_scheme: macos_light   # 将皮肤名称输入在此处
  
  text_orientation: horizontal  # horizontal | vertical
  inline_preedit: true
  corner_radius: 10
  hilited_corner_radius: 0
  border_height: 0
  border_width: 0
  # space between candidates in stacked layout
  line_spacing: 5
  # space between preedit and candidates in non-inline mode
  spacing: 10
  #candidate_format: '%c. %@'
  #base_offset: 0
  font_face: 'Lucida Grande'
  font_point: 21
  #label_font_face: 'Lucida Grande'
  label_font_point: 18
 
  preset_color_schemes:
    native:
      name: 系統配色

    macos_light:
      name: Mac仿原生亮色/macos_light
      author: 一方
      back_color: 0xFFFFFF    # 候选条背景色，24位色值，16进制，BGR顺序
      border_color: 0xFFFFFF    # 边框色
      text_color: 0x424242    # 拼音行文字颜色
      hilited_back_color: 0xD75A00    # 第一候选项背景背景色
      hilited_candidate_text_color: 0xFFFFFF    # 第一候选项文字颜色
      hilited_candidate_label_color: 0xFFFFFF   # 第一候选项编号颜色
      hilited_comment_text_color: 0x999999    # 注解文字高亮
      hilited_text_color: 0x999999    # 高亮拼音 (需要开启内嵌编码)
      candidate_text_color: 0x3c3c3c    # 预选项文字颜色
      comment_text_color: 0x999999    # 拼音等提示文字颜色
      horizontal: true    # 水平排列
      inline_preedit: true    # 单行显示，false双行显示
      label_color: 0x999999   # 预选栏编号颜色
      candidate_format: "%c\u2005%@"    # 用 1/6 em 空格 U+2005 来控制编号 %c 和候选词 %@ 前后的空间。
      font_face: "PingFangSC"   # 候选词编号字体
      font_point: 17    # 候选文字大小
      label_font_point: 13    # 候选编号大小
      corner_radius: 5    # 候选条圆角
      hilited_corner_radius: 5    # 高亮圆角
      border_height: 4     # 窗口上下高度
      border_width: 4   # 窗口左右宽度
      border_color_width: 0   #输入条边框宽度
      #label_font_face: "SFCompactText-Regular"  # 候选词编号字体

    macos_dark:
      name: Mac仿原生暗色/macos_dark
      author: 一方
      back_color: 0x252a2e    # 候选条背景色，24位色值，16进制，BGR顺序
      border_color: 0x050505    # 边框色
      text_color: 0x424242    # 拼音行文字颜色
      hilited_back_color: 0xD75A00    # 第一候选项背景背景色
      hilited_candidate_text_color: 0xFFFFFF    # 第一候选项文字颜色
      hilited_candidate_label_color: 0xFFFFFF   # 第一候选项编号颜色
      hilited_comment_text_color: 0x999999    # 注解文字高亮
      hilited_text_color: 0x999999    # 高亮拼音 (需要开启内嵌编码)
      candidate_text_color: 0xe9e9ea    # 预选项文字颜色
      comment_text_color: 0x999999    # 拼音等提示文字颜色
      horizontal: true    # 水平排列
      inline_preedit: true    # 单行显示，false双行显示
      label_color: 0x999999   # 预选栏编号颜色
      candidate_format: "%c\u2005%@"    # 用 1/6 em 空格 U+2005 来控制编号 %c 和候选词 %@ 前后的空间。
      font_face: "PingFangSC"   # 候选词编号字体
      font_point: 17    # 候选文字大小
      label_font_point: 13    # 候选编号大小
      corner_radius: 5    # 候选条圆角
      hilited_corner_radius: 5    # 高亮圆角
      border_height: 4     # 窗口上下高度
      border_width: 4   # 窗口左右宽度
      border_color_width: 0   #输入条边框宽度
      #label_font_face: "SFCompactText-Regular"  # 候选词编号字体

    apathy:
      name: 冷漠／Apathy
      author: LIANG Hai
      horizontal: true  # 水平排列
      inline_preedit: true #单行显示，false双行显示
      candidate_format: "%c\u2005%@\u2005"  # 编号 %c 和候选词 %@ 前后的空间
      corner_radius: 5  #候选条圆角
      border_height: 0
      border_width: 0
      back_color: 0xFFFFFF  #候选条背景色
      font_face: "PingFangSC-Regular,HanaMinB"  #候选词字体
      font_point: 16  #候选字词大小
      text_color: 0x424242  #高亮选中词颜色
      label_font_face: "STHeitiSC-Light"   #候选词编号字体
      label_font_point: 12   #候选编号大小
      hilited_candidate_text_color: 0xEE6E00  #候选文字颜色
      hilited_candidate_back_color: 0xFFF0E4  #候选文字背景色
      comment_text_color: 0x999999  #拼音等提示文字颜色

    aqua:
      name: 碧水／Aqua
      author: 佛振 <chen.sst@gmail.com>
      text_color: 0x606060
      back_color: 0xeeeceeee
      candidate_text_color: 0x000000
      hilited_text_color: 0x000000
      hilited_candidate_text_color: 0xffffff
      hilited_candidate_back_color: 0xeefa3a0a
      comment_text_color: 0x5a5a5a
      hilited_comment_text_color: 0xfcac9d

    azure:
      name: 青天／Azure
      author: 佛振 <chen.sst@gmail.com>
      text_color: 0xcfa677
      candidate_text_color: 0xffeacc
      back_color: 0xee8b4e01
      hilited_text_color: 0xffeacc
      hilited_candidate_text_color: 0x7ffeff
      hilited_candidate_back_color: 0x00000000
      comment_text_color: 0xc69664

    clean_white:
      name: 简约白／Clean White
      author: Chongyu Zhu <lembacon@gmail.com>, based on 搜狗「简约白」
      horizontal: true
      candidate_format: '%c %@'
      corner_radius: 6
      border_height: 6
      border_width: 6
      font_point: 16
      label_font_point: 12
      label_color: 0x888888
      text_color: 0x808080
      hilited_text_color: 0x000000
      candidate_text_color: 0x000000
      comment_text_color: 0x808080
      back_color: 0xeeeeee
      hilited_candidate_label_color: 0xa0c98915
      hilited_candidate_text_color: 0xc98915
      hilited_candidate_back_color: 0xeeeeee

    dark_temple:
      name: 暗堂／Dark Temple
      author: 佛振 <chen.sst@gmail.com>, based on ir_black
      text_color: 0x92f6da
      back_color: 0x222222
      candidate_text_color: 0xd8e3e6
      hilited_text_color: 0xffcf9a
      hilited_back_color: 0x222222
      hilited_candidate_text_color: 0x92f6da
      hilited_candidate_back_color: 0x10000000  # 0x333333
      comment_text_color: 0x606cff

    dust:
      name: 浮尘／Dust
      author: Superoutman <asticosmo@gmail.com>
      horizontal: true  # 水平排列
      inline_preedit: true #单行显示，false双行显示
      candidate_format: "%c\u2005%@\u2005"  # 用 1/6 em 空格 U+2005 来控制编号 %c 和候选词 %@ 前后的空间。
      corner_radius: 2  #候选条圆角
      border_height: 3                                   # 窗口边界高度，大于圆角半径才生效
      border_width: 8                                    # 窗口边界宽度，大于圆角半径才生效
      back_color: 0xeeffffff  #候选条背景色
      border_color: 0xE0B693                             # 边框色
      font_face: "HYQiHei-55S Book,HanaMinA Regular"     #候选词字体
      font_point: 14  #候选字词大小
      label_font_face: "SimHei"   #候选词编号字体
      label_font_point: 10   #候选编号大小
      label_color: 0xcbcbcb                              # 预选栏编号颜色
      candidate_text_color: 0x555555                     # 预选项文字颜色
      text_color: 0x424242                               # 拼音行文字颜色，24位色值，16进制，BGR顺序
      comment_text_color: 0x999999                       # 拼音等提示文字颜色
      hilited_text_color: 0x9e9e9e                       # 高亮拼音 (需要开启内嵌编码)
      hilited_candidate_text_color: 0x000000             # 第一候选项文字颜色
      hilited_candidate_back_color: 0xfff0e4             # 第一候选项背景背景色
      hilited_candidate_label_color: 0x555555            # 第一候选项编号颜色
      hilited_comment_text_color: 0x9e9e9e               # 注解文字高亮

    ink:
      name: 墨池／Ink
      author: 佛振 <chen.sst@gmail.com>
      text_color: 0x5a5a5a
      back_color: 0xeeffffff
      candidate_text_color: 0x000000
      hilited_text_color: 0x000000
      #hilited_back_color: 0xdddddd
      hilited_candidate_text_color: 0xffffff
      hilited_candidate_back_color: 0xcc000000
      comment_text_color: 0x5a5a5a
      hilited_comment_text_color: 0x808080

    google:
      name: 谷歌／Google
      author: skoj <skoj@qq.com>
      text_color: 0x666666 #拼音串
      candidate_text_color: 0x000000 #非第一候选项
      back_color: 0xFFFFFF #背景
      border_color: 0xE2E2E2 #边框
      hilited_text_color: 0x000000 #拼音串高亮
      hilited_back_color: 0xFFFFFF #拼音串高亮背景
      hilited_candidate_text_color: 0xFFFFFF #第一候选项
      hilited_candidate_back_color: 0xCE7539 #第一候选项背景
      comment_text_color: 0x6D6D6D #注解文字
      hilited_comment_text_color: 0xEBC6B0 #注解文字高亮

    luna:
      name: 明月／Luna
      author: 佛振 <chen.sst@gmail.com>
      text_color: 0xa5a5a5
      back_color: 0xdd000000
      candidate_text_color: 0xeceeee
      hilited_text_color: 0x7fffff
      hilited_candidate_text_color: 0x7fffff
      hilited_candidate_back_color: 0x40000000
      comment_text_color: 0xa5a5a5
      hilited_comment_text_color: 0x449c9d

    lost_temple:
      name: 孤寺／Lost Temple
      author: 佛振 <chen.sst@gmail.com>, based on ir_black
      text_color: 0xe8f3f6
      back_color: 0xee303030
      hilited_text_color: 0x82e6ca
      hilited_candidate_text_color: 0x000000
      hilited_candidate_back_color: 0x82e6ca
      comment_text_color: 0xbb82e6ca
      hilited_comment_text_color: 0xbb203d34

    psionics:
      name: 幽能／Psionics
      author: 雨過之後、佛振
      text_color: 0xc2c2c2
      back_color: 0x444444
      candidate_text_color: 0xeeeeee
      hilited_text_color: 0xeeeeee
      hilited_back_color: 0x444444
      hilited_candidate_label_color: 0xfafafa
      hilited_candidate_text_color: 0xfafafa
      hilited_candidate_back_color: 0xd4bc00
      comment_text_color: 0x808080
      hilited_comment_text_color: 0x444444  

    purity_of_form:
      name: 純粹的形式／Purity of Form
      author: 雨過之後、佛振
      text_color: 0xc2c2c2
      back_color: 0x444444
      candidate_text_color: 0xeeeeee
      hilited_text_color: 0xeeeeee
      hilited_back_color: 0x444444
      hilited_candidate_text_color: 0x000000
      hilited_candidate_back_color: 0xfafafa
      comment_text_color: 0x808080

    purity_of_essence:
      name: 純粹的本質／Purity of Essence
      author: 佛振
      text_color: 0x2c2ccc
      back_color: 0xfafafa
      candidate_text_color: 0x000000
      hilited_text_color: 0x000000
      hilited_back_color: 0xfafafa
      hilited_candidate_text_color: 0xeeeeee
      hilited_candidate_back_color: 0x444444
      comment_text_color: 0x808080  

    starcraft:
      name: 星際我爭霸／StarCraft
      author: Contralisk <contralisk@gmail.com>, original artwork by Blizzard Entertainment
      text_color: 0xccaa88
      candidate_text_color: 0x30bb55
      back_color: 0xee000000
      border_color: 0x1010a0
      hilited_text_color: 0xfecb96
      hilited_back_color: 0x000000
      hilited_candidate_text_color: 0x70ffaf
      hilited_candidate_back_color: 0x00000000
      comment_text_color: 0x1010d0
      hilited_comment_text_color: 0x1010f0

    solarized_rock:
      name: 曬經石／Solarized Rock
      author: "Aben <tntaben@gmail.com>, based on Ethan Schoonover's Solarized color scheme"
      back_color: 0x362b00
      border_color: 0x362b00
      text_color: 0x8236d3
      hilited_text_color: 0x98a12a
      candidate_text_color: 0x969483
      comment_text_color: 0xc098a12a
      hilited_candidate_text_color: 0xffffff
      hilited_candidate_back_color: 0x8236d3
      hilited_comment_text_color: 0x362b00

    solarized_light:
      name: 曬經・日／Solarized Light
      author: 雪齋 <lyc20041@gmail.com>
      color_space: display_p3 # Only available on macOS 10.12+
      back_color: 0xf0E5F6FB #Lab 97, 0, 10
      border_color: 0xf0EDFFFF #Lab 100, 0, 10
      preedit_back_color: 0xf0D7E8ED #Lab 92, 0, 10
      candidate_text_color: 0x3942CB #Lab 50, 65, 45
      label_color: 0x2566C6 #Lab 55, 45, 65
      comment_text_color: 0x8144C2 #Lab 50, 65, -5
      text_color: 0x756E5D #Lab 45, -7, -7
      hilited_back_color: 0xf0C9DADF #Lab 87, 0, 10
      hilited_candidate_back_color: 0x403516 #Lab 20, -12, -12
      hilited_candidate_text_color: 0x989F52 #Lab 60, -35, -5
      hilited_candidate_label_color: 0xCC8947 #Lab 55, -10, -45
      hilited_comment_text_color: 0x289989 #Lab 60, -20, 65
      hilited_text_color: 0xBE706D #Lab 50, 15, -45    

    solarized_dark:
      name: 曬經・月／Solarized Dark
      author: 雪齋 <lyc20041@gmail.com>
      color_space: display_p3 # Only available on macOS 10.12+
      back_color: 0xf0352A0A #Lab 15, -12, -12
      border_color: 0xf02A1F00 #Lab 10, -12, -12
      preedit_back_color: 0xf0403516 #Lab 20, -12, -12
      candidate_text_color: 0x989F52 #Lab 60, -35, -5
      label_color: 0xCC8947 #Lab 55, -10, -45
      comment_text_color: 0x289989 #Lab 60, -20, 65
      text_color: 0xA1A095 #Lab 65, -05, -02
      hilited_back_color: 0xf04C4022 #Lab 25, -12, -12
      hilited_candidate_back_color: 0xD7E8ED #Lab 92, 0, 10
      hilited_candidate_text_color: 0x3942CB #Lab 50, 65, 45
      hilited_candidate_label_color: 0x2566C6 #Lab 55, 45, 65
      hilited_comment_text_color: 0x8144C2 #Lab 50, 65, -5
      hilited_text_color: 0x2C8BAE #Lab 60, 10, 65
```

## Rime 配置：雾凇拼音 | 长期维护的简体词库

https://github.com/iDvel/rime-ice

> 这个好用的。

开源社区, [7 187 views, Nov 18, 2022 at 20:00:22]:
GitHub - ayaka14732/awesome-rime: A curated list of Rime IME schemata | Rime 輸入法方案列表...

开源社区, [7 187 views, Nov 18, 2022 at 20:00:22]:
awesome-rime Rime 輸入法方案列表
🏷 TAG  #输入法 #rime
📢 Channel @opencfdchannel
👥 Group @open_source_community