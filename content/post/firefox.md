---
id: cza18o5wwogyvd3f6cqmym7
title: Firefox
desc: ''
updated: 1659933638102
created: 1659504703483
---

## 网站主动拒绝 Firefox 的解决方法

![Firefox Not Support](firefox_not_support.jpeg)

近期多家网站拒绝来自Firefox浏览器的访问，例如若用 Firefox 访问 <https://business.apple.com> 会出现“Your browser is not supported”提示。经过测试，该网站实际上不对内核进行识别，而是通过 User Agent 识别浏览器类型。如此一来，可以通过手动修改 Firefox 的默认 UA 伪装成其他受支持的浏览器以规避限制。具体操作如下：

Firefox 地址栏输入并打开 `about:config` ，忽略提醒，搜索框输入 `general.useragent.override` ，数据类型选择 string，点击右侧加号，输入 `Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36` ，并确认。实测问题已解决。


## 网站主动拒绝 Firefox 的解决方法

![Firefox Not Support](firefox_not_support.jpeg)

近期多家网站拒绝来自Firefox浏览器的访问，例如若用Firefox访问 https://business.apple.com 会出现“Your browser is not supported”提示。经过测试，该网站实际上不对内核进行识别，而是通过User Agent识别浏览器类型。如此一来，可以通过手动修改Firefox的默认UA伪装成其他受支持的浏览器以规避限制。具体操作如下：

Firefox地址栏输入并打开“about:config"，忽略提醒，搜索框输入”general.useragent.override“，数据类型选择string，点击右侧加号，输入”Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36“，并确认。实测问题已解决。