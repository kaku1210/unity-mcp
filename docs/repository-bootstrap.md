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

## 下一步

1. 在 `unity-mcp` 内完成独立 `git init -b main`
2. 开始实现 UPM 包最小骨架
3. 再进入 MVP 工具开发
4. 稳定后再把当前项目作为正式消费者接入
