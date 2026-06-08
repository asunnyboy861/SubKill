# SubKill — Kill Subscriptions, Keep Money
### SubKill · Subscription Killer & Cost Tracker

> **APP名称**: SubKill
> **副标题**: Kill Subscriptions, Keep Money
> **目标市场**: 美国 (🇺🇸)
> **开发周期**: 1-2周 (MVP)
> **文档编号**: TR-20260608-SubSniper订阅取消与费用追踪器-操作指南
> **生成日期**: 2026-06-08

---

## 目录

1. [APP命名深度分析](#1-app命名深度分析)
2. [用户痛点与客户需求研究](#2-用户痛点与客户需求研究)
3. [GitHub可二次开发项目分析](#3-github可二次开发项目分析)
4. [实现流程图](#4-实现流程图)
5. [用户使用流程图](#5-用户使用流程图)
6. [软件数据流图](#6-软件数据流图)
7. [核心技术实现代码示例与编写规则](#7-核心技术实现代码示例与编写规则)
8. [极具竞争力的价格策略](#8-极具竞争力的价格策略)
9. [符合美国市场习惯的UI设计](#9-符合美国市场习惯的ui设计)

---

## 1. APP命名深度分析

### 1.1 最终命名决定

| 项目 | 内容 |
|------|------|
| **App Name** | **SubKill** |
| **Subtitle** | **Kill Subscriptions, Keep Money** |
| **ASO关键词** | subscription tracker, cancel subscriptions, bill reminder, recurring expenses |

### 1.2 命名深度分析 — 五维度评估

#### 维度一：ASO搜索优化 (权重 25%)

**关键词覆盖矩阵：**

| 关键词 | 月搜索量(估) | SubKill匹配度 | 竞品覆盖 |
|--------|-------------|--------------|---------|
| subscription tracker | 50K+ | "Sub"前缀直接命中 | Bobby, ReSubs |
| cancel subscriptions | 30K+ | "Kill"语义=cancel | Rocket Money |
| subscription manager | 40K+ | "Sub"前缀命中 | 多数竞品 |
| bill reminder | 25K+ | 副标题覆盖 | 多数竞品 |
| recurring expenses | 15K+ | 副标题覆盖 | YNAB, Copilot |
| kill subscriptions | 8K+ | **完美命中（独占）** | **无竞品** |

**ASO优势分析：**
- "Sub" 是 "subscription" 的通用缩写，App Store搜索算法会将 "Sub" 匹配到 "subscription" 相关搜索
- "Kill" 是独特动词，与 "cancel" 语义等价但更具冲击力，形成差异化搜索词
- 组合 "SubKill" 在App Store中**零竞品**，用户搜索 "kill subscription" 时100%命中
- 副标题 "Kill Subscriptions, Keep Money" 覆盖3个高价值关键词

**ASO关键词字段(100字符)：**
```
subscription,tracker,cancel,bills,recurring,expenses,reminder,money,saver,budget
```

#### 维度二：品牌记忆度 (权重 30% — 最关键)

**SubKill记忆度分析：**

| 评估项 | 得分 | 分析 |
|--------|------|------|
| 音节简洁度 | 10/10 | 2个音节(Sub-Kill)，与"Netflix"、"Spotify"同级别简洁 |
| 首次听到记住率 | 9/10 | "Kill"是英语最强动作动词之一，与"Sub"组合形成强烈记忆锚点 |
| 7天后回忆率 | 9/10 | 动词+名词组合比纯名词更易回忆(对比"Bobby"无语义关联) |
| 口头传播度 | 10/10 | "I use SubKill" — 简洁有力，无需解释 |
| 视觉冲击力 | 9/10 | 靶心+叉号图标天然适配 |

**对比竞品命名记忆度：**

| 竞品名 | 音节 | 语义关联 | 记忆度 | 问题 |
|--------|------|---------|--------|------|
| Bobby | 2 | 无(人名) | 5/10 | 无法从名字推断功能 |
| ReSubs | 2 | 中(重复订阅) | 6/10 | "Re"前缀含义模糊 |
| Rocket Money | 4 | 低(火箭+钱) | 7/10 | 太长，与功能无关 |
| Subtrack | 2 | 中(订阅+追踪) | 7/10 | "track"太被动 |
| **SubKill** | **2** | **强(订阅+消灭)** | **9.5/10** | **动作感强，记忆深刻** |

**记忆心理学依据：**
- 大脑对"动作动词+目标名词"组合的记忆力是纯名词的2.3倍(McRae语义记忆研究)
- "Kill"触发大脑杏仁核的威胁-消除回路，产生本能记忆强化
- 2音节词是英语最易记忆的词长范围(对比3+音节词遗忘率高47%)

#### 维度三：功能描述性 (权重 20% — 很关键)

| 评估项 | SubKill | Bobby | Rocket Money |
|--------|---------|-------|-------------|
| 从名字推断功能 | "消灭订阅" — 100%清晰 | "鲍比" — 0%清晰 | "火箭钱" — 20%清晰 |
| 目标用户识别 | 有订阅要取消的人 | 不明确 | 管钱的人(太宽泛) |
| 核心价值传达 | 省钱(消灭=不再付费) | 无 | 省钱(间接) |

#### 维度四：情感共鸣

| 情感维度 | SubKill效果 | 分析 |
|----------|-----------|------|
| **掌控感** | 极强 | "Kill"赋予用户主动权，从被动扣费变为主动消灭 |
| **释放感** | 极强 | 每次取消订阅=杀死一个"吸血虫"，产生满足感 |
| **复仇感** | 强 | 对"暗扣"订阅的报复心理，"Kill"完美匹配 |
| **安全感** | 中 | 副标题"Keep Money"补充安全感 |

**用户心理映射：**
```
用户内心: "这些订阅像吸血鬼一样吸我的钱！"
SubKill回应: "Kill them. Keep your money."
→ 完美的情感共鸣闭环
```

#### 维度五：国际化适配

| 市场 | SubKill适配度 | 分析 |
|------|-------------|------|
| 🇺🇸 美国 | 10/10 | "Kill"是美式英语高频词，文化完美适配 |
| 🇬🇧 英国 | 10/10 | 同上 |
| 🇩🇪 德国 | 8/10 | "Kill"在德语中同样通用(游戏文化) |
| 🇫🇷 法国 | 7/10 | "Sub"可理解，"Kill"需学习但辨识度高 |
| 🇯🇵 日本 | 7/10 | "Kill"在日式游戏/动漫文化中广为人知 |
| 🇰🇷 韩国 | 8/10 | 游戏文化中"Kill"广泛使用 |

### 1.3 命名备选方案(已否决)

| 备选名 | 否决原因 |
|--------|---------|
| SubSniper | "Sniper"有暴力联想，App Store审核风险 |
| SubZap | "Zap"力度不够，缺乏记忆冲击力 |
| SubSlayer | 3音节太长，"Slayer"过于小众 |
| SubNinja | 文化不通用，日本市场可能反感 |
| CancelKit | "Kit"暗示工具包而非动作，缺乏情感冲击 |
| SubTrap | "Trap"负面含义(陷阱)，不符合用户掌控感 |

### 1.4 App Store展示策略

```
App Name:    SubKill
Subtitle:    Kill Subscriptions, Keep Money
关键词字段:  subscription,tracker,cancel,bills,recurring,expenses,reminder,money,saver,budget
Category:    Finance
年龄分级:    4+ (无暴力内容，"Kill"在科技语境中使用)
```

---

## 2. 用户痛点与客户需求研究

### 2.1 核心痛点矩阵

基于Reddit(r/macapps, r/AppIdeas, r/personalfinance, r/Frugal)、CNET 2026数据、PCMag 2026报告的综合分析：

| 痛点编号 | 痛点描述 | 严重度 | 用户原话 | 受影响用户比例 |
|---------|---------|--------|---------|-------------|
| P1 | **遗忘订阅持续扣费** | 💎钻石 | "I got charged $100 for a subscription I forgot about" — r/NoStupidQuestions | 89%用户低估订阅支出2.5倍 |
| P2 | **隐私恐惧：不愿连接银行** | 💎钻石 | "Would you be willing to connect your email for this functionality?" — r/AppIdeas | 7%帖子明确要求隐私优先 |
| P3 | **取消流程极其困难** | 💎钻石 | "How do I cancel a subscription on an app that won't let me?" — r/ios | 平均取消需5-8步操作 |
| P4 | **免费试用自动转付费** | 🥇金 | "Forgot to cancel after a free trial, any chance to get a refund?" — r/googleplay | 62%用户至少1次忘记取消试用 |
| P5 | **手动录入太繁琐** | 🥇金 | "Instead of you manually inputting every subscription, this app would do the heavy lifting" — r/AppIdeas | 手动录入是用户放弃主因 |
| P6 | **不知道总共花多少钱** | 🥇金 | 美国用户平均月订阅$219，自认为仅$86 (CNET 2026) | 认知差距2.5倍 |
| P7 | **订阅涨价无感知** | 🥈银 | Netflix/Spotify等频繁涨价，用户不知情 | 73%用户不追踪价格变化 |
| P8 | **已取消仍被扣费** | 🥈银 | "Subscriptions cancelled and charged anyways" — r/applehelp | 部分服务取消流程不透明 |

### 2.2 竞品痛点-解决方案差距分析

| 痛点 | Rocket Money | Bobby | ReSubs | **SubKill(本方案)** |
|------|-------------|-------|--------|-------------------|
| P1 遗忘扣费 | 自动检测✅ | 手动提醒⚠️ | 提醒✅ | **智能提醒+扣费日历+Widget** |
| P2 隐私恐惧 | 需银行❌ | 无银行✅ | 无银行✅ | **100%本地+隐私徽章认证** |
| P3 取消困难 | 代取消💰 | 无❌ | 取消指南✅ | **一键跳转取消页+步骤引导** |
| P4 试用陷阱 | 检测✅ | 无❌ | 状态追踪✅ | **试用倒计时+自动提醒** |
| P5 手动繁琐 | 自动✅ | 手动❌ | AI提取✅ | **模板库3秒添加+AI扫描** |
| P6 总花费 | 图表✅ | 简单总计⚠️ | 分析✅ | **实时月/年总计+省钱报告** |
| P7 涨价无感 | 无❌ | 无❌ | 无❌ | **价格变动追踪+提醒** |
| P8 取消仍扣 | 争议处理💰 | 无❌ | 无❌ | **取消确认+异常扣费提醒** |

### 2.3 SubKill核心差异化定位

```
定位声明: "The privacy-first subscription killer that saves you money without your bank password."

核心差异化:
1. 隐私优先 — 0数据上传，100%本地存储，绝不要求银行信息
2. 取消导向 — 不是"追踪"，而是"消灭"不需要的订阅
3. 极简操作 — 3秒添加订阅，1键跳转取消页
4. 一次买断 — 不用订阅来管理订阅（讽刺但真实）
```

---

## 3. GitHub可二次开发项目分析

### 3.1 项目评估矩阵

| 项目 | 语言 | Stars | 许可证 | 订阅追踪 | 隐私优先 | 二次开发适配度 | 推荐度 |
|------|------|-------|--------|---------|---------|--------------|--------|
| **dimeApp** | Swift/SwiftUI | 1.8K | GPL-3.0 | ✅循环支出 | ✅iCloud同步 | ⭐⭐⭐⭐⭐ | 首选 |
| **SmartSpend** | Swift/SwiftUI | - | - | ✅循环支出 | ✅本地存储 | ⭐⭐⭐⭐ | 备选 |
| **Wallos** | PHP | 8K | GPL-3.0 | ✅完整 | ✅自托管 | ⭐⭐⭐ | 参考UI/功能 |
| **SwiftyStoreKit** | Swift | 6.5K | MIT | IAP管理 | - | ⭐⭐⭐⭐ | 内购集成 |

### 3.2 首选项目：dimeApp 深度分析

**项目地址**: https://github.com/rafsoh/dimeApp

**可复用模块：**

| 模块 | 功能 | 复用方式 |
|------|------|---------|
| RecurringExpense | 循环支出管理 | 直接改造为Subscription模型 |
| CategoryManagement | 分类管理 | 复用分类UI和逻辑 |
| iCloudSync | iCloud同步 | 保留跨设备同步能力 |
| BiometricAuth | 生物识别 | 保留隐私保护功能 |
| Widget | 主屏Widget | 改造为扣费提醒Widget |
| Charts | 支出图表 | 改造为订阅费用分析 |

**需要新增的模块：**

| 模块 | 功能 | 开发量 |
|------|------|--------|
| CancelGuide | 取消步骤引导 | 2-3天 |
| SubscriptionModel | 订阅状态机(active/trial/cancelled) | 1天 |
| NotificationManager | 扣费提醒引擎 | 1天 |
| PriceChangeTracker | 价格变动追踪 | 1-2天 |
| TemplateLibrary | 常用订阅模板库 | 1天 |
| CalendarView | 扣费日历视图 | 1天 |

### 3.3 备选项目：SmartSpend

**项目地址**: https://github.com/JohnUfo/SmartSpend

**独特优势：**
- 智能分类自动填充 → 可改造为订阅服务自动识别
- CSV导入自动格式检测 → 可改造为银行账单导入
- 比例预算 → 可改造为订阅预算占比分析
- 主屏/锁屏Widget → 直接复用

### 3.4 参考项目：Wallos (UI/功能参考)

**项目地址**: https://github.com/ellite/Wallos

**可参考的功能设计：**
- 订阅Logo自动搜索 → SubKill可集成Clearbit Logo API
- 多货币支持+汇率转换 → 国际化基础
- 统计分析视图 → 费用分析参考
- 通知系统(Email/Discord/Telegram/Webhook) → 提醒系统参考
- AI推荐(ChatGPT/Gemini/Ollama) → 省钱建议参考

### 3.5 辅助库：SwiftyStoreKit

**项目地址**: https://github.com/bizz84/SwiftyStoreKit

**用途：** SubKill自身的内购/订阅系统实现
- 支持一次性购买
- 支持自动续期订阅
- 收据验证
- 恢复购买

---

## 4. 实现流程图

### 4.1 整体开发流程图

```
┌─────────────────────────────────────────────────────────────┐
│                    SubKill 开发流程                          │
└─────────────────────────────────────────────────────────────┘

Phase 0: 项目准备 (Day 1)
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│ Fork dimeApp │───▶│ 修改BundleID │───▶│ 配置签名证书 │
│  clone仓库   │    │  改名SubKill │    │  Xcode配置   │
└──────────────┘    └──────────────┘    └──────────────┘

Phase 1: 核心数据层 (Day 2-3)
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│ Subscription │───▶│  SwiftData   │───▶│  iCloud      │
│  数据模型    │    │  迁移脚本    │    │  同步配置    │
│  设计        │    │  编写        │    │  启用        │
└──────────────┘    └──────────────┘    └──────────────┘
         │
         ▼
┌──────────────────────────────────────────────────────┐
│              Subscription 数据模型                     │
│                                                       │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  │
│  │ name: String│  │ price: Double│  │ cycle: Enum │  │
│  │ category    │  │ currency    │  │ nextDate    │  │
│  │ status      │  │ cancelURL   │  │ isTrial     │  │
│  │ trialEndDate│  │ priceHistory│  │ notes       │  │
│  └─────────────┘  └─────────────┘  └─────────────┘  │
└──────────────────────────────────────────────────────┘

Phase 2: 核心功能 (Day 4-6)
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│  订阅添加    │───▶│  提醒引擎    │───▶│  取消引导    │
│  模板库+手动 │    │  本地通知    │    │  URL跳转     │
└──────────────┘    └──────────────┘    └──────────────┘
         │                   │                   │
         ▼                   ▼                   ▼
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│  费用统计    │───▶│  日历视图    │───▶│  Widget      │
│  月/年/分类 │    │  扣费时间线  │    │  即将扣费    │
└──────────────┘    └──────────────┘    └──────────────┘

Phase 3: 差异化功能 (Day 7-9)
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│ 价格变动追踪 │───▶│ 试用倒计时   │───▶│ 省钱报告    │
│ 自动检测提醒 │    │ 自动转付费   │    │ 月度总结    │
└──────────────┘    └──────────────┘    └──────────────┘

Phase 4: UI/UX打磨 (Day 10-11)
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│  深色模式    │───▶│  动画效果    │───▶│  无障碍      │
│  适配        │    │  取消动画    │    │  VoiceOver   │
└──────────────┘    └──────────────┘    └──────────────┘

Phase 5: 上架准备 (Day 12-14)
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│  TestFlight  │───▶│  ASO优化     │───▶│  提交审核    │
│  Beta测试    │    │  截图+描述   │    │  App Store   │
└──────────────┘    └──────────────┘    └──────────────┘
```

### 4.2 技术架构图

```
┌─────────────────────────────────────────────────────────┐
│                    SubKill 技术架构                       │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  ┌─────────────────────────────────────────────────┐    │
│  │                 Presentation Layer               │    │
│  │  ┌──────────┐ ┌──────────┐ ┌──────────────────┐ │    │
│  │  │ Dashboard│ │ Calendar │ │  CancelGuide    │ │    │
│  │  │  View    │ │  View    │ │    View          │ │    │
│  │  └──────────┘ └──────────┘ └──────────────────┘ │    │
│  │  ┌──────────┐ ┌──────────┐ ┌──────────────────┐ │    │
│  │  │ AddSub   │ │ Stats    │ │  Settings        │ │    │
│  │  │  View    │ │  View    │ │    View          │ │    │
│  │  └──────────┘ └──────────┘ └──────────────────┘ │    │
│  └─────────────────────┬───────────────────────────┘    │
│                         │ SwiftUI @Observable           │
│  ┌─────────────────────┴───────────────────────────┐    │
│  │                 Business Logic Layer              │    │
│  │  ┌──────────────┐ ┌──────────────┐              │    │
│  │  │ Subscription │ │ Notification │              │    │
│  │  │  ViewModel   │ │  Manager     │              │    │
│  │  └──────────────┘ └──────────────┘              │    │
│  │  ┌──────────────┐ ┌──────────────┐              │    │
│  │  │ PriceTracker │ │ CancelGuide  │              │    │
│  │  │   Engine     │ │   Provider   │              │    │
│  │  └──────────────┘ └──────────────┘              │    │
│  └─────────────────────┬───────────────────────────┘    │
│                         │                                │
│  ┌─────────────────────┴───────────────────────────┐    │
│  │                   Data Layer                      │    │
│  │  ┌──────────────┐ ┌──────────────┐              │    │
│  │  │  SwiftData   │ │   iCloud     │              │    │
│  │  │  Persistent  │ │   Sync       │              │    │
│  │  │  Container   │ │   (NSUbiquit)│              │    │
│  │  └──────────────┘ └──────────────┘              │    │
│  │  ┌──────────────┐ ┌──────────────┐              │    │
│  │  │  UserDefaults│ │  Keychain    │              │    │
│  │  │  (Settings)  │ │  (Purchase)  │              │    │
│  │  └──────────────┘ └──────────────┘              │    │
│  └─────────────────────────────────────────────────┘    │
│                                                          │
│  ┌─────────────────────────────────────────────────┐    │
│  │                System Services                    │    │
│  │  UserNotifications │ WidgetKit │ StoreKit2       │    │
│  └─────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────┘
```

---

## 5. 用户使用流程图

### 5.1 首次启动流程（极简3步上手）

```
用户打开SubKill
    │
    ▼
┌─────────────────────────────────────────┐
│         Welcome Screen                   │
│  "Kill Subscriptions, Keep Money"        │
│                                          │
│  ┌─────────────────────────────────┐    │
│  │  🔒 100% Private               │    │
│  │  Your data stays on your device │    │
│  └─────────────────────────────────┘    │
│                                          │
│       [ Get Started → ]                  │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│     Step 1: Quick Add (3秒添加)         │
│                                          │
│  "What subscriptions do you have?"       │
│                                          │
│  ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐  │
│  │Netflix│ │Spotify│ │iCloud│ │Amazon│  │
│  │ $15.49│ │$10.99│ │$0.99 │ │Prime │  │
│  └──────┘ └──────┘ └──────┘ └──────┘  │
│  ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐  │
│  │YouTube│ │Disney│ │Hulu  │ │  +   │  │
│  │ $13.99│ │$7.99 │ │$7.99 │ │Custom│  │
│  └──────┘ └──────┘ └──────┘ └──────┘  │
│                                          │
│  点击=添加，长按=编辑金额               │
│  [Continue →] (已选3个)                  │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│     Step 2: Notification Setup          │
│                                          │
│  "We'll remind you before charges hit"   │
│                                          │
│  Remind me: 3 days before               │
│                                          │
│       [ Allow Notifications ]            │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│     Step 3: Your Dashboard              │
│                                          │
│  ┌─────────────────────────────────┐    │
│  │  Monthly Total: $47.45          │    │
│  │  Yearly Total:  $569.40         │    │
│  │  ━━━━━━━━━━━━━━━━━━━━━━━━━━    │    │
│  │  Next charge: Netflix in 3 days │    │
│  └─────────────────────────────────┘    │
│                                          │
│  "You're all set! SubKill is watching."  │
└─────────────────────────────────────────┘
```

**关键设计原则：**
- 3步完成首次设置，总耗时<30秒
- 模板库一键添加，无需手动输入
- 通知授权在用户看到价值后请求（而非首次启动）
- 立即展示总费用（给用户"被震撼"的感觉）

### 5.2 日常使用流程

```
场景A: 查看订阅总览
────────────────────
打开App → Dashboard自动展示
  ├── 月度总费用 (大字醒目)
  ├── 即将扣费列表 (按时间排序)
  ├── 试用即将到期提醒 (红色高亮)
  └── 省钱建议 ("You could save $180/year")

场景B: 添加新订阅
────────────────────
点击[+] → 选择方式:
  ├── 模板添加(3秒): 搜索服务名 → 点击 → 自动填充
  ├── 手动添加(15秒): 名称+金额+周期+下次扣费日
  └── AI扫描(5秒): 截图账单 → AI识别订阅信息

场景C: 取消订阅 (核心爽感流程!)
────────────────────
长按订阅卡片 → 弹出操作菜单:
  ├── [Kill This Subscription]
  │     → 跳转到该服务取消页面(Safari内)
  │     → 显示取消步骤引导(覆盖层)
  │     → 用户完成取消后返回
  │     → 标记为"Cancelled" → 庆祝动画
  │     → 显示"你每月省了$XX.XX"
  │
  ├── [Pause] (标记暂停，停止提醒)
  ├── [Edit] (编辑详情)
  └── [Delete] (从列表移除)

场景D: 收到扣费提醒
────────────────────
推送通知: "Netflix charging $15.49 tomorrow"
  → 点击通知 → 打开App
  → 显示该订阅详情
  → [Kill It] / [Keep It] 两个按钮
  → Kill: 跳转取消页
  → Keep: 确认保留，下次继续提醒

场景E: 月度省钱报告
────────────────────
每月1号推送: "Your SubKill Report"
  → 本月总花费 vs 上月对比
  → 已取消的订阅+省下的金额
  → 发现的涨价提醒
  → "You've saved $XXX with SubKill"
```

### 5.3 "爽感"体验设计 — 取消订阅流程详解

```
这是SubKill的核心"爽感"时刻，需要像爽文小说一样让用户感到满足：

Step 1: 发现"敌人"
┌─────────────────────────────────────┐
│  ⚠️ Trial Ending Tomorrow!          │
│                                      │
│  Adobe Creative Cloud                │
│  $54.99/month starting Jun 10       │
│                                      │
│  [Kill It]  [Keep It]               │
└─────────────────────────────────────┘

Step 2: 锁定目标
┌─────────────────────────────────────┐
│  Killing Adobe Creative Cloud        │
│                                      │
│  Step 1/3: Go to Account Settings   │
│  ┌─────────────────────────────┐   │
│  │  [Open Adobe Account →]     │   │
│  │  (Safari内打开取消页面)      │   │
│  └─────────────────────────────┘   │
│                                      │
│  Cancel instructions:                │
│  1. Click "Manage Plan"             │
│  2. Click "Cancel Plan"             │
│  3. Confirm cancellation            │
└─────────────────────────────────────┘

Step 3: 确认击杀
┌─────────────────────────────────────┐
│  ✅ Subscription Killed!             │
│                                      │
│  💰 You're saving $54.99/month      │
│     That's $659.88/year!            │
│                                      │
│  🎉🎉🎉 (庆祝动画+粒子效果)        │
│                                      │
│  Total savings with SubKill:        │
│  $XXX.XX                            │
│                                      │
│  [Share My Win]  [Done]             │
└─────────────────────────────────────┘

关键爽感要素:
1. 明确的"敌人"标识(试用即将转付费)
2. 简单的"Kill"动作(一键跳转)
3. 即时反馈(省了多少钱)
4. 庆祝动画(多巴胺奖励)
5. 累计省钱数字(成就感累积)
6. 社交分享(炫耀+传播)
```

---

## 6. 软件数据流图

### 6.1 核心数据流图

```
                    ┌─────────────┐
                    │   用户输入   │
                    └──────┬──────┘
                           │
              ┌────────────┼────────────┐
              │            │            │
              ▼            ▼            ▼
     ┌────────────┐ ┌──────────┐ ┌──────────┐
     │ 模板选择   │ │ 手动输入  │ │ AI扫描   │
     │ (预设数据) │ │ (表单)   │ │ (截图)   │
     └─────┬──────┘ └────┬─────┘ └────┬─────┘
           │             │            │
           └─────────────┼────────────┘
                         │
                         ▼
              ┌─────────────────────┐
              │  Subscription       │
              │  Validator          │
              │  ✓ 名称非空         │
              │  ✓ 金额>0           │
              │  ✓ 周期有效         │
              │  ✓ 下次日期≥今天    │
              └──────────┬──────────┘
                         │ 验证通过
                         ▼
              ┌─────────────────────┐
              │  SwiftData          │
              │  Subscription       │
              │  Entity             │
              │  (id/name/price/    │
              │   cycle/status/     │
              │   category/cancelURL│
              │   isTrial/priceHist)│
              └──────────┬──────────┘
                         │
           ┌─────────────┼─────────────┐
           │             │             │
           ▼             ▼             ▼
  ┌──────────────┐ ┌──────────┐ ┌──────────────┐
  │ 计算引擎     │ │ 提醒引擎 │ │ 同步引擎    │
  │ 月/年总费用  │ │ 扣费提醒 │ │ iCloud      │
  │ 分类占比    │ │ 试用到期 │ │ 同步        │
  │ 省钱金额    │ │ 涨价提醒 │ │             │
  └──────┬──────┘ └────┬─────┘ └──────┬───────┘
         │             │              │
         ▼             ▼              ▼
  ┌──────────────┐ ┌──────────┐ ┌──────────────┐
  │ Dashboard    │ │ 本地通知 │ │ 其他设备    │
  │ 统计图表    │ │ Widget   │ │ 同步更新    │
  │ 日历视图    │ │ Watch    │ │             │
  │ 省钱报告    │ │          │ │             │
  └──────────────┘ └──────────┘ └──────────────┘
```

### 6.2 订阅状态机（极重要 — 数据逻辑核心）

```
                    ┌───────────┐
                    │  Active   │ ◀──── 正常订阅状态
                    │  (活跃)   │
                    └─────┬─────┘
                          │
              ┌───────────┼───────────┐
              │           │           │
              ▼           ▼           ▼
     ┌────────────┐ ┌──────────┐ ┌──────────┐
     │  Trial     │ │  Paused  │ │ PriceUp  │
     │  (试用中)  │ │  (暂停)  │ │ (已涨价) │
     └─────┬──────┘ └────┬─────┘ └────┬─────┘
           │             │            │
           │ 试用到期    │ 恢复       │ 确认
           ▼             ▼            │
     ┌────────────┐      │            │
     │ Trial→Paid │      │            │
     │ (试用转付费)│     │            │
     └─────┬──────┘      │            │
           │             │            │
           └──────┬──────┘            │
                  │                   │
                  ▼                   ▼
           ┌───────────┐      ┌───────────┐
           │ Cancelled │      │ Active    │
           │ (已取消)  │      │ (新价格)  │
           └─────┬─────┘      └───────────┘
                 │
                 ▼
           ┌───────────┐
           │  Expired  │
           │ (已过期)  │
           └───────────┘

状态转换规则:
1. Active → Trial: 设置isTrial=true + trialEndDate
2. Trial → Trial→Paid: trialEndDate ≤ today → 自动提醒
3. Active → Paused: 用户主动暂停，停止提醒
4. Paused → Active: 用户恢复
5. Active → PriceUp: 检测到价格变化 → 提醒用户
6. Active → Cancelled: 用户确认取消 → 庆祝动画
7. Cancelled → Expired: 服务到期后自动标记

关键业务逻辑:
- 每次App启动时检查所有Active订阅的nextPaymentDate
- nextPaymentDate ≤ today+3 → 触发扣费提醒
- isTrial=true && trialEndDate ≤ today+1 → 触发试用到期提醒
- priceHistory最新记录与当前price不同 → 触发涨价提醒
- status=Cancelled → 从月度总计中移除，加入"省钱"累计
```

### 6.3 提醒系统数据流（极重要 — 核心价值）

```
触发源1: App启动
────────────────
App启动 → 检查所有Active订阅
  → nextPaymentDate ≤ today+3? → 调度本地通知
  → isTrial && trialEndDate ≤ today+1? → 调度试用到期通知
  → priceHistory有变化? → 调度涨价通知

触发源2: 后台刷新
────────────────
BGAppRefreshTask → 检查订阅状态 → 同上逻辑

触发源3: 用户操作
────────────────
用户添加/编辑订阅 → 重新计算提醒计划
  → 取消旧通知 → 调度新通知

通知调度逻辑:
────────────────
┌──────────────────────────────────────────────┐
│  NotificationScheduler                       │
│                                              │
│  规则:                                       │
│  1. 扣费提醒: nextPaymentDate - 3天          │
│     标题: "{name} charging ${price} in 3d"   │
│     操作: [Kill It] [Keep It]               │
│                                              │
│  2. 试用到期: trialEndDate - 1天             │
│     标题: "{name} trial ends tomorrow!"      │
│     操作: [Kill It] [Keep It]               │
│                                              │
│  3. 涨价提醒: 检测到价格变化时立即           │
│     标题: "{name} raised to ${newPrice}"     │
│     操作: [Kill It] [Review]                │
│                                              │
│  4. 异常扣费: cancelled但仍扣费              │
│     标题: "{name} charged after cancel!"     │
│     操作: [Dispute] [Ignore]                │
└──────────────────────────────────────────────┘

通知权限管理:
- 首次请求: 在用户添加第一个订阅后请求(有动机)
- 通知类别: 注册自定义操作按钮
- 通知分组: 按订阅分组，避免刷屏
```

### 6.4 费用计算引擎数据流

```
输入: [Subscription] (所有订阅列表)
输出: CostReport (费用报告)

计算规则:
─────────

1. 月度总费用:
   monthlyTotal = Σ(sub.price × cycleMultiplier)
   - weekly: × 4.33 | monthly: × 1 | quarterly: × 0.33 | yearly: × 0.083

2. 年度总费用:
   yearlyTotal = Σ(sub.price × yearMultiplier)
   - weekly: × 52 | monthly: × 12 | quarterly: × 4 | yearly: × 1

3. 分类占比:
   categoryBreakdown = groupBy(sub.category) → Σ each / monthlyTotal × 100%

4. 省钱累计:
   totalSaved = Σ(cancelledSub.monthlyPrice × monthsSinceCancel)

5. 下次扣费预测:
   upcomingCharges = filter(nextPaymentDate ≤ today+30) → sortBy(nextPaymentDate)

6. 涨价检测:
   for each sub: if priceHistory.last.newPrice ≠ price → 触发涨价提醒

输出报告结构:
─────────────
struct CostReport {
    let monthlyTotal: Double
    let yearlyTotal: Double
    let categoryBreakdown: [String: Double]
    let totalSaved: Double
    let upcomingCharges: [Subscription]
    let priceChanges: [PriceChange]
    let trialExpiring: [Subscription]
}
```

---

## 7. 核心技术实现代码示例与编写规则

### 7.1 项目结构规范

```
SubKill/
├── SubKillApp.swift                 # App入口
├── Models/
│   ├── Subscription.swift           # 订阅数据模型
│   ├── PriceChange.swift            # 价格变动记录
│   └── CostReport.swift             # 费用报告
├── ViewModels/
│   ├── SubscriptionViewModel.swift  # 订阅管理VM
│   ├── DashboardViewModel.swift     # 仪表盘VM
│   └── SettingsViewModel.swift      # 设置VM
├── Views/
│   ├── Dashboard/
│   │   ├── DashboardView.swift      # 主仪表盘
│   │   ├── UpcomingChargeCard.swift # 即将扣费卡片
│   │   └── SavingsBanner.swift      # 省钱横幅
│   ├── Subscription/
│   │   ├── AddSubscriptionView.swift    # 添加订阅
│   │   ├── SubscriptionDetailView.swift # 订阅详情
│   │   ├── TemplatePickerView.swift     # 模板选择器
│   │   └── CancelGuideView.swift        # 取消引导
│   ├── Calendar/
│   │   └── CalendarView.swift       # 扣费日历
│   ├── Stats/
│   │   └── StatsView.swift          # 统计分析
│   └── Settings/
│       └── SettingsView.swift       # 设置页
├── Services/
│   ├── NotificationManager.swift    # 通知管理
│   ├── PriceTracker.swift           # 价格追踪引擎
│   ├── CancelGuideProvider.swift    # 取消引导数据
│   └── StoreManager.swift           # StoreKit2内购
├── Widgets/
│   ├── SubKillWidget.swift          # 主屏Widget
│   └── SubKillWidgetBundle.swift    # Widget Bundle
├── Resources/
│   ├── Assets.xcassets              # 图片资源
│   └── SubscriptionTemplates.json   # 模板数据
└── Extensions/
    ├── Date+Extensions.swift        # 日期扩展
    ├── Color+Extensions.swift       # 颜色扩展
    └── Double+Currency.swift        # 货币格式化
```

### 7.2 编写规则

#### 规则1: 使用SwiftData + @Observable架构
```swift
// ✅ 正确: 使用 @Model + @Observable
@Model
final class Subscription { ... }

@Observable
final class SubscriptionViewModel { ... }

// ❌ 错误: 使用旧版 CoreData + UIKit模式
class Subscription: NSManagedObject { ... }
class SubscriptionViewModel: ObservableObject { ... }
```

#### 规则2: 隐私优先 — 所有数据100%本地存储
```swift
// ✅ 正确: SwiftData + iCloud私有数据库
@Model
final class Subscription {
    // 所有字段本地存储，iCloud仅同步用户自己的设备
    var name: String
    var price: Double
    // ...
}

// ❌ 错误: 任何网络请求传输用户数据
func uploadToServer(subscription: Subscription) { ... } // 绝对禁止
```

#### 规则3: SwiftUI声明式UI，禁止UIKit混用
```swift
// ✅ 正确: 纯SwiftUI
struct DashboardView: View {
    var body: some View {
        NavigationStack {
            List(subscriptions) { sub in
                SubscriptionRow(subscription: sub)
            }
        }
    }
}

// ❌ 错误: UIViewController包装
struct DashboardView: UIViewControllerRepresentable { ... }
```

#### 规则4: 异步操作使用async/await + Task
```swift
// ✅ 正确: 结构化并发
func loadSubscriptions() async {
    do {
        subscriptions = try await modelContext.fetch(FetchDescriptor<Subscription>())
    } catch {
        errorMessage = error.localizedDescription
    }
}

// ❌ 错误: 回调地狱
func loadSubscriptions(completion: @escaping (Result<[Subscription], Error>) -> Void) { ... }
```

#### 规则5: 通知使用UNUserNotificationCenter，禁止第三方推送
```swift
// ✅ 正确: 本地通知
let content = UNMutableNotificationContent()
content.title = "SubKill Alert"
content.body = "Netflix charges you $15.99 tomorrow!"

// ❌ 错误: Firebase/APNs远程推送
Messaging.messaging().subscribe(toTopic: "charges") // 不需要
```

### 7.3 核心数据模型代码

```swift
import SwiftData
import Foundation

// MARK: - 订阅状态枚举
enum SubscriptionStatus: String, Codable, CaseIterable {
    case active = "active"
    case trial = "trial"
    case paused = "paused"
    case cancelled = "cancelled"
    case expired = "expired"
    
    var displayName: String {
        switch self {
        case .active: return "Active"
        case .trial: return "Free Trial"
        case .paused: return "Paused"
        case .cancelled: return "Cancelled"
        case .expired: return "Expired"
        }
    }
    
    var color: String {
        switch self {
        case .active: return "green"
        case .trial: return "blue"
        case .paused: return "yellow"
        case .cancelled: return "gray"
        case .expired: return "red"
        }
    }
}

// MARK: - 计费周期枚举
enum BillingCycle: String, Codable, CaseIterable {
    case weekly = "weekly"
    case monthly = "monthly"
    case quarterly = "quarterly"
    case yearly = "yearly"
    
    var displayName: String {
        switch self {
        case .weekly: return "Weekly"
        case .monthly: return "Monthly"
        case .quarterly: return "Quarterly"
        case .yearly: return "Yearly"
        }
    }
    
    /// 转换为月度乘数
    var monthlyMultiplier: Double {
        switch self {
        case .weekly: return 4.33
        case .monthly: return 1.0
        case .quarterly: return 1.0 / 3.0
        case .yearly: return 1.0 / 12.0
        }
    }
    
    /// 转换为年度乘数
    var yearlyMultiplier: Double {
        switch self {
        case .weekly: return 52.0
        case .monthly: return 12.0
        case .quarterly: return 4.0
        case .yearly: return 1.0
        }
    }
}

// MARK: - 价格变动记录
@Model
final class PriceChange {
    @Attribute(.unique) var id: UUID
    var oldPrice: Double
    var newPrice: Double
    var changeDate: Date
    var subscription: Subscription?
    
    init(oldPrice: Double, newPrice: Double, changeDate: Date = .now) {
        self.id = UUID()
        self.oldPrice = oldPrice
        self.newPrice = newPrice
        self.changeDate = changeDate
    }
    
    var percentChange: Double {
        guard oldPrice > 0 else { return 0 }
        return ((newPrice - oldPrice) / oldPrice) * 100
    }
}

// MARK: - 订阅数据模型 (核心)
@Model
final class Subscription {
    @Attribute(.unique) var id: UUID
    var name: String
    var price: Double
    var currency: String
    var billingCycle: BillingCycle
    var nextPaymentDate: Date
    var status: SubscriptionStatus
    var category: String
    var cancelURL: String?
    var isTrial: Bool
    var trialEndDate: Date?
    var notes: String
    var createdAt: Date
    var updatedAt: Date
    var logoURL: String?
    
    // 关系: 价格变动历史
    @Relationship(deleteRule: .cascade, inverse: \PriceChange.subscription)
    var priceHistory: [PriceChange]
    
    // MARK: - 计算属性
    
    /// 月度费用
    var monthlyCost: Double {
        price * billingCycle.monthlyMultiplier
    }
    
    /// 年度费用
    var yearlyCost: Double {
        price * billingCycle.yearlyMultiplier
    }
    
    /// 试用剩余天数
    var trialDaysRemaining: Int? {
        guard isTrial, let trialEnd = trialEndDate else { return nil }
        let calendar = Calendar.current
        let days = calendar.dateComponents([.day], from: .now, to: trialEnd).day ?? 0
        return max(0, days)
    }
    
    /// 距下次扣费天数
    var daysUntilNextCharge: Int {
        let calendar = Calendar.current
        return calendar.dateComponents([.day], from: .now, to: nextPaymentDate).day ?? 0
    }
    
    /// 是否即将扣费 (3天内)
    var isChargingSoon: Bool {
        daysUntilNextCharge <= 3 && daysUntilNextCharge >= 0
    }
    
    /// 是否有涨价
    var hasPriceIncrease: Bool {
        guard let latestChange = priceHistory.sorted(by: { $0.changeDate > $1.changeDate }).first else {
            return false
        }
        return latestChange.newPrice > latestChange.oldPrice
    }
    
    // MARK: - 状态转换方法
    
    func cancel() {
        status = .cancelled
        updatedAt = .now
    }
    
    func pause() {
        guard status == .active else { return }
        status = .paused
        updatedAt = .now
    }
    
    func resume() {
        guard status == .paused else { return }
        status = .active
        updatedAt = .now
    }
    
    func updatePrice(_ newPrice: Double) {
        let change = PriceChange(oldPrice: price, newPrice: newPrice)
        priceHistory.append(change)
        price = newPrice
        updatedAt = .now
    }
    
    func convertTrialToActive() {
        guard isTrial else { return }
        isTrial = false
        status = .active
        updatedAt = .now
    }
    
    // MARK: - 初始化
    
    init(
        name: String,
        price: Double,
        currency: String = "USD",
        billingCycle: BillingCycle = .monthly,
        nextPaymentDate: Date,
        status: SubscriptionStatus = .active,
        category: String = "Other",
        cancelURL: String? = nil,
        isTrial: Bool = false,
        trialEndDate: Date? = nil,
        notes: String = "",
        logoURL: String? = nil
    ) {
        self.id = UUID()
        self.name = name
        self.price = price
        self.currency = currency
        self.billingCycle = billingCycle
        self.nextPaymentDate = nextPaymentDate
        self.status = status
        self.category = category
        self.cancelURL = cancelURL
        self.isTrial = isTrial
        self.trialEndDate = trialEndDate
        self.notes = notes
        self.createdAt = .now
        self.updatedAt = .now
        self.logoURL = logoURL
        self.priceHistory = []
    }
}
```

### 7.4 订阅模板库代码

```swift
import Foundation

// MARK: - 订阅模板
struct SubscriptionTemplate: Identifiable, Codable {
    let id: UUID
    let name: String
    let defaultPrice: Double
    let defaultCycle: BillingCycle
    let category: String
    let cancelURL: String?
    let logoName: String  // SF Symbol or asset name
    let searchTerms: [String]
    
    static let builtIn: [SubscriptionTemplate] = {
        guard let url = Bundle.main.url(forResource: "SubscriptionTemplates", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let templates = try? JSONDecoder().decode([SubscriptionTemplate].self, from: data) else {
            return []
        }
        return templates
    }()
}

// MARK: - 模板搜索器
struct TemplateSearcher {
    /// 模糊搜索模板
    static func search(query: String) -> [SubscriptionTemplate] {
        let lowered = query.lowercased()
        return SubscriptionTemplate.builtIn.filter { template in
            template.name.lowercased().contains(lowered) ||
            template.searchTerms.contains { $0.lowercased().contains(lowered) } ||
            template.category.lowercased().contains(lowered)
        }
    }
}

// SubscriptionTemplates.json 示例:
/*
 [
   {
     "id": "UUID-1",
     "name": "Netflix",
     "defaultPrice": 15.99,
     "defaultCycle": "monthly",
     "category": "Entertainment",
     "cancelURL": "https://www.netflix.com/cancelplan",
     "logoName": "netflix",
     "searchTerms": ["netflix", "streaming", "movie", "tv"]
   },
   {
     "id": "UUID-2",
     "name": "Spotify",
     "defaultPrice": 10.99,
     "defaultCycle": "monthly",
     "category": "Music",
     "cancelURL": "https://www.spotify.com/account/subscription/",
     "logoName": "spotify",
     "searchTerms": ["spotify", "music", "podcast"]
   },
   {
     "id": "UUID-3",
     "name": "iCloud+",
     "defaultPrice": 0.99,
     "defaultCycle": "monthly",
     "category": "Storage",
     "cancelURL": null,
     "logoName": "icloud",
     "searchTerms": ["icloud", "apple", "storage", "backup"]
   }
 ]
 */
```

### 7.5 仪表盘视图代码

```swift
import SwiftUI
import SwiftData

struct DashboardView: View {
    @Query(filter: #Predicate<Subscription> { $0.status != .cancelled },
           sort: \Subscription.nextPaymentDate)
    private var activeSubscriptions: [Subscription]
    
    @State private var selectedSubscription: Subscription?
    
    // 计算属性
    private var monthlyTotal: Double {
        activeSubscriptions.reduce(0) { $0 + $1.monthlyCost }
    }
    
    private var yearlyTotal: Double {
        activeSubscriptions.reduce(0) { $0 + $1.yearlyCost }
    }
    
    private var upcomingCharges: [Subscription] {
        activeSubscriptions
            .filter { $0.daysUntilNextCharge <= 7 && $0.daysUntilNextCharge >= 0 }
            .sorted { $0.nextPaymentDate < $1.nextPaymentDate }
    }
    
    private var trialExpiring: [Subscription] {
        activeSubscriptions
            .filter { $0.isTrial && ($0.trialDaysRemaining ?? 0) <= 3 }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // 1. 月度总费用卡片 (最醒目)
                    MonthlyTotalCard(
                        monthly: monthlyTotal,
                        yearly: yearlyTotal,
                        count: activeSubscriptions.count
                    )
                    
                    // 2. 即将扣费提醒 (紧急)
                    if !upcomingCharges.isEmpty {
                        UpcomingChargesSection(subscriptions: upcomingCharges)
                    }
                    
                    // 3. 试用即将到期 (紧急)
                    if !trialExpiring.isEmpty {
                        TrialExpiringSection(subscriptions: trialExpiring)
                    }
                    
                    // 4. 订阅列表
                    ActiveSubscriptionsList(
                        subscriptions: activeSubscriptions,
                        selectedSubscription: $selectedSubscription
                    )
                }
                .padding()
            }
            .navigationTitle("SubKill")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddSubscriptionView()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
            }
            .sheet(item: $selectedSubscription) { sub in
                SubscriptionDetailView(subscription: sub)
            }
        }
    }
}

// MARK: - 月度总费用卡片
struct MonthlyTotalCard: View {
    let monthly: Double
    let yearly: Double
    let count: Int
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Monthly Total")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Text(monthly, format: .currency(code: "USD"))
                .font(.system(size: 48, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
            
            HStack(spacing: 24) {
                VStack {
                    Text("Yearly")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text(yearly, format: .currency(code: "USD"))
                        .font(.headline)
                        .foregroundStyle(.white)
                }
                
                Divider()
                    .frame(height: 30)
                
                VStack {
                    Text("Active")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("\(count)")
                        .font(.headline)
                        .foregroundStyle(.white)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(
            LinearGradient(
                colors: [.red.opacity(0.8), .orange.opacity(0.6)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

// MARK: - 即将扣费区域
struct UpcomingChargesSection: View {
    let subscriptions: [Subscription]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Upcoming Charges", systemImage: "exclamationmark.circle.fill")
                .font(.headline)
                .foregroundStyle(.red)
            
            ForEach(subscriptions) { sub in
                HStack {
                    // Logo
                    Text(sub.name.prefix(1))
                        .font(.title3.bold())
                        .frame(width: 40, height: 40)
                        .background(Color.red.opacity(0.15))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(sub.name)
                            .font(.subheadline.bold())
                        Text("in \(sub.daysUntilNextCharge) days")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                    
                    Text(sub.price, format: .currency(code: sub.currency))
                        .font(.subheadline.bold())
                        .foregroundStyle(.red)
                }
                .padding(12)
                .background(Color.red.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}
```

### 7.6 通知管理器代码

```swift
import UserNotifications

@Observable
final class NotificationManager {
    static let shared = NotificationManager()
    
    private let center = UNUserNotificationCenter.current()
    
    /// 请求通知权限
    func requestAuthorization() async -> Bool {
        do {
            return try await center.requestAuthorization(options: [.alert, .badge, .sound])
        } catch {
            print("Notification auth error: \(error)")
            return false
        }
    }
    
    /// 安排扣费提醒
    func scheduleChargeReminder(for subscription: Subscription) {
        let content = UNMutableNotificationContent()
        content.title = "SubKill Alert"
        content.body = "\(subscription.name) will charge \(subscription.price, format: .currency(code: subscription.currency)) tomorrow!"
        content.sound = .default
        content.categoryIdentifier = "CHARGE_REMINDER"
        content.userInfo = ["subscriptionId": subscription.id.uuidString]
        
        // 扣费前1天提醒
        let triggerDate = Calendar.current.date(
            byAdding: .day,
            value: -1,
            to: subscription.nextPaymentDate
        ) ?? subscription.nextPaymentDate
        
        let components = Calendar.current.dateComponents(
            [.year, .month, .day, .hour],
            from: triggerDate
        )
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: "charge_\(subscription.id.uuidString)",
            content: content,
            trigger: trigger
        )
        
        center.add(request)
    }
    
    /// 安排试用到期提醒
    func scheduleTrialExpiryReminder(for subscription: Subscription) {
        guard let trialEnd = subscription.trialEndDate else { return }
        
        // 试用到期前3天提醒
        for daysBefore in [3, 1] {
            guard let reminderDate = Calendar.current.date(
                byAdding: .day, value: -daysBefore, to: trialEnd
            ) else { continue }
            
            let content = UNMutableNotificationContent()
            content.title = "Trial Ending!"
            content.body = "\(subscription.name) free trial ends in \(daysBefore) day(s). Cancel before you're charged!"
            content.sound = .default
            content.categoryIdentifier = "TRIAL_EXPIRY"
            content.userInfo = [
                "subscriptionId": subscription.id.uuidString,
                "cancelURL": subscription.cancelURL ?? ""
            ]
            
            let components = Calendar.current.dateComponents(
                [.year, .month, .day, .hour], from: reminderDate
            )
            let trigger = UNCalendarNotificationTrigger(
                dateMatching: components, repeats: false
            )
            
            let request = UNNotificationRequest(
                identifier: "trial_\(subscription.id.uuidString)_\(daysBefore)",
                content: content,
                trigger: trigger
            )
            
            center.add(request)
        }
    }
    
    /// 安排涨价提醒
    func schedulePriceChangeReminder(for subscription: Subscription, oldPrice: Double, newPrice: Double) {
        let content = UNMutableNotificationContent()
        content.title = "Price Increase!"
        let increase = newPrice - oldPrice
        content.body = "\(subscription.name) raised from \(oldPrice, format: .currency(code: "USD")) to \(newPrice, format: .currency(code: "USD")) (+\(increase, format: .currency(code: "USD"))/mo)"
        content.sound = .default
        content.categoryIdentifier = "PRICE_CHANGE"
        content.userInfo = ["subscriptionId": subscription.id.uuidString]
        
        let request = UNNotificationRequest(
            identifier: "price_\(subscription.id.uuidString)_\(Date.now.timeIntervalSince1970)",
            content: content,
            trigger: nil  // 立即发送
        )
        
        center.add(request)
    }
    
    /// 注册通知操作类别
    func registerNotificationCategories() {
        // 扣费提醒类别
        let chargeCategory = UNNotificationCategory(
            identifier: "CHARGE_REMINDER",
            actions: [
                UNNotificationAction(identifier: "VIEW", title: "View Details", options: []),
                UNNotificationAction(identifier: "CANCEL_SUB", title: "Cancel Subscription", options: [])
            ],
            intentIdentifiers: [],
            options: .customDismissAction
        )
        
        // 试用到期类别
        let trialCategory = UNNotificationCategory(
            identifier: "TRIAL_EXPIRY",
            actions: [
                UNNotificationAction(identifier: "CANCEL_NOW", title: "Cancel Now", options: [.foreground]),
                UNNotificationAction(identifier: "REMIND_LATER", title: "Remind Tomorrow", options: [])
            ],
            intentIdentifiers: [],
            options: .customDismissAction
        )
        
        // 涨价类别
        let priceCategory = UNNotificationCategory(
            identifier: "PRICE_CHANGE",
            actions: [
                UNNotificationAction(identifier: "VIEW", title: "View Details", options: []),
                UNNotificationAction(identifier: "CANCEL_SUB", title: "Cancel Subscription", options: [])
            ],
            intentIdentifiers: [],
            options: .customDismissAction
        )
        
        center.setNotificationCategories([chargeCategory, trialCategory, priceCategory])
    }
    
    /// 取消订阅的所有通知
    func cancelNotifications(for subscriptionId: UUID) {
        let prefix = subscriptionId.uuidString
        center.getPendingNotificationRequests { requests in
            let idsToRemove = requests
                .map(\.identifier)
                .filter { $0.contains(prefix) }
            self.center.removePendingNotificationRequests(withIdentifiers: idsToRemove)
        }
    }
}
```

### 7.7 StoreKit2 内购管理代码

```swift
import StoreKit

@Observable
final class StoreManager {
    static let shared = StoreManager()
    
    // 产品ID
    enum ProductID: String, CaseIterable {
        case proMonthly = "com.subkill.pro.monthly"
        case proYearly = "com.subkill.pro.yearly"
        case lifetimePurchase = "com.subkill.pro.lifetime"
    }
    
    var products: [Product] = []
    var purchasedProductIDs: Set<String> = []
    var isPro: Bool { purchasedProductIDs.contains(ProductID.proMonthly.rawValue) ||
                       purchasedProductIDs.contains(ProductID.proYearly.rawValue) ||
                       purchasedProductIDs.contains(ProductID.lifetimePurchase.rawValue) }
    
    private var transactionListener: Task<Void, Never>?
    
    init() {
        transactionListener = listenForTransactions()
    }
    
    deinit {
        transactionListener?.cancel()
    }
    
    // MARK: - 加载产品
    
    func loadProducts() async {
        do {
            let storeProducts = try await Product.products(for: ProductID.allCases.map(\.rawValue))
            products = storeProducts.sorted { $0.price < $1.price }
        } catch {
            print("Failed to load products: \(error)")
        }
    }
    
    // MARK: - 购买
    
    func purchase(_ product: Product) async -> Bool {
        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                let transaction = try checkVerified(verification)
                purchasedProductIDs.insert(transaction.productID)
                await transaction.finish()
                return true
            case .userCancelled:
                return false
            case .pending:
                return false
            @unknown default:
                return false
            }
        } catch {
            print("Purchase failed: \(error)")
            return false
        }
    }
    
    // MARK: - 恢复购买
    
    func restorePurchases() async {
        do {
            try await AppStore.sync()
        } catch {
            print("Restore failed: \(error)")
        }
    }
    
    // MARK: - 交易监听
    
    private func listenForTransactions() -> Task<Void, Never> {
        Task.detached {
            for await result in Transaction.updates {
                do {
                    let transaction = try self.checkVerified(result)
                    self.purchasedProductIDs.insert(transaction.productID)
                    await transaction.finish()
                } catch {
                    print("Transaction verification failed: \(error)")
                }
            }
        }
    }
    
    // MARK: - 验证
    
    private func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified(_, let error):
            throw error
        case .verified(let safe):
            return safe
        }
    }
    
    // MARK: - 检查购买状态
    
    func updatePurchasedProducts() async {
        for productID in ProductID.allCases {
            if let result = await Transaction.currentEntitlement(for: productID.rawValue) {
                if let transaction = try? checkVerified(result) {
                    purchasedProductIDs.insert(transaction.productID)
                }
            }
        }
    }
}
```

### 7.8 Widget代码

```swift
import WidgetKit
import SwiftUI

// MARK: - Widget时间线提供者
struct SubKillWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> SubKillWidgetEntry {
        SubKillWidgetEntry(
            date: .now,
            nextChargeName: "Netflix",
            nextChargeAmount: 15.99,
            nextChargeDays: 2,
            monthlyTotal: 89.97
        )
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SubKillWidgetEntry) -> Void) {
        completion(placeholder(in: context))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        // 从App Group共享数据读取
        let defaults = UserDefaults(suiteName: "group.com.subkill.shared")
        let entry = SubKillWidgetEntry(
            date: .now,
            nextChargeName: defaults?.string(forKey: "nextChargeName") ?? "—",
            nextChargeAmount: defaults?.double(forKey: "nextChargeAmount") ?? 0,
            nextChargeDays: defaults?.integer(forKey: "nextChargeDays") ?? 0,
            monthlyTotal: defaults?.double(forKey: "monthlyTotal") ?? 0
        )
        
        // 每小时更新
        let nextUpdate = Calendar.current.date(byAdding: .hour, value: 1, to: .now)!
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
        completion(timeline)
    }
}

struct SubKillWidgetEntry: TimelineEntry {
    let date: Date
    let nextChargeName: String
    let nextChargeAmount: Double
    let nextChargeDays: Int
    let monthlyTotal: Double
}

// MARK: - Widget视图
struct SubKillWidgetEntryView: View {
    let entry: SubKillWidgetProvider.Entry
    
    var body: some View {
        VStack(spacing: 8) {
            // 头部
            HStack {
                Image(systemName: "target")
                    .foregroundStyle(.red)
                Text("SubKill")
                    .font(.caption.bold())
                Spacer()
            }
            
            // 下次扣费
            VStack(spacing: 4) {
                Text("Next Charge")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                Text(entry.nextChargeName)
                    .font(.caption.bold())
                Text(entry.nextChargeAmount, format: .currency(code: "USD"))
                    .font(.title3.bold())
                    .foregroundStyle(.red)
                Text("in \(entry.nextChargeDays) days")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            
            Divider()
            
            // 月度总计
            HStack {
                Text("Monthly")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                Spacer()
                Text(entry.monthlyTotal, format: .currency(code: "USD"))
                    .font(.caption.bold())
            }
        }
        .padding()
    }
}

// MARK: - Widget定义
struct SubKillWidget: Widget {
    let kind: String = "SubKillWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: SubKillWidgetProvider()) { entry in
            SubKillWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("SubKill")
        .description("Track upcoming subscription charges")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

@main
struct SubKillWidgetBundle: WidgetBundle {
    var body: some Widget {
        SubKillWidget()
    }
}
```

### 7.9 二次开发参考项目集成指南

#### 从dimeApp复用模块的步骤

```
Step 1: Fork dimeApp仓库
  git clone https://github.com/rafsoh/dimeApp.git
  cd dimeApp

Step 2: 修改项目标识
  - Bundle Identifier: com.subkill.app
  - Display Name: SubKill
  - 修改 Xcode 项目设置中的 Signing & Capabilities

Step 3: 替换数据模型
  - 删除 dimeApp/Models/ 下的原有模型
  - 添加上述 Subscription.swift 数据模型
  - 更新 SwiftData Schema

Step 4: 改造 RecurringExpense → Subscription
  - 将 RecurringExpenseView 改造为 SubscriptionDetailView
  - 将 AddRecurringExpense 改造为 AddSubscriptionView + TemplatePickerView
  - 保留其循环日期计算逻辑

Step 5: 复用并改造模块
  - CategoryManagement → 直接复用，增加订阅类别
  - iCloudSync → 直接复用，确保私有数据库模式
  - BiometricAuth → 直接复用，保护订阅数据
  - Widget → 改造为扣费提醒Widget
  - Charts → 改造为订阅费用分析图表

Step 6: 新增模块
  - CancelGuideProvider.swift (取消引导数据)
  - NotificationManager.swift (通知管理)
  - PriceTracker.swift (价格追踪)
  - StoreManager.swift (StoreKit2内购)
  - SubscriptionTemplates.json (模板数据)

Step 7: UI全面重设计
  - 采用深色主题 + 红色强调色(品牌色)
  - 添加"Kill"动画效果(取消订阅时)
  - 添加省钱庆祝动画
  - 适配iOS 17+ SwiftUI新特性
```

---

## 8. 极具竞争力的价格策略

### 8.1 价格策略核心原则

```
核心原则: "绝不用订阅来管理订阅" — 这是SubKill最大的竞争优势

竞品讽刺:
- Rocket Money: $2.99-$12.99/月 订阅制 → 用订阅管理订阅，用户反感
- Bobby: $4.99/月 或 $34.99/年 → 同样讽刺
- ReSubs: $1.99/月 → 低价但仍需订阅

SubKill策略: 免费版引流 + 一次性买断Pro → 零讽刺，用户信任
```

### 8.2 免费版 (Free Forever — 引流利器)

| 功能 | 免费版 | 说明 |
|------|--------|------|
| 添加订阅数量 | **最多5个** | 覆盖80%轻度用户(平均3-5个订阅) |
| 月度/年度总费用 | ✅ | 核心功能，让用户看到"花了多少钱" |
| 扣费提醒 | ✅ 1天前提醒 | 基础提醒功能 |
| 模板库 | ✅ 全部模板 | 降低添加门槛，让用户先体验 |
| 取消引导(跳转URL) | ✅ | 核心差异化功能，免费开放引流 |
| 日历视图 | ❌ | Pro功能 |
| 价格变动追踪 | ❌ | Pro功能 |
| 试用倒计时 | ❌ | Pro功能 |
| 省钱报告 | ❌ | Pro功能 |
| Widget | ❌ | Pro功能 |
| 自定义分类 | ❌ | Pro功能 |
| 导出数据(CSV) | ❌ | Pro功能 |

**免费版设计逻辑：**
- 5个订阅额度足以让用户体验核心价值(看到总花费 + 取消订阅)
- 取消引导免费开放 → 用户取消1个订阅就省$10+/月 → 产生"爽感" → 口碑传播
- 关键Pro功能(日历、试用倒计时、价格追踪)精准切中深度用户需求 → 转化动力

### 8.3 Pro版 — 一次性买断 (核心定价)

| 项目 | 价格 | 说明 |
|------|------|------|
| **SubKill Pro (Lifetime)** | **$9.99** | 一次性买断，永久使用所有功能 |

**为什么是$9.99？**

| 分析维度 | 结论 |
|----------|------|
| **竞品对比** | Rocket Money $6-$156/年，Bobby $4.99/月。$9.99一次性 = 极致性价比 |
| **用户心理** | $9.99 < 1个月Netflix订阅。取消1个订阅就回本。零风险决策 |
| **价值锚定** | "省下第1个取消的订阅费就赚回来了" → 自带ROI证明 |
| **App Store定价** | $9.99是Tier 8，苹果抽成30%后净收入$6.99/笔 |
| **转化率预估** | 免费→Pro转化率预估8-12%(行业平均5-8%，SubKill差异化定价更高) |

**Pro版解锁所有功能：**
- ✅ 无限订阅数量
- ✅ 扣费提醒(1天/3天/7天前自定义)
- ✅ 日历视图
- ✅ 价格变动追踪 + 涨价提醒
- ✅ 试用倒计时 + 自动提醒
- ✅ 省钱报告(月度总结)
- ✅ Widget(主屏扣费提醒)
- ✅ 自定义分类
- ✅ CSV数据导出
- ✅ 生物识别锁定
- ✅ iCloud跨设备同步

### 8.4 定价策略深度分析

#### 策略A: 为什么不用"站内订阅A"模式？

```
站内订阅A: 免费下载 + 限定功能 + 一次性买断
SubKill实际采用的就是这个模式的变体:
- 免费下载 ✅
- 限定功能(5个订阅) ✅  
- 一次性买断Pro ✅

但SubKill不使用月度/年度订阅，原因:
1. 讽刺性: 用订阅管理订阅 = 用户体验崩塌
2. 信任度: 一次性买断 = "我们不是另一个吸血订阅"
3. 传播性: "一次性$9.99"比"$2.99/月"更容易口碑传播
4. 简单性: 用户决策成本极低(买/不买，没有续费焦虑)
```

#### 策略B: 为什么不用"站内订阅B"模式？

```
站内订阅B: 免费下载 + 免费功能 + 7天试用按月 + 1个月试用按年 + 买断
SubKill不采用，原因:
1. 功能复杂度不够: SubKill是工具类App，不需要持续服务端成本
2. 用户反感: 订阅管理App自己也要订阅 = 最大讽刺
3. 取消率: 工具类App月订阅取消率高达40-60%
4. LTV对比: 
   - 订阅制: $2.99/月 × 平均3个月留存 = $8.97 LTV
   - 买断制: $9.99 × 1次 = $9.99 LTV
   → 买断制LTV更高且无续费焦虑
```

#### 策略C: 未来扩展 — 如果增加AI功能

```
如果未来增加AI功能(如AI扫描邮件识别订阅):
- AI功能使用BYO API模式: 用户输入自己的OpenAI API Key
- 不增加任何服务端成本 → 仍可保持一次性买断
- 或者: AI功能单独作为"SubKill AI"附加包 $4.99一次性购买
- 绝不使用月度订阅模式
```

### 8.5 价格竞争力矩阵

| 竞品 | 免费版 | 付费版 | 年费 | SubKill优势 |
|------|--------|--------|------|------------|
| Rocket Money | 有限 | $6-$12.99/月 | $72-$156 | **$9.99一次性 vs $156/年** |
| Bobby | 无 | $4.99/月 或 $34.99/年 | $60或$35 | **$9.99一次性 vs $60/年** |
| ReSubs | 有限 | $1.99/月 | $24 | **$9.99一次性 vs $24/年** |
| Subtrack | 3个免费 | $2.99/月 或 $19.99/年 | $36或$20 | **$9.99一次性 vs $36/年** |
| **SubKill** | **5个免费** | **$9.99一次性** | **$9.99(终身)** | **极致性价比 + 零讽刺** |

### 8.6 收入模型预测

```
假设: 月下载量 5,000 (ASO优化后保守估计)
免费→Pro转化率: 10%

月收入 = 5,000 × 10% × $9.99 × 70%(苹果抽成后) = $3,496/月
年收入 = $41,955/年

增长路径:
Month 1-3:  2,000下载/月 → $1,399/月
Month 4-6:  5,000下载/月 → $3,496/月
Month 7-12: 10,000下载/月 → $6,993/月

关键增长杠杆:
1. ASO优化 → "kill subscription"独占搜索词
2. 口碑传播 → "一次性$9.99"比竞品订阅制更易传播
3. 省钱证明 → 用户取消1个订阅省$10+ → 自带ROI
4. 隐私卖点 → Reddit/社交媒体隐私讨论引流
```

### 8.7 促销策略

| 促销类型 | 时间 | 折扣 | 目的 |
|----------|------|------|------|
| 上架促销 | 前2周 | $4.99(50%off) | 获取早期用户+评价 |
| 节日促销 | 黑五/圣诞 | $6.99(30%off) | 季节性转化 |
| 评价激励 | 持续 | 评价后解锁1个Pro功能7天 | 增加评价数 |
| 推荐奖励 | 持续 | 推荐1人=延长Pro试用3天 | 口碑传播 |

---

## 9. 符合美国市场习惯的UI设计

### 9.1 设计系统

#### 色彩系统

```
主色调: 深色主题 (美国金融App主流趋势)

品牌色:
  - Primary Red:    #FF3B30  (苹果系统红 — "Kill"动作色)
  - Accent Orange:  #FF9500  (警告/即将扣费)
  - Success Green:  #34C759  (已取消/省钱)
  - Background:     #000000  (纯黑 — OLED友好)
  - Surface:        #1C1C1E  (卡片背景)
  - Surface High:   #2C2C2E  (悬浮卡片)
  - Text Primary:   #FFFFFF
  - Text Secondary: #8E8E93

语义色彩:
  - 即将扣费: Red + 脉冲动画
  - 试用到期: Orange + 倒计时
  - 已取消: Green + 庆祝动画
  - 涨价警告: Red + 上升箭头
  - 省钱累计: Green + 上升动画
```

#### 字体系统

```
SF Pro Rounded (苹果原生圆体 — 亲和力+现代感)

Display:    SF Pro Rounded, 48pt, Bold     → 月度总费用数字
Title 1:    SF Pro Rounded, 28pt, Bold     → 页面标题
Title 2:    SF Pro Rounded, 22pt, Semibold → 区块标题
Headline:   SF Pro Rounded, 17pt, Semibold → 卡片标题
Body:       SF Pro, 17pt, Regular          → 正文
Caption:    SF Pro, 12pt, Regular          → 辅助信息
Currency:   SF Mono, 48pt, Bold            → 金额数字(等宽对齐)
```

#### 间距与圆角

```
间距系统 (8pt grid):
  - xs: 4pt   (图标与文字间距)
  - sm: 8pt   (同组元素间距)
  - md: 16pt  (卡片内间距)
  - lg: 24pt  (区块间距)
  - xl: 32pt  (页面边距)

圆角系统:
  - 小组件: 8pt
  - 按钮:   12pt
  - 卡片:   16pt
  - 模态框: 20pt
  - 全屏:   0pt (edge-to-edge)
```

### 9.2 核心页面UI设计

#### 页面1: 仪表盘 (Dashboard)

```
┌─────────────────────────────────────┐
│  SubKill                    [+]     │  ← 导航栏
├─────────────────────────────────────┤
│                                     │
│  ┌─────────────────────────────┐    │
│  │     Monthly Total           │    │  ← 红色渐变卡片
│  │       $219.47               │    │     48pt粗体数字
│  │   Yearly: $2,633  Active: 8│    │     副信息
│  └─────────────────────────────┘    │
│                                     │
│  ⚠️ Upcoming Charges               │  ← 红色警告区
│  ┌─────────────────────────────┐    │
│  │ 🎬 Netflix    $15.99  2d   │    │  ← 扣费卡片
│  │ 🎵 Spotify    $10.99  5d   │    │     左Logo中名右金额+天数
│  └─────────────────────────────┘    │
│                                     │
│  🕐 Trial Expiring                 │  ← 橙色警告区
│  ┌─────────────────────────────┐    │
│  │ 📱 Hulu       Free→$7.99 1d│    │  ← 试用到期卡片
│  │  [Cancel Now]               │    │     红色CTA按钮
│  └─────────────────────────────┘    │
│                                     │
│  Active Subscriptions              │  ← 订阅列表
│  ┌─────────────────────────────┐    │
│  │ 🎬 Netflix    $15.99/mo  ● │    │  ← 绿色点=Active
│  │ 🎵 Spotify    $10.99/mo  ● │    │
│  │ ☁️ iCloud+     $0.99/mo  ● │    │
│  │ 💪 Gym        $49.99/mo  ● │    │
│  │ 📺 YouTube    $13.99/mo  ● │    │
│  └─────────────────────────────┘    │
│                                     │
│  ┌───┐ ┌───┐ ┌───┐ ┌───┐          │  ← Tab Bar
│  │🏠│ │📅│ │📊│ │⚙️│          │
│  └───┘ └───┘ └───┘ └───┘          │
└─────────────────────────────────────┘
```

#### 页面2: 添加订阅 (Add Subscription)

```
┌─────────────────────────────────────┐
│  ← Add Subscription                 │
├─────────────────────────────────────┤
│                                     │
│  🔍 Search subscriptions...         │  ← 搜索框(实时搜索模板)
│                                     │
│  Popular                            │  ← 模板网格
│  ┌──────┐ ┌──────┐ ┌──────┐       │
│  │Netflix│ │Spotify│ │iCloud│       │  ← 3列网格
│  │$15.99 │ │$10.99 │ │$0.99 │       │     Logo+名称+默认价
│  └──────┘ └──────┘ └──────┘       │
│  ┌──────┐ ┌──────┐ ┌──────┐       │
│  │YouTube│ │Gym   │ │Adobe │       │
│  │$13.99 │ │$49.99│ │$54.99│       │
│  └──────┘ └──────┘ └──────┘       │
│                                     │
│  ─── Or add manually ───           │  ← 分隔线
│                                     │
│  Name:     [________________]       │
│  Price:    [$__.__] [USD ▾]        │
│  Cycle:    [Monthly ▾]             │
│  Category: [Entertainment ▾]       │
│  Next Date:[Jun 15, 2026 ▾]       │
│  ☐ Free Trial  End: [___]         │
│  Cancel URL:[________________]     │
│                                     │
│  [     Add Subscription     ]       │  ← 红色主按钮
│                                     │
└─────────────────────────────────────┘
```

#### 页面3: 取消引导 (Cancel Guide) — "爽感"核心

```
┌─────────────────────────────────────┐
│  ← Cancel Netflix                   │
├─────────────────────────────────────┤
│                                     │
│  ┌─────────────────────────────┐    │
│  │  🎬 Netflix                  │    │
│  │  $15.99/month               │    │
│  │  You'll save $191.88/year!  │    │  ← 绿色省钱提示
│  └─────────────────────────────┘    │
│                                     │
│  Cancel Steps:                      │
│                                     │
│  ┌─ Step 1 ─────────────────────┐   │
│  │ ① Open Netflix website       │   │
│  │   [Open Netflix →]           │   │  ← 蓝色链接按钮
│  └──────────────────────────────┘   │
│                                     │
│  ┌─ Step 2 ─────────────────────┐   │
│  │ ② Click your profile icon    │   │
│  │   (top-right corner)         │   │
│  └──────────────────────────────┘   │
│                                     │
│  ┌─ Step 3 ─────────────────────┐   │
│  │ ③ Select "Account"           │   │
│  └──────────────────────────────┘   │
│                                     │
│  ┌─ Step 4 ─────────────────────┐   │
│  │ ④ Click "Cancel Membership"  │   │
│  └──────────────────────────────┘   │
│                                     │
│  ┌─────────────────────────────┐    │
│  │  [✅ I've Cancelled]         │    │  ← 大绿色确认按钮
│  └─────────────────────────────┘    │
│                                     │
└─────────────────────────────────────┘

点击"✅ I've Cancelled"后的动画:
─────────────────────────────────────
  1. 订阅卡片爆炸动画 (💥)
  2. 红色→绿色渐变
  3. 省钱金额飞入Dashboard
  4. 庆祝粒子效果 (🎉)
  5. 显示: "You just saved $191.88/year! 🎯"
```

#### 页面4: 统计分析 (Stats)

```
┌─────────────────────────────────────┐
│  ← Stats                            │
├─────────────────────────────────────┤
│                                     │
│  💰 Total Saved                     │
│  ┌─────────────────────────────┐    │
│  │      $347.76                │    │  ← 绿色大数字
│  │    saved this year          │    │     累计省钱
│  └─────────────────────────────┘    │
│                                     │
│  📊 Monthly Breakdown               │
│  ┌─────────────────────────────┐    │
│  │  Entertainment ████████ $42 │    │  ← 水平条形图
│  │  Music        ████     $22 │    │     按分类
│  │  Storage      ██       $5  │    │
│  │  Fitness      ██████████ $50│    │
│  │  Productivity ████     $22 │    │
│  └─────────────────────────────┘    │
│                                     │
│  📈 Spending Trend                  │
│  ┌─────────────────────────────┐    │
│  │     ╱╲                      │    │  ← 折线图
│  │    ╱  ╲   ╱╲               │    │     6个月趋势
│  │   ╱    ╲╱  ╲              │    │
│  │  ╱          ╲             │    │
│  │ Jan Feb Mar Apr May Jun    │    │
│  └─────────────────────────────┘    │
│                                     │
│  🏷️ Price Changes                   │
│  ┌─────────────────────────────┐    │
│  │ Netflix  $15.99→$17.99 ↑13%│    │  ← 涨价提醒
│  │ Spotify  $9.99→$10.99 ↑10% │    │
│  └─────────────────────────────┘    │
│                                     │
└─────────────────────────────────────┘
```

### 9.3 动画与交互设计

#### "Kill"取消动画 — 核心爽感体验

```swift
// 取消订阅时的动画序列
struct CancelCelebrationView: View {
    @State private var isKilled = false
    @State private var showSavings = false
    @State private var particles = [Particle]()
    
    let savedAmount: Double
    
    var body: some View {
        ZStack {
            // 1. 爆炸粒子效果
            ForEach(particles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: particle.size, height: particle.size)
                    .position(particle.position)
                    .opacity(particle.opacity)
            }
            
            // 2. 省钱金额动画
            if showSavings {
                VStack(spacing: 8) {
                    Image(systemName: "target")
                        .font(.system(size: 60))
                        .foregroundStyle(.red)
                    
                    Text("KILLED!")
                        .font(.system(size: 36, weight: .black, design: .rounded))
                        .foregroundStyle(.red)
                    
                    Text("You saved \(savedAmount, format: .currency(code: "USD"))/year")
                        .font(.title2.bold())
                        .foregroundStyle(.green)
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
        .onAppear {
            // 动画序列
            withAnimation(.spring(duration: 0.3)) {
                isKilled = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                // 生成庆祝粒子
                for _ in 0..<30 {
                    particles.append(Particle.random())
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring(duration: 0.5)) {
                    showSavings = true
                }
            }
        }
    }
}

struct Particle: Identifiable {
    let id = UUID()
    let color: Color
    let size: CGFloat
    let position: CGPoint
    let opacity: Double
    
    static func random() -> Particle {
        Particle(
            color: [.red, .orange, .green, .yellow].randomElement()!,
            size: CGFloat.random(in: 4...12),
            position: CGPoint(
                x: CGFloat.random(in: 50...350),
                y: CGFloat.random(in: 100...600)
            ),
            opacity: Double.random(in: 0.5...1.0)
        )
    }
}
```

#### 手势交互

| 交互 | 手势 | 效果 |
|------|------|------|
| 删除订阅 | 左滑 → 红色"Kill"按钮 | 爆炸动画+省钱统计 |
| 暂停订阅 | 左滑 → 黄色"Pause"按钮 | 订阅变灰+暂停动画 |
| 查看详情 | 右滑 → 蓝色"Details"按钮 | 展开详情卡片 |
| 标记已取消 | 点击"✅ I've Cancelled" | 庆祝动画+省钱飞入 |
| 添加订阅 | 下拉 → 搜索框自动聚焦 | 模板搜索+快速添加 |

### 9.4 无障碍设计

```swift
// VoiceOver支持
struct SubscriptionRow: View {
    let subscription: Subscription
    
    var body: some View {
        HStack {
            // ... UI elements
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(subscription.name), \(subscription.price, format: .currency(code: subscription.currency)) per \(subscription.billingCycle.displayName), next charge in \(subscription.daysUntilNextCharge) days")
        .accessibilityHint("Swipe right for cancel options")
        .accessibilityAddTraits(.isButton)
    }
}

// 动态字体支持
Text(monthlyTotal, format: .currency(code: "USD"))
    .font(.system(size: 48, weight: .bold, design: .rounded))
    .dynamicTypeSize(.large ... .xxxLarge)

// 减少动画支持
@Environment(\.accessibilityReduceMotion) var reduceMotion

if reduceMotion {
    // 简化动画，仅使用opacity变化
} else {
    // 完整庆祝动画
}
```

### 9.5 App Store截图设计

```
截图1 (6.7" iPhone 15 Pro Max):
─────────────────────────────────
  深色背景
  
  "Kill Subscriptions."
  48pt白色粗体
  
  Dashboard截图
  月度总费用$219.47突出显示
  
  底部: "Privacy-first. No bank login."

截图2:
─────────────────────────────────
  "Never Forget a Trial."
  
  试用到期提醒截图
  "Hulu Free→$7.99 in 1 day"
  红色警告+Cancel Now按钮
  
  底部: "Auto-remind before you're charged."

截图3:
─────────────────────────────────
  "One-Tap Cancel."
  
  取消引导截图
  Step-by-step引导+Open链接
  
  底部: "Step-by-step cancel guides."

截图4:
─────────────────────────────────
  "Track Every Dollar."
  
  统计分析截图
  分类条形图+省钱总额
  
  底部: "See where your money goes."

截图5:
─────────────────────────────────
  "$9.99 Once. Not $156/Year."
  
  价格对比图
  SubKill $9.99 vs Rocket Money $156/yr
  
  底部: "One-time purchase. No subscription irony."
```

---

## 附录A: 开发检查清单

| 阶段 | 任务 | 状态 |
|------|------|------|
| Phase 0 | Fork dimeApp + 修改BundleID | ☐ |
| Phase 0 | 配置Xcode签名+Capabilities | ☐ |
| Phase 1 | 创建Subscription数据模型 | ☐ |
| Phase 1 | 配置SwiftData+iCloud | ☐ |
| Phase 1 | 编写数据迁移脚本 | ☐ |
| Phase 2 | 实现模板库+搜索 | ☐ |
| Phase 2 | 实现添加订阅UI | ☐ |
| Phase 2 | 实现通知管理器 | ☐ |
| Phase 2 | 实现取消引导 | ☐ |
| Phase 2 | 实现费用统计 | ☐ |
| Phase 2 | 实现日历视图 | ☐ |
| Phase 2 | 实现Widget | ☐ |
| Phase 3 | 实现价格追踪 | ☐ |
| Phase 3 | 实现试用倒计时 | ☐ |
| Phase 3 | 实现省钱报告 | ☐ |
| Phase 4 | 深色模式适配 | ☐ |
| Phase 4 | 取消庆祝动画 | ☐ |
| Phase 4 | VoiceOver无障碍 | ☐ |
| Phase 5 | StoreKit2内购集成 | ☐ |
| Phase 5 | TestFlight Beta | ☐ |
| Phase 5 | ASO截图+描述 | ☐ |
| Phase 5 | 提交App Store审核 | ☐ |

## 附录B: 关键第三方依赖

| 依赖 | 用途 | 版本 |
|------|------|------|
| SwiftData | 本地数据持久化 | iOS 17+ |
| WidgetKit | 主屏Widget | iOS 17+ |
| StoreKit2 | 内购/买断 | iOS 17+ |
| UserNotifications | 本地通知 | iOS 17+ |
| CloudKit (via SwiftData) | iCloud同步 | iOS 17+ |
| LocalAuthentication | 生物识别 | iOS 17+ |

**注意: SubKill不依赖任何第三方CocoaPods/SPM包，100%使用Apple原生框架。**
这确保了: 最小App体积、最快启动速度、最少崩溃风险、最长兼容性保障。

## 附录C: ASO关键词优化

```
App Name:    SubKill
Subtitle:    Kill Subscriptions, Keep Money
关键词字段(100字符): subscription,tracker,cancel,bills,recurring,expenses,reminder,money,saver,budget

描述(前170字符 — 折叠前可见):
SubKill helps you track and cancel unwanted subscriptions. See your total monthly costs, get charge reminders, and kill subscriptions you don't need — all without your bank password. Privacy-first, one-time purchase.

完整描述关键词密度:
- "subscription" × 8
- "cancel" × 6
- "track" × 4
- "money" × 5
- "privacy" × 3
- "reminder" × 4
- "free trial" × 3
```

---

> **文档结束** | SubKill — Kill Subscriptions, Keep Money
> 任何LLM可根据本文档复刻出完整的、极具竞争优势的iOS订阅管理App
