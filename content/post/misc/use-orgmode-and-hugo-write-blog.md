+++
title = "使用 hugo 和 ox-hugo 搭建自己的 BLOG"
lastmod = 2018-11-12T16:32:21+08:00
tags = ["macOS"]
categories = ["macOS"]
draft = false
+++

-   为什么要写这个文章？
-   为什么使用 hugo 而不是 hexo 或者其他的？
    -   hexo node 写的，环境配置等麻烦
    -   喜欢 org-mode 语法超过 Markdown
-   为什么使用 org-mode , 而不是 markdown, 明明 Markdown 更有名


## 缘起 {#缘起}

`org-mode` 是一个很强的纯文本语法格式，自己非常喜欢 `org-mode` ，因此自己使用 `org-mode` 来记录自己的笔记。当自己要开始写 BLOG 的时候，就决定决定使用 `org-mode` 来作为自己 BLOG 管理工具，之前是使用 emacs 的插件 [blog-admin](https://github.com/CodeFalling/blog-admin) 和 [hexo](https://hexo.io/) 生成自己的 BLOG，但是自己不是很喜欢这种组合 [blog-admin](https://github.com/CodeFalling/blog-admin) 。有两个原因：一个是 [blog-admin](https://github.com/CodeFalling/blog-admin) 已经不怎么更新了，还有一个就是自己不怎么喜欢 [hexo](https://hexo.io/) (我自己不怎么喜欢node)。

因此我就选择了以下的组合:

-   [hugo](https://gohugo.io/) : 使用 Golang 开发的静态 BLOG 工具
-   [ox-hugo](https://ox-hugo.scripter.co/) : 用于把 `*.org` 转为 hugo 可以识别的 `*.md`
-   [easy-hugo](https://github.com/masasam/emacs-easy-hugo)
-   当然还少不了 [orgmode](https://orgmode.org/)

使用上面说的工具的组合，那么写一篇 BLOG 的变为如下：

1.  使用 org-mode heading 创建文章
2.  写文章
3.  使用 ox-hugo 生成 markdown 文档
4.  使用 easy-hugo 预览(可选)
5.  发布 BLOG

这里使用到了两个工具：ox-hugo 和 easy-hugo, 接下就介绍这两个工具。

> 其实 hugo 原生支持渲染 orgmode 文件，但是它所使用的 markdown 渲染引擎比 orgmode 的渲染引擎要强大的多，这是使用 ox-hugo 的原因之一。


## ox-hugo: org 为 markdown {#ox-hugo-org-为-markdown}

[ox-hugo](https://ox-hugo.scripter.co/) 可以将 org 文件转成 hugo 兼容的 markdown 文件, 也可生成前端格式文件（如 toml 和 yaml）。

可以将你的 orgmode 博文，生成指定的 markdown 文件，这只需要一条指令就够了（官方默认 `C-c C-e H h=），并且，它还会自动更正你的文章修改时间 ，markdown 文件中的 lastmod 值。但让也可以自动生成相应的 markdonw 文件，不用每次都执行 =C-c C-e H h`

至此，你就已经可以按照常规的方法来预览、发布你的博文了。不过还有一个扩展没有介绍—— easy-hugo 。

> 导出的 markdown 文件会编译不过，原因是因为生成的 `author` 标签， `hugo` 报错。因此可以把这个 `author` 禁止掉就可以了 ( `#+options: author:nil` )。


### 入门 {#入门}


#### ScreenShot {#screenshot}

ox-hugo 提供了两种工作流来写 BLOG

方法1:
![](/use-orgmode-and-hugo-write-blog/one-post-per-subtree.png)

方法2:
![](/use-orgmode-and-hugo-write-blog/one-post-per-file.png)


#### 安装 {#安装}

需要 emacs 24.4+ 和 Org 9.0+


#### 配置 {#配置}

`spacemacs` 中 `ox-hugo` 的配置, 在 `dotspacemacs/user-config` 中添加配置：

```emacs-lisp
(defun dotspacemacs/user-config ()
  ;; Other stuff
  ;; ..

  ;; ox-hugo config
  (use-package ox-hugo
    :ensure t            ;Auto-install the package from Melpa (optional)
    :after ox)
  (use-package ox-hugo-auto-export) ;If you want the auto-exporting on file saves
  (use-package ox-hugo
    :ensure t            ;Auto-install the package from Melpa (optional)
    :after ox)
  (use-package ox-hugo-auto-export) ;If you want the auto-exporting on file saves
  )
```

其他的配置参考 [ox-hugo](https://ox-hugo.scripter.co/) 官方文档。


### Org To Hugo {#org-to-hugo}


#### 基于单个文件的导出 {#基于单个文件的导出}

<div class="table-caption">
  <span class="table-number">Table 1</span>:
  Hugo front-matter translation for subtree-based exports
</div>

| Hugo front-matter (TOML)     | Org                                  |
|------------------------------|--------------------------------------|
| title = "foo"                | `#+title: foo`                       |
| date = 2017-07-24            | `#+date: 2017-07-24`                 |
| publishDate = 2018-01-26     | `#+hugo_publishdate: 2018-01-26`     |
| expiryDate = 2999-01-01      | `#+hugo_expirydate: 2999-01-01`      |
| lastmod = <current date>     | `#+hugo_auto_set_lastmod: t`         |
| tags = ["toto", "zulu"]      | `#+hugo_tags: toto zulu`             |
| categories = ["x", "y"]      | `#+hugo_categories: x y`             |
| draft = true                 | `#+hugo_draft: true`                 |
| draft = false                | `#+hugo_draft: false`                |
| weight = 123                 | `#+hugo_weight: 123`                 |
| tags\_weight = 123           | `#+hugo_weight: :tags 123`           |
| categories\_weight = 123     | `#+hugo_weight: :categories 123`     |
| weight = 123 (in [menu.foo]) | `#+hugo_menu: :menu foo :weight 123` |


#### 格式化 {#格式化}

下表是 orgmode 标记语言转换 markdown 标记语言的格式:

<div class="table-caption">
  <span class="table-number">Table 2</span>:
  Org markup to Markdown markup
</div>

| Org                | Markdown                                                       |
|--------------------|----------------------------------------------------------------|
| `*bold*`           | `**bold**`                                                     |
| `/italics/`        | `_italics_`                                                    |
| `\=monospace\=`    | `` `monospace` ``                                              |
| `~key-binding~`    | `` `key-binding` ``                                            |
|                    | - if org-hugo-use-code-for-kbd is nil [default]                |
| `~key-binding~`    | `<kbd>key-binding</kbd>`                                       |
|                    | - if org-hugo-use-code-for-kbd is non-nil                      |
|                    | - Requires CSS to render the <kbd> tag as something special.   |
| `+strike-through+` | `~strike-through~`                                             |
| `_underline_`      | `<span class = "underline">underline</span>`                   |
|                    | - Requires CSS to render this underline class as an underline. |


### 进阶 {#进阶}


#### 自动生成 markdown 文件配置 {#自动生成-markdown-文件配置}

在 `hugo` 的 `base` 目录下新建一个目录 `content-org=，并且新建文件 =.dir-locals.el`, 内容如下：

```emacs-lisp
(("content-org/"
  . ((org-mode . ((org-hugo-auto-export-on-save . t))))))
```

新建目录和文件后的目录结构如下：

```text
<HUGO_BASE_DIR>
  ├── config.toml
  ├── content
  ├── content-org      <-- Org 文件写到这个目录
  ├── static
  ├── themes
  └── .dir-locals.el
```

还没有完，需要在每个 `org` 文件后添加如下内容，这样会很麻烦，但是我们可以使用 `yassnnpets` 来完成：


#### Org 文件中包含图片 {#org-文件中包含图片}

把图片放到 org 文件目录下，使用如下语法就可以引用图片:

```text
[[file:image_path]]
```


## 附录 {#附录}


### 我的Snipptes {#我的snipptes}

```text
# -*- mode: snippet -*-
# name: hugo
# key: hugo
# --
#+HUGO_BASE_DIR: ~/blog
#+HUGO_SECTION: ./post
#+TITLE: $1
#+DATE: `(format-time-string "%Y-%m-%d")`
#+options: author:nil
#+HUGO_AUTO_SET_LASTMOD: t
#+HUGO_TAGS: $2
#+HUGO_CATEGORIES: $3
#+HUGO_DRAFT: false

$0

* Footnotes
* COMMENT Local Variables                          :ARCHIVE:
# Local Variables:
# org-hugo-auto-export-on-save: t
# End:
```


## 参考 {#参考}

-   <https://ox-hugo.scripter.co/>
-   <https://github.com/masasam/emacs-easy-hugo>
-   <http://www.xianmin.org/post/ox-hugo/>
-   <https://blog.coderzh.com/2015/08/29/hugo/>
