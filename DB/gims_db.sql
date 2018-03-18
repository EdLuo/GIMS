/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/3/17 22:44:26                           */
/*==============================================================*/


drop table if exists T_companyinfo;

drop table if exists T_intentinfo;

drop table if exists T_logininfo;

drop table if exists T_news;

drop table if exists T_recruitinfo;

drop table if exists T_resourceinfo;

drop table if exists T_selfintent;

drop table if exists T_stuinfo;

drop table if exists T_user;

/*==============================================================*/
/* Table: T_companyinfo                                         */
/*==============================================================*/
create table T_companyinfo
(
   CompId               int not null auto_increment,
   CompName             varchar[50] comment '企业名称',
   CompIntro            varchar[50] comment '企业简介',
   CompPofit            varchar[50] comment '企业资本',
   CompManager          varchar[50] comment '企业负责人',
   CompAddress          varchar[50] comment '企业地址',
   CompContact          varchar[50] comment '联系方式',
   CompMail             varchar(50) comment '邮箱',
   primary key (CompId)
);

alter table T_companyinfo comment '企业信息表';

/*==============================================================*/
/* Table: T_intentinfo                                          */
/*==============================================================*/
create table T_intentinfo
(
   IntentId             int not null auto_increment,
   IntentName           varchar[50] comment '意向名',
   Comment              varchar[50] comment '备注',
   primary key (IntentId)
);

/*==============================================================*/
/* Table: T_logininfo                                           */
/*==============================================================*/
create table T_logininfo
(
   LoginId              int not null auto_increment,
   UId                  int comment '账号ID',
   LoginTime            datetime comment '登录时间',
   LoginIp              varchar(30) comment '登录IP',
   Operation            varchar[50] comment '操作类型',
   primary key (LoginId)
);

/*==============================================================*/
/* Table: T_news                                                */
/*==============================================================*/
create table T_news
(
   NewsId               int not null auto_increment,
   UId                  int,
   NewsTitle            varchar(50) comment '标题',
   PolishTime           datetime comment '发布时间',
   NewsContent          text comment '内容',
   primary key (NewsId)
);

alter table T_news comment '新闻表';

/*==============================================================*/
/* Table: T_recruitinfo                                         */
/*==============================================================*/
create table T_recruitinfo
(
   RecruitId            int not null auto_increment,
   CompId               int,
   RecruitPosition      varchar[50] comment '岗位名称',
   RecruitDemand        varchar[50] comment '岗位需求',
   RecruitDuty          varchar[50] comment '岗位职责',
   RecruitNumber        varchar[4] comment '需求人数',
   WorkLocation         varchar[50] comment '工作地点',
   RecruitTime          datetime comment '招聘时间',
   RecrutiManage        varchar[50] comment '招聘负责人',
   RecruitContact       varchar[50] comment '联系方式',
   primary key (RecruitId)
);

alter table T_recruitinfo comment '招聘信息';

/*==============================================================*/
/* Table: T_resourceinfo                                        */
/*==============================================================*/
create table T_resourceinfo
(
   ResourceId           int not null auto_increment,
   NewsId               int,
   ResourceName         varchar[50] comment '资源名称',
   ResourcePath         varchar[100] comment '资源路径',
   primary key (ResourceId)
);

/*==============================================================*/
/* Table: T_selfintent                                          */
/*==============================================================*/
create table T_selfintent
(
   SelfId               int not null auto_increment,
   IntentId             int,
   StuId                int,
   CreatedTime          datetime comment '创建时间',
   primary key (SelfId)
);

alter table T_selfintent comment '个人意向表';

/*==============================================================*/
/* Table: T_stuinfo                                             */
/*==============================================================*/
create table T_stuinfo
(
   StuId                int not null auto_increment,
   StuName              varchar(50) comment '学生姓名',
   StuSex               varchar(4) comment '学生性别',
   StuAge               varchar(10) comment '学生性别',
   StuBirth             varchar[30] comment '出生日期',
   StuOrigin            varchar[50] comment '籍贯',
   StuMajor             varchar[30] comment '专业',
   StuClass             varchar[30] comment '班级',
   StuNumber            varchar(30) comment '学号',
   StuQualifie          varchar[30] comment '学历',
   StuType              varchar(4) comment '学习形式',
   StuAddress           varchar(50) comment '家庭地址',
   StuContact           varchar[30] comment '联系电话',
   StuMail              varchar[50] comment '邮箱',
   StuPost              varchar[30] comment '邮编',
   StuIdNumber          varchar[50] comment '身份证号码',
   StuEnterTime         varchar[50] comment '入学时间',
   StuEndTime           varchar[50] comment '毕业时间',
   StuEthnic            varchar[30] comment '民族',
   StuPolitic           varchar(30) comment '政治面貌',
   StuRegion            varchar[30] comment '宗教信仰',
   StuSchooling         varchar[4] comment '学制',
   primary key (StuId)
);

alter table T_stuinfo comment '学生信息表';

/*==============================================================*/
/* Table: T_user                                                */
/*==============================================================*/
create table T_user
(
   UId                  int not null auto_increment,
   StuId                int comment '当用户类型为学生时有效',
   CompId               int,
   AccountId            varchar[50] comment '账号',
   Password             varchar[50] comment '密码',
   Type                 int comment '用户类型(1： 管理员 2：学生 3：企业)',
   Created_Time         datetime comment '创建时间',
   primary key (UId)
);

alter table T_user comment '用户信息表';

alter table T_logininfo add constraint FK_Reference_2 foreign key (UId)
      references T_user (UId) on delete restrict on update restrict;

alter table T_news add constraint FK_Reference_7 foreign key (UId)
      references T_user (UId) on delete restrict on update restrict;

alter table T_recruitinfo add constraint FK_Reference_6 foreign key (CompId)
      references T_companyinfo (CompId) on delete restrict on update restrict;

alter table T_resourceinfo add constraint FK_Reference_8 foreign key (NewsId)
      references T_news (NewsId) on delete restrict on update restrict;

alter table T_selfintent add constraint FK_Reference_3 foreign key (IntentId)
      references T_intentinfo (IntentId) on delete restrict on update restrict;

alter table T_selfintent add constraint FK_Reference_4 foreign key (StuId)
      references T_stuinfo (StuId) on delete restrict on update restrict;

alter table T_user add constraint FK_Reference_1 foreign key (StuId)
      references T_stuinfo (StuId) on delete restrict on update restrict;

alter table T_user add constraint FK_Reference_5 foreign key (CompId)
      references T_companyinfo (CompId) on delete restrict on update restrict;

