# WebApp Building Skill

用于 Kimi Agent 构建现代化 React Web 应用的 Skill 系统。

## 文件结构

```
webapp-building/
├── SKILL.md              # Agent 行为定义（核心）
├── scripts/              # 可执行脚本
│   ├── init-webapp.sh    # 初始化项目
│   ├── add-section.sh    # 添加页面区块
│   ├── add-component.sh  # 添加 UI 组件
│   ├── build.sh          # 构建项目
│   └── preview.sh        # 预览项目
├── templates/            # 代码模板
│   ├── default/          # 默认项目模板
│   └── components/       # UI 组件模板
└── config/               # 配置文件
    └── components.json   # 组件清单
```

## 工作流程

1. **初始化**: `init-webapp.sh "项目名称"`
2. **开发**: 
   - `add-section.sh "Hero"` 添加页面区块
   - `add-component.sh "button"` 添加 UI 组件
3. **构建**: `build.sh`
4. **预览**: `preview.sh`

## 技术栈

- React 18 + TypeScript
- Vite 5.x
- Tailwind CSS 3.4.19
- shadcn/ui 组件库
- Lucide React 图标

## 使用示例

当用户说**"创建一个家庭相册网站"**时，Agent 会执行：

```bash
# 1. 初始化
bash /app/.kimi/skills/webapp-building/scripts/init-webapp.sh "家庭相册"

# 2. 添加页面区块
bash /app/.kimi/skills/webapp-building/scripts/add-section.sh "Hero"
bash /app/.kimi/skills/webapp-building/scripts/add-section.sh "Gallery"
bash /app/.kimi/skills/webapp-building/scripts/add-section.sh "Upload"
bash /app/.kimi/skills/webapp-building/scripts/add-section.sh "Footer"

# 3. 添加需要的组件
bash /app/.kimi/skills/webapp-building/scripts/add-component.sh "button"
bash /app/.kimi/skills/webapp-building/scripts/add-component.sh "card"
bash /app/.kimi/skills/webapp-building/scripts/add-component.sh "dialog"

# 4. 构建
bash /app/.kimi/skills/webapp-building/scripts/build.sh

# 5. 预览
bash /app/.kimi/skills/webapp-building/scripts/preview.sh