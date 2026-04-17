# unity-mcp 架构草图

## 目标

`unity-mcp` 作为独立仓库承载 Unity MCP 能力，当前项目仅作为首个真实消费方与联调场景。

## 设计原则

1. **C# First**：Unity Editor、PlayMode、Runtime 能力优先在 UPM 包内实现。
2. **Host 薄层化**：如需 Python Host，仅负责 stdio/http transport、日志、客户端兼容层，不承载 Unity 业务逻辑。
3. **当前项目先联调**：不先创建新的正式开发项目，先借当前 WildRogue 项目完成首轮能力打磨。
4. **后补 Sandbox**：独立 `UnityMcpSandbox` 作为后续 package smoke test 与演示工程，而不是第一阶段前置条件。

## 仓库层次

### 1. packages/com.wildrogue.unity-mcp

核心 UPM 包，承载：

- Editor 状态读取
- Console / 编译错误读取
- Scene / GameObject / Component 操作
- Play 控制、测试执行、截图
- 后续的运行态与领域扩展入口

### 2. host/python-mcp-host

可选薄层，后续再补：

- stdio / http transport
- 客户端兼容配置
- 日志、鉴权、版本暴露

### 3. samples/UnityMcpSandbox

后续补充：

- 最小 Unity 验证工程
- package 独立 smoke test
- 演示与 CI 入口

## 当前消费关系

```text
WildRogue Workspace
  ├─ 当前项目（真实联调环境）
  └─ Tools/unity-mcp（独立 Git 仓库）
       └─ packages/com.wildrogue.unity-mcp
```

后续当前项目将通过 `Packages/manifest.json` 的本地 `file:` 或 Git URL 方式消费该包。

## 首批 MVP 能力边界

第一阶段只覆盖：

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

不在首批范围内：

- 复杂 Runtime AI 行为
- WildRogue 领域玩法工具
- 多实例路由
- 完整构建/性能/物理工具集合
