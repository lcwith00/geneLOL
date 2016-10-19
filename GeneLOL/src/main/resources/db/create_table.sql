create table usertable(
  userid number primary key,
  username varchar2(100) not null unique,
  usermail varchar2(500) not null unique,
  iscertificate varchar2(10) default 'false' not null,
  userpassword varchar2(20) not null,
  usertype varchar2(10) default 'member' not null,
  joindate date default sysdate not null
);
create sequence userid_seq
increment by 1
start with 1;

create table boardtable(
  board_id varchar2(10) not null,
  board_no number primary key,
  userid number,
  board_title varchar2(1000) not null,
  board_content clob not null,
  board_file varchar2(500),
  board_count number default 0 not null,
  board_recomm number default 0 not null,
  board_date date default sysdate not null,
  constraint "userid" foreign key (userid)
  references usertable(userid)  
);
create sequence board_no_seq
increment by 1
start with 1;

create table commenttable(
  board_no number,
  comment_no number primary key,
  comment_listno number not null,
  comment_depth number not null,
  comment_parent number not null,
  userid number,
  comment_content clob not null,
  comment_file varchar2(500),
  comment_recomm number default 0 not null,
  comment_date date default sysdate not null,
  constraint "board_no" foreign key (board_no)
  references boardtable(board_no),
  constraint "userid" foreign key (userid)
  references usertable(userid)
);
create sequence comment_no_seq
increment by 1
start with 1;