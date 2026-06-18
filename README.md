# tradeDB 商城管理

轻量级 Web 管理端，直连 SQL Server `tradeDB`，用于查看/编辑商城分类、商品、账户水晶与交易记录。

## 环境

- Python 3.10+
- SQL Server 2000 / 2005 / 2008 R2 及更高版本
- ODBC 驱动（默认 `{SQL Server}` 旧版驱动，Windows 自带，兼容 2000/2005/2008 R2）

## 安装

```bash
cd tools/trade-mall-admin
pip install -r requirements.txt
copy config.example.json config.json
# 编辑 config.json 填写服务器、账号、密码
```

## 快速启动

双击 `start.bat`：自动启动服务并打开 http://127.0.0.1:5050（启动器窗口会保留，按任意键可关闭；服务在另一窗口运行）

或手动：

```bash
python app.py
```

## 数据库驱动

`config.json` 中 `driver` 默认 `SQL Server`（系统自带旧驱动）。

若本机已装新版驱动，可在连接设置中改为：

- `SQL Server Native Client 10.0`
- `ODBC Driver 11 for SQL Server`
- `ODBC Driver 17 for SQL Server`

留空时程序会按上述顺序自动选择本机已安装的驱动。

## 功能

| 模块 | 说明 |
|------|------|
| 概览 | 上架分类/上架商品/热门商品/账户/水晶总额统计 |
| 分类 | 树状查看全部（含下架）、新建、编辑、删除；`buildTime` 排序权重；状态列标识 |
| 商品 | 树状分类筛选；列表显示全部（含下架）；引擎排序 `isHot`/`comTime`；`beginTime` 上架时间；状态列标识 |
| 账户水晶 | 查看 AccountInfo；充值；手动调整 Money |
| 交易记录 | Field5：帐号/购买前余额；Field3：支付水晶；Field2：商品 |

左侧「连接设置」可随时修改数据库连接（驱动下拉为本机已安装 ODBC）。

## 安全与注意

- 仅监听 `127.0.0.1:5050`，无登录鉴权，**勿暴露到公网**。
- `config.json` 含数据库密码，勿提交到 Git（已加入 `.gitignore`）。
- 分页 SQL 使用 `TOP` 写法，兼容 SQL Server 2000。
- 本工具直接写库，请在测试环境验证后再用于生产。
- `Safety` 表不在管理范围内（与游戏服务端一致）。
