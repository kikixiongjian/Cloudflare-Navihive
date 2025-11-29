-- 添加测试分组
INSERT INTO groups (name, order_num, is_public) VALUES
('开发工具', 1, 1),
('社交媒体', 2, 1),
('搜索引擎', 3, 1),
('私密资源', 4, 0);

-- 添加测试站点 - 开发工具分组
INSERT INTO sites (group_id, name, url, icon, description, notes, order_num, is_public) VALUES
(1, 'GitHub', 'https://github.com', 'https://github.githubassets.com/favicons/favicon.svg', '全球最大的代码托管平台', '', 1, 1),
(1, 'Stack Overflow', 'stackoverflow.com', 'https://cdn.sstatic.net/Sites/stackoverflow/Img/favicon.ico', '开发者问答社区', '', 2, 1),
(1, 'MDN Web Docs', 'developer.mozilla.org', 'https://developer.mozilla.org/favicon-48x48.cbbd161b.png', 'Web开发权威文档', '', 3, 1);

-- 添加测试站点 - 社交媒体分组
INSERT INTO sites (group_id, name, url, icon, description, notes, order_num, is_public) VALUES
(2, 'Twitter', 'https://twitter.com', 'https://abs.twimg.com/favicons/twitter.3.ico', '社交媒体平台', '', 1, 1),
(2, 'Reddit', 'reddit.com', 'https://www.redditstatic.com/desktop2x/img/favicon/favicon-32x32.png', '全球最大的论坛社区', '', 2, 1);

-- 添加测试站点 - 搜索引擎分组
INSERT INTO sites (group_id, name, url, icon, description, notes, order_num, is_public) VALUES
(3, 'Google', 'google.com', 'https://www.google.com/favicon.ico', '全球最大搜索引擎', '', 1, 1),
(3, 'Bing', 'bing.com', 'https://www.bing.com/favicon.ico', '微软搜索引擎', '', 2, 1);

-- 添加测试站点 - 私密资源分组（仅管理员可见）
INSERT INTO sites (group_id, name, url, icon, description, notes, order_num, is_public) VALUES
(4, '内部文档', 'docs.internal.com', '', '公司内部文档系统', '仅限内部访问', 1, 0),
(4, '管理后台', 'admin.internal.com', '', '系统管理后台', '管理员专用', 2, 0);

-- 添加配置数据
INSERT INTO configs (key, value) VALUES
('SITE_TITLE', 'NaviHive 测试站'),
('SITE_NAME', '导航测试'),
('CUSTOM_CSS', '/* 自定义样式 */
body {
  /* 可以在这里添加自定义CSS */
}');



https://youtu.be/-stmZB_Zj2Q

主要的链接地址：

https://github.com/zqq-nuli/Cloudflare-Navihive

https://bcrypt-generator.com/  哈希值粘贴到   AUTH_PASSWORD

https://bcrypt.online/
32位随机字符串   AUTH_SECRET


-- 创建分组表
CREATE TABLE IF NOT EXISTS groups (

id INTEGER PRIMARY KEY AUTOINCREMENT,

name TEXT NOT NULL,

order_num INTEGER NOT NULL,

is_public INTEGER DEFAULT 1,

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 创建站点表
CREATE TABLE IF NOT EXISTS sites (

id INTEGER PRIMARY KEY AUTOINCREMENT,

group_id INTEGER NOT NULL,

name TEXT NOT NULL,

url TEXT NOT NULL,

icon TEXT,

description TEXT,

notes TEXT,

order_num INTEGER NOT NULL,

is_public INTEGER DEFAULT 1,

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE
);

-- 创建配置表
CREATE TABLE IF NOT EXISTS configs (

key TEXT PRIMARY KEY,

value TEXT NOT NULL,

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 标记数据库已初始化
INSERT INTO configs (key, value) VALUES ('DB_INITIALIZED', 'true');

-- 创建只读模式所需索引
CREATE INDEX IF NOT EXISTS idx_groups_is_public ON groups(is_public);
CREATE INDEX IF NOT EXISTS idx_sites_is_public ON sites(is_public);


