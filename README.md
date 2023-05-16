# YouLi商城后台管理平台

#### 介绍
YouLi商城的后端
重构技术栈：express、prisma
#### 软件架构

#### 安装教程

1.  拉取代码: git clone https://gitee.com/zirk/you-li-new-node.git
2.  安装依赖包: npm install 
3.  修改连接数据库配置 prisma/schema.prisma文件中:
    ```
    datasource db {
        provider = "mysql"
        url      = "mysql://root:123456@localhost:3306/shop_mall" //[连接的数据库类型]://[用户]:[密码]@[地址]:[端口]/[数据库名称]
    }
4.  生成prisma连接: npx prisma generate <br>
    更多prisma命令配置数据库请看官方文档：https://prisma.yoga/reference/api-reference/command-reference
5.  运行项目: npm start

#### 使用说明

1.  xxxx
2.  xxxx
3.  xxxx

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


#### 特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2.  Gitee 官方博客 [blog.gitee.com](https://blog.gitee.com)
3.  你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解 Gitee 上的优秀开源项目
4.  [GVP](https://gitee.com/gvp) 全称是 Gitee 最有价值开源项目，是综合评定出的优秀开源项目
5.  Gitee 官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6.  Gitee 封面人物是一档用来展示 Gitee 会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
