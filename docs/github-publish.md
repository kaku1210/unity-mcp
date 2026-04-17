# GitHub 公开仓库发布说明

## 当前状态

`unity-mcp` 子仓库已经完成：

- 独立 Git 仓库初始化
- 文档与 UPM 包骨架初始化
- 父仓库忽略规则配置

当前尚未完成远程公共仓库发布，原因是当前环境缺少：

- 可用的 GitHub CLI (`gh`)
- 可用的 `GH_TOKEN` / `GITHUB_TOKEN`
- 远程 public 仓库 URL
- 最终公开提交应使用的作者名/邮箱

## 推荐发布步骤

### 1. 在 GitHub 上创建空 public 仓库

仓库名建议：

- `unity-mcp`

创建完成后，拿到远程 URL：

- HTTPS，例如：`https://github.com/<owner>/unity-mcp.git`
- SSH，例如：`git@github.com:<owner>/unity-mcp.git`

### 2. 准备提交作者信息

发布前请确定用于公开提交的作者信息：

```text
AuthorName <author@example.com>
```

### 3. 使用脚本自动完成本地提交与推送

在 `Tools/unity-mcp/` 目录下运行：

```powershell
./scripts/publish-public-repo.ps1 \
  -RemoteUrl "https://github.com/<owner>/unity-mcp.git" \
  -AuthorName "<author-name>" \
  -AuthorEmail "<author-email>"
```

脚本会自动：

- 设置当前子仓库的本地 Git 作者
- 配置或更新 `origin`
- `git add .`
- 生成首个提交
- `git push -u origin main`

## 注意事项

- 当前环境中检测到 Git 作者为占位值 `gh / gh`，因此不建议直接用它生成公开提交。
- 如果远程仓库已经存在且已有默认内容（例如 README / LICENSE），请先改为手动拉取/合并流程，不要直接执行自动推送脚本。
