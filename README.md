# unity-mcp

`unity-mcp` 是一个在当前 WildRogue 工作区内孵化的独立 Unity MCP 仓库。

当前阶段目标：

- 建立独立 Git 边界
- 建立 UPM 核心包骨架
- 将架构草图、开发计划、初始化说明统一收敛到仓库内部文档
- 以当前项目作为首个真实联调环境

## 当前仓库定位

当前 `Tools/unity-mcp/` 目录：

- 在物理目录上位于当前项目内，便于复用已有 AI 工作流、skills、agents 与调试环境
- 在 Git 维度上作为独立仓库管理
- 在发布维度上将来会推送到独立 GitHub 仓库，当前项目只作为消费方与联调方

## 目录概览

```text
unity-mcp/
├─ docs/
├─ host/
├─ packages/
├─ samples/
└─ scripts/
```

## 当前约定

- 根目录名称固定为 `unity-mcp`
- 当前默认 UPM 包名使用 `com.wildrogue.unity-mcp`，以避免与公共生态潜在命名冲突
- 后续若需要对外发布为更通用的公共包，再单独评估包名迁移方案
- 如果需求目标属于 `unity-mcp` 子仓库本身的功能开发，则对应实现与说明路径必须位于 `Tools/unity-mcp/` 下；推荐把 feature/change 记录放在 `docs/changes/`

## 参考文档

- `docs/architecture.md`
- `docs/development-plan.md`
- `docs/repository-bootstrap.md`
- `docs/changes/README.md`
- `docs/changes/bootstrap-unity-mcp-repo.md`
