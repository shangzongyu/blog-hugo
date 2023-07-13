---
id: s4zz2qcgva5yorrnv3lvwat
title: Git Commit
desc: '语义提交信息'
updated: 1670575876792
created: 1670575001998
---

> Semantic Commit Messages

Format: `<type>(<scope>): <subject>`

- `<scope>` 可选的



```
feat: add hat wobble
^--^  ^------------^
|     |
|     +-> Summary in present tense.
|
+-------> Type: chore, docs, feat, fix, refactor, style, or test.
```

| 类型     | 类别        | 说明                                                                                                   |
| -------- | ----------- | ------------------------------------------------------------------------------------------------------ |
| feat     | Production  | 新功能                                                                                                 |
| fix      | Production  | BUG 修复                                                                                               |
| perf     | Production  | 提高代码性能变更                                                                                       |
| style    | Development | 代码格式变更：比如：使用 gofmt 格式化代码，删除空行                                                    |
| refactor | Production  | 其他代码类的变更，这些变更不属于 feat、 fix、perf 和 style，例如：简化代码、重命名变量、删除冗余代码等 |
| test     | Development | 新增测试用例或者更新现有测试用例                                                                       |
| ci       | Development | 持续集成或者部署相关改动，比如：修改 Jenkins，GitLab CI 等，CI 配置文件或者更新 systemd unit 文件      |
| docs     | Development | 文档类的更新，包括修改用户文档或者开发文档                                                             |
| chore    | Development | 其他类型，比如构建流程、依赖管理或者辅助工具的变动等                                                   |

## 参考

- https://dev.to/i5han3/git-commit-message-convention-that-you-can-follow-1709
- https://karma-runner.github.io/1.0/dev/git-commit-msg.html
- https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716


https://github.com/fteem/git-semantic-commits
