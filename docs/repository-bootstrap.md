# unity-mcp 仓库初始化说明

## 当前阶段策略

`unity-mcp` 先在当前 WildRogue 工作区内部孵化开发，原因：

- 可直接复用现有 AI 工作流、skills、agents 与 prompt 配置
- 可直接在真实项目中调优 MCP 能力
- 可在成熟后平滑推送到独立 GitHub 仓库

## Git 边界

父仓库必须忽略：

```text
/Tools/unity-mcp/
```

`unity-mcp` 目录内部作为独立 Git 仓库初始化，默认主分支为 `main`。

## 当前约定

- 仓库名：`unity-mcp`
- 根目录名：`unity-mcp`
- 当前默认 package 名：`com.wildrogue.unity-mcp`
- 当前项目暂不立即修改 `Packages/manifest.json`，待 MVP 骨架稳定后再接入

## 父仓库交接与路径归属

- `bootstrap-unity-mcp-repo` 作为父仓库里的 bootstrap change，只负责把 `unity-mcp` 子仓库孵化出来。
- bootstrap 完成后，`unity-mcp` 本身的功能开发、设计说明、验证记录与 feature 摘要都应保留在 `Tools/unity-mcp/` 目录树中。
- 推荐将 feature/change 记录统一放到 `docs/changes/`；父仓库只保留 nested-repo 边界、消费方接入和 archive trail。
- 当前 bootstrap 迁移记录见：`docs/changes/bootstrap-unity-mcp-repo.md`

## 下一步

1. 在 `docs/changes/` 中为后续 `unity-mcp` feature 建立子仓库内的变更记录
2. 在 `packages/`、`host/`、`samples/`、`scripts/` 中继续实现 MVP 工具能力
3. 稳定后再把当前项目作为正式消费者接入
