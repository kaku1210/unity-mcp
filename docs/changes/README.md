# unity-mcp feature/change 记录约定

这个目录用于保存 `unity-mcp` 子仓库自己的 feature / change 摘要、设计说明、验证记录和迁移说明。

## 规则

- 如果需求目标属于 `unity-mcp` 子仓库本身，则对应说明路径与实现路径都必须位于 `Tools/unity-mcp/` 下。
- 推荐为每个 feature 或 change 至少保留一份可读摘要文档，放在 `docs/changes/`。
- 父仓库只保留三类相关改动：
  1. nested-repo 边界与 ignore 规则
  2. 当前项目作为消费方的接入改动
  3. 父仓库自己的长期 workflow / archive trail 同步

## 当前已迁入记录

- `bootstrap-unity-mcp-repo.md`：父仓库 bootstrap change 的迁移摘要
