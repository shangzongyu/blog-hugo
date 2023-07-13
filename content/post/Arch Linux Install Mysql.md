---
id: 0rvyubg0v3icajis3ffi80n
title: Arch Linux Install Mysql
desc: ''
updated: 1662441711147
created: 1662437526407
---

## MySQL/MariaDB 设置默认密码

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
flush privileges;
exit;
```

## 参考

https://wiki.archlinux.org/title/MariaDB#Installation
