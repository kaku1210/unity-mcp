# unity-mcp 开发计划

## Phase 0：边界与初始化

- 确定孵化目录为 `Tools/unity-mcp/`
- 处理父仓库 `.gitignore`，避免误追踪
- 在 `unity-mcp` 内初始化独立 Git 仓库
- 建立 README、docs、packages、scripts、samples 目录

## Phase 1：UPM 包骨架

- 创建 `packages/com.wildrogue.unity-mcp/`
- 建立 `Editor/`、`Runtime/`、`Tests/`、`Documentation~/`、`Samples~/`
- 创建最小 package.json 与 asmdef

## Phase 2：MVP 工具集

首批必须完成：

- editor_state
- console_logs
- compilation_errors
- scene_hierarchy
- find_gameobject
- manage_gameobject
- manage_components
- play_control
- run_tests
- screenshot

## Phase 3：当前项目接入

- 在当前项目中通过本地 `file:` 方式引用 package
- 用当前项目作为首个真实联调环境
- 比较自研 MCP 与现有 Coplay 能力差距

## Phase 4：验证链补齐

- 编译检查
- Console 检查
- 截图验证
- EditMode / PlayMode 测试回读
- 错误恢复与稳定性验证

## Phase 5：运行态与领域扩展

后续补充：

- Runtime action 调用
- gameplay smoke test
- WildRogue 领域工具
- 项目侧极薄适配层

## Phase 6：独立 Sandbox 与发布

- 新建 `samples/UnityMcpSandbox`
- 建立 package 独立 smoke test
- 推送到独立 GitHub 仓库
- 当前项目转为纯消费方

## 本轮已处理范围

本轮只处理：

- 仓库目录结构
- 独立 Git 初始化前置配置
- UPM 包骨架
- MCP 文档落位

未处理：

- MCP 工具实现
- 当前项目 manifest 接入
- 运行态能力
- Sandbox 正式工程创建
