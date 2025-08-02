# Work Design

[Work Design 官网](https://work.design) 源码，基于[业务组件](https://github.com/work-design/engine)快速开发。

[Work Design 官网](https://work.design) 是服务于 Work Design 生态的应用，也是业务组件化开发的示例项目。

## 特性
* 所有功能作为 SaaS 服务开放，注册即可使用；
* 可独立部署以及二次开发；

## 主要功能
* 组织管理、OA(办公管理)
* 财务管理
* ERP 供应链管理
* 电商（门店、在线商城、租用、团购）
* CMS 内容管理，基于 Markdown 本地文件
* 通用：权限管理、
* 微信生态

## 技术栈
Rails 原教旨主义，善用 Rails Engine，尽可能减少依赖。不仅如此，通过对 Rails 框架的扩展和规范使用，代码量远低于常规 Rails 项目。

* 全栈 MVC 框架：[Ruby On Rails](https://github.com/rails/rails)
* Hotwire：直接传输 HTML 片段
  * [Turbo](https://turbo.hotwired.dev)
  * [Stimulus](https://stimulus.hotwired.dev)

* 前端 CSS：纯 CSS 库，需要的 javascript 采用 stimulus 在 [RailsDesign](https://github.com/work-design/rails_design) 项目中实现；
  * [Bulma](https://github.com/jgthms/bulma)

* 数据库
  * [Postgresql](https://www.postgresql.org)：关系型数据库

## 准备
* 安装依赖
  * `bundle install`
  * `npm install`
* 检查配置文件
  * `bin/rails credentials:edit`: 修改 db_development, db_test 为你本地数据库
* 数据库准备
  * 修改数据库，数据库格式：postgres://username:password@host:port/database
  * `bin/rails db:create`
  * `bin/rails db:schema:load`，因为 migrations 是自动生成的，不太完备，用这个命令准备数据库；
  
## 开发
* `bin/dev`
* `bin/rails s`

## 依赖及配置


## 项目发展

#### 资金

* 捐赠：如果你觉得这套系统对您有效，欢迎捐赠;
* 付费： 我们提供付费服务，包括付费咨询，付费安装。

#### 参与

我们鼓励任何人以任何形式参与到本项目的发展当中，包括：
* 成为我们的用户；
* 成为我们的全职职员、兼职职员或者志愿者；
* 投资、捐赠；
* 基于本项目开发自己的项目；

我们也鼓励任何个体在遵从部分限制条件的前提下（需在显眼位置添加基于本项目的说明，具体参见[LICENSE](LICENSE)）基于本项目衍生发展自己的项目。

#### 参与项目开发
* 参见[work.design](https://work.design)

## 其他
* [Work Design 项目说明](https://github.com/work-design/home)
