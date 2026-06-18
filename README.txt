tradeDB 商城管理 — 便携版
========================


使用前准备
----------

1. ODBC 驱动（必装）
   本程序通过 ODBC 连接 SQL Server，目标 Windows 须已安装以下驱动之一：
   - SQL Server（Windows 自带旧驱动）
   - SQL Server Native Client 10.0 / 11.0
   - ODBC Driver 11 / 13 / 17 / 18 for SQL Server

   可在「ODBC 数据源管理器 → 驱动程序」中查看已安装驱动。
   若无驱动，请从微软官网下载并安装「ODBC Driver for SQL Server」。

2. SQL Server 数据库
   须能访问 tradeDB 所在 SQL Server（本机或远程均可）。

3. 填写 config.json
   用记事本编辑同目录下的 config.json：
   - server      数据库服务器地址
   - port        端口，默认 1433
   - database    数据库名，默认 tradeDB
   - username    登录账号
   - password    登录密码
   - driver      ODBC 驱动名，留空则自动选择本机已安装驱动


运行
----

双击 tradedb-management.exe，控制台会显示：

  trade-mall-admin: http://127.0.0.1:5050

浏览器访问 http://127.0.0.1:5050 即可使用。
关闭控制台窗口即停止服务。

也可在 Web 界面左侧「连接设置」中修改数据库连接并测试。


安全提示
--------

- 仅监听 127.0.0.1，无登录鉴权，请勿暴露到公网。
- config.json 含数据库密码，请妥善保管，勿随包分发真实密码。
- 本工具直接写库，请在测试环境验证后再用于生产。
