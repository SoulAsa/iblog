/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/11/16 20:40:11                          */
/*==============================================================*/


drop table if exists Association_1;

drop table if exists admin;

drop table if exists article;

drop table if exists article_tag;

drop table if exists category;

drop table if exists comment;

drop table if exists link;

drop table if exists message;

drop table if exists saying;

drop table if exists tag;

/*==============================================================*/
/* Table: Association_1                                         */
/*==============================================================*/
create table Association_1
(
   comment_id           varchar(32) not null,
   com_comment_id       varchar(32) not null,
   primary key (comment_id, com_comment_id)
);

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   admin                varchar(30) not null,
   pwd                  varchar(30) not null,
   name                 varchar(20),
   iconHead             varchar(200),
   birthday             date,
   hometown             varchar(1024),
   work                 varchar(50),
   signature            varchar(1024),
   anime                varchar(300),
   music                varchar(300),
   about                text,
   attach               varchar(200),
   phone                varchar(11),
   city                 varchar(1024),
   skill                varchar(300),
   primary key (admin, pwd)
);

/*==============================================================*/
/* Table: article                                               */
/*==============================================================*/
create table article
(
   art_id               int not null auto_increment,
   cate_id              int not null,
   title                varchar(100) not null,
   content              text,
   iconCover            varchar(200),
   createTime           date not null,
   modifyTime           date,
   keyword              varchar(100),
   readCount            int,
   isFlag               bool not null,
   primary key (art_id)
);

/*==============================================================*/
/* Table: article_tag                                           */
/*==============================================================*/
create table article_tag
(
   art_id               int not null,
   tag_id               int not null,
   primary key (art_id, tag_id)
);

/*==============================================================*/
/* Table: category                                              */
/*==============================================================*/
create table category
(
   cate_id              int not null auto_increment,
   cate_name            varchar(50) not null,
   primary key (cate_id)
);

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   comment_id           varchar(32) not null,
   art_id               int not null,
   com_comment_id       varchar(32),
   userName             varchar(50) not null,
   email                varchar(100) not null,
   content              text not null,
   commentTime          date,
   primary key (comment_id)
);

/*==============================================================*/
/* Table: link                                                  */
/*==============================================================*/
create table link
(
   link_id              int not null auto_increment,
   link_name            varchar(100) not null,
   url                  varchar(100),
   iconLink             varchar(200),
   primary key (link_id)
);

/*==============================================================*/
/* Table: message                                               */
/*==============================================================*/
create table message
(
   message_id           varchar(32) not null,
   mes_message_id       varchar(32),
   userName             varchar(50) not null,
   email                varchar(100) not null,
   content              text not null,
   messageTime          date,
   primary key (message_id)
);

/*==============================================================*/
/* Table: saying                                                */
/*==============================================================*/
create table saying
(
   say_id               int not null auto_increment,
   content              text not null,
   createTime           date,
   primary key (say_id)
);

/*==============================================================*/
/* Table: tag                                                   */
/*==============================================================*/
create table tag
(
   tag_id               int not null auto_increment,
   tag_name             varchar(50) not null,
   primary key (tag_id)
);

alter table Association_1 add constraint FK_Association_1 foreign key (comment_id)
      references comment (comment_id) on delete restrict on update restrict;

alter table Association_1 add constraint FK_Association_2 foreign key (com_comment_id)
      references comment (comment_id) on delete restrict on update restrict;

alter table article add constraint FK_category_article foreign key (cate_id)
      references category (cate_id) on delete restrict on update restrict;

alter table article_tag add constraint FK_have foreign key (tag_id)
      references tag (tag_id) on delete restrict on update restrict;

alter table article_tag add constraint FK_own foreign key (art_id)
      references article (art_id) on delete restrict on update restrict;

alter table comment add constraint FK_article_comment foreign key (art_id)
      references article (art_id) on delete restrict on update restrict;

alter table comment add constraint FK_comment_comment foreign key (com_comment_id)
      references comment (comment_id) on delete restrict on update restrict;

alter table message add constraint FK_message_message foreign key (mes_message_id)
      references message (message_id) on delete restrict on update restrict;

