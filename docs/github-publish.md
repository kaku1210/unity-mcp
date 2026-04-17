# GitHub 公开仓库发布说明

## 当前状态

`unity-mcp` 子仓库已经完成：

- 独立 Git 仓库初始化
- 本地首个 bootstrap commit 已创建
- 文档与 UPM 包骨架初始化
- 父仓库忽略规则配置
- 已发布到 GitHub 公共仓库：`https://github.com/kaku1210/unity-mcp`
- 已将公开历史中的提交作者统一修正为 `kaku1210 <kaku1210@users.noreply.github.com>`

## 当前发布结果

- GitHub 仓库可访问：`https://github.com/kaku1210/unity-mcp`
- 默认分支：`main`
- 当前发布内容：仓库骨架、文档、UPM 包骨架、脚本占位与公开发布脚本

## 脚本用途

`publish-public-repo.ps1` 仍然保留，后续可用于：

- 重建新的远程仓库
- 推送另一个测试仓库
- 在首次公开推送前自动修正本地 bootstrap 历史作者

## 推荐发布步骤

以下步骤保留作为“重新发布 / 迁移远程仓库”时的参考。

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
- 若当前只有本地 bootstrap commit，则在推送前自动修正该提交作者
- 配置或更新 `origin`
- `git add .`
- 生成首个提交
- `git push -u origin main`

## 注意事项

- 当前环境中检测到 Git 作者为占位值 `gh / gh`，因此不建议直接用它生成公开提交。
- 如果远程仓库已经存在且已有默认内容（例如 README / LICENSE），请先改为手动拉取/合并流程，不要直接执行自动推送脚本。
