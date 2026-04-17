# python-mcp-host

该目录预留给后续可选的 Python MCP Host。

当前阶段不实现具体 Host 逻辑，仅保留结构占位。

后续职责：

- stdio/http transport
- 客户端兼容配置
- 日志与鉴权薄层

约束：

- 不承载 Unity 业务逻辑
- 不承载 WildRogue 玩法逻辑
- Unity 核心能力优先在 UPM 包中实现
