# scripts

此目录用于放置仓库初始化、打包、验证与发布脚本。

当前阶段已建立基础脚本占位与公开发布脚本，后续继续补充：

- `init.ps1`
- `pack.ps1`
- `smoke-test.ps1`
- `publish-public-repo.ps1`

其中 `publish-public-repo.ps1` 用于在已知远程 public 仓库 URL 和正确作者信息时，自动完成：

- 配置子仓库本地 Git 作者
- 设置或更新 `origin`
- 本地首个提交
- 推送到远程 `main`
