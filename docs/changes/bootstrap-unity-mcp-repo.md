# bootstrap-unity-mcp-repo

## 来源说明

`bootstrap-unity-mcp-repo` 最初作为父仓库 `AIProject_Z01_remote` 中的 OpenSpec change 创建，用来完成 `Tools/unity-mcp/` 子仓库的第一次孵化。

因为当时子仓库尚未建立，所以 bootstrap 边界需要先在父仓库里落地。完成 bootstrap 后，这份摘要迁入 `Tools/unity-mcp/docs/changes/`，作为子仓库侧的历史入口继续保留。

## 本次 bootstrap 交付内容

- 建立 `Tools/unity-mcp/` 目录并初始化 nested repository Git 边界
- 建立 `docs/`、`host/`、`packages/`、`samples/`、`scripts/` 结构
- 建立 `packages/com.wildrogue.unity-mcp/` 最小 UPM 包骨架
- 在子仓库内补齐 `README.md`、`architecture.md`、`development-plan.md`、`repository-bootstrap.md`
- 在父仓库建立 `/Tools/unity-mcp/` ignore 边界

## 迁移后的边界规则

从 bootstrap 完成之后开始：

- 如果需求目标属于 `unity-mcp` 本身，则设计、实现、验证记录与 feature 摘要都应放在 `Tools/unity-mcp/` 下。
- 推荐把对应摘要文档放在 `docs/changes/`。
- 父仓库后续只在三种情况下继续改动：
  1. nested-repo 边界或 ignore 规则调整
  2. 当前项目作为消费方的接入改动
  3. 父仓库自己的长期 workflow / archive trail 同步

## 父仓库侧对应关系

- 父仓库 enduring spec：`openspec/specs/unity-mcp-workspace-bootstrap/spec.md`
- 父仓库 bootstrap archive：`openspec/changes/archive/2026-04-17-bootstrap-unity-mcp-repo/`

## 后续建议

- 后续 `unity-mcp` feature 可以按一个 feature 一份摘要的方式继续记录在 `docs/changes/`
- 真正的功能实现优先落在 `packages/`、`host/`、`samples/`、`scripts/` 中，而不是回到父仓库做实现
