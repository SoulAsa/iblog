/**
 * Author : SoulAsa
 * Date : 2016-11-24
 * Desc : 修改字段类型date  -->  为datetime
 */
DROP TABLE IF EXISTS saying;

/*==============================================================*/
/* Table: saying                                                */
/*==============================================================*/
CREATE TABLE saying
(
   say_id               INT NOT NULL AUTO_INCREMENT,
   content              TEXT NOT NULL,
   createTime           DATETIME,
   PRIMARY KEY (say_id)
);


DROP TABLE IF EXISTS message;

/*==============================================================*/
/* Table: message                                               */
/*==============================================================*/
CREATE TABLE message
(
   message_id           VARCHAR(32) NOT NULL,
   mes_message_id       VARCHAR(32),
   userName             VARCHAR(50) NOT NULL,
   email                VARCHAR(100) NOT NULL,
   content              TEXT NOT NULL,
   messageTime          DATETIME,
   PRIMARY KEY (message_id)
);

ALTER TABLE message ADD CONSTRAINT FK_message_message FOREIGN KEY (mes_message_id)
      REFERENCES message (message_id) ON DELETE RESTRICT ON UPDATE RESTRICT;



/*==============================================================*/
/* Table: article                                               */
/* 修改createTime、modifyTime字段类型为datetime                  */
/*==============================================================*/
ALTER TABLE article MODIFY createTime DATETIME;
ALTER TABLE article MODIFY modifyTime DATETIME;


/*==============================================================*/
/* Table: comment                                               */
/* 修改commentTime字段类型为datetime                 		*/
/*==============================================================*/
ALTER TABLE COMMENT MODIFY commentTime DATETIME;