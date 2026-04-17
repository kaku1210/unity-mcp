# unity-mcp 开发计划

## 当前状态

`unity-mcp` 当前已经完成：

- 独立 Git 仓库初始化
- GitHub 公共仓库发布：`https://github.com/kaku1210/unity-mcp`
- 仓库级文档结构初始化
- `com.wildrogue.unity-mcp` UPM 包骨架初始化
- 基础脚本与发布脚本初始化

当前**尚未完成**：

- 任何实际 MCP 工具的 C# 代码实现
- 当前 WildRogue 项目对 `com.wildrogue.unity-mcp` 的正式消费接入
- 独立 Unity Sandbox 工程
- Runtime 调试与领域工具层

## 总体目标

将 `unity-mcp` 建设为一个独立维护的 Unity MCP 仓库，满足以下目标：

1. 提供 Unity Editor 自动化与事实验证工具
2. 在当前 WildRogue 项目中作为首个真实消费方联调
3. 后续可扩展 Runtime 调试与玩法验证能力
4. 最终让当前项目从“孵化开发场”过渡到“纯消费方”

## 开发原则

### 1. C# First

- Unity Editor / PlayMode / Runtime 能力优先在 UPM 包中用 C# 实现
- Python Host 如有需要，仅承担协议层和兼容层职责

### 2. 先通用、后领域

- 先实现通用 Unity MCP 工具
- 再实现 WildRogue 领域特化工具
- 避免将游戏业务逻辑直接写死在通用包核心里

### 3. 先联调、后解耦

- 当前阶段优先使用 WildRogue 作为真实联调环境
- 等 MVP 工具稳定后，再补独立 Sandbox 工程

### 4. 先最小闭环、后大全套

- 先做能形成完整工作链的 4~10 个 MVP 工具
- 不在第一阶段追求大而全的能力矩阵

## Phase 0：边界与初始化（已完成）

### 目标

- 在当前工作区内建立独立孵化仓库
- 建立 Git 边界
- 建立 UPM 包骨架和基础文档

### 已完成输出

- `Tools/unity-mcp/`
- 独立 Git 仓库
- GitHub 公共仓库
- `docs/`、`packages/`、`host/`、`samples/`、`scripts/`
- `com.wildrogue.unity-mcp` 包骨架

## Phase 1：MVP 工具集

### 目标

实现首批真正可用的 Unity MCP 工具，形成“状态读取 → 场景感知 → 结果验证”的最小闭环。

### MVP 必须完成的工具

#### 第一批（建议最先做）

- `editor_state`
- `console_logs`
- `scene_hierarchy`
- `screenshot`

#### 第二批

- `compilation_errors`
- `find_gameobject`
- `manage_gameobject`
- `play_control`

#### 第三批

- `manage_components`
- `run_tests`

### 阶段验收标准

- 至少 4 个工具能在当前项目中被实际调用
- 工具调用后能通过日志、截图或返回结果证明行为成立
- 不引入新的 Unity Console Error

## Phase 2：当前项目接入

### 目标

将当前 WildRogue 项目变为 `unity-mcp` 的首个正式消费方。

### 计划动作

- 在当前项目的 `Packages/manifest.json` 中以本地 `file:` 方式引用
- 与现有 `com.coplaydev.unity-mcp` 并联一段时间
- 比较两者在 editor_state、scene、screenshot、play_control 等能力上的差异

### 阶段验收标准

- 当前项目能够加载 `com.wildrogue.unity-mcp`
- 至少一条工作链由自研 MCP 跑通
- 不影响现有 Coplay 工作流

## Phase 3：验证链补齐

### 目标

把自研 MCP 从“能调用”推进到“可验证、可回归”。

### 需要补齐的验证能力

- 编译检查
- Console 错误检查
- 截图回读
- EditMode / PlayMode 测试结果回读
- 基本错误恢复策略

### 阶段验收标准

- 每个 MVP 工具至少有一种可重复验证方式
- 出现常见错误时，工具返回信息足够指导 AI 或开发者继续处理

## Phase 4：运行态与领域扩展

### 目标

在通用工具稳定后，开始扩展 Runtime 调试与 WildRogue 特化能力。

### 后续扩展方向

- Runtime action 调用
- gameplay smoke test
- 运行态状态快照
- WildRogue 领域工具
- 项目侧极薄适配层

### 领域工具示例

- `wildrogue.debug.dump_state`
- `wildrogue.ui.open_panel`
- `wildrogue.test.run_smoke_flow`
- `wildrogue.combat.spawn_wave`

## Phase 5：独立 Sandbox 与发布流程

### 目标

把当前“依赖真实项目联调”的孵化仓库，推进到具备独立验证和发布能力的仓库。

### 计划动作

- 创建真正的 `samples/UnityMcpSandbox` Unity 工程
- 建立 package 独立 smoke test
- 梳理 release / tag /版本策略
- 让当前项目逐步转为纯消费方

### 当前状态

- GitHub 公共仓库已完成
- Sandbox 正式工程未开始
- 自动化 release 流程未开始

## 日常开发流程建议

### 文档与实现路径规则

- 如果需求目标属于 `unity-mcp` 子仓库本身的功能开发，则设计、计划、验证记录和实现文件都应放在 `Tools/unity-mcp/` 内。
- 推荐把 feature/change 记录放在 `docs/changes/`，实现代码放在 `packages/`、`host/`、`samples/` 或 `scripts/`。
- 父仓库只在 nested-repo 边界调整、当前项目消费接入或仓库级长期规则同步时再改动。

### 每次迭代建议顺序

1. 在 `unity-mcp` 子仓库内实现一小块工具能力
2. 在当前 WildRogue 项目中联调
3. 进行截图 / Console / 测试回读验证
4. 更新 `docs/development-plan.md` 或相关设计说明
5. 先提交 `unity-mcp` 子仓库
6. 再根据需要提交父仓库中的接入变更

## 近期优先级

### P0

- `editor_state`
- `console_logs`
- `scene_hierarchy`
- `screenshot`

### P1

- `manage_gameobject`
- `play_control`
- `compilation_errors`
- `find_gameobject`

### P2

- `manage_components`
- `run_tests`
- 当前项目本地 `file:` 接入

### P3

- Runtime 扩展
- WildRogue 领域工具
- 独立 Sandbox

## 当前未处理项

以下内容仍待后续继续实现：

- MCP 工具实现代码
- 当前项目 manifest 接入
- Runtime 调试能力
- WildRogue 领域工具
- 独立 Sandbox 工程
- 正式 release 流程
