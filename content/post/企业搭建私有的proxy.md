---
id: dfyfif5i251gcasit2zkdvf
title: 企业搭建私有的proxy
desc: ''
updated: 1669086094370
created: 1669085108542
---

部署公司内部自己的 goproxy.io 服务

随着 go module 的不断普及，通常情况下，我们可以直接使用 goproxy.io 公共服务来解决海外依赖问题，但是有时候公司内部的仓库就很难办了，这些 git server 通常运行在企业内网环境下，开发人员既想能快速的下载海外依赖，又想能下载到公司内部的代码库。这时候可以在公司内部部署一个属于自己的 goproxy.io 服务来解决这个问题。还有哪些场景需要我们自己部署公司内部的 goproxy server 呢

- 访问公司内网的 git server
- 防止公网仓库变更或者消失，导致线上编译失败或者紧急回退失败
- 公司审计和安全需要
- 防止公司内部开发人员配置不当造成 import path 泄露
- cache 热点依赖，降低公司公网出口带宽

