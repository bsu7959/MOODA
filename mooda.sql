create database mooda;

use mooda;

create table tb_member(
   m_idx bigint auto_increment primary key,
    m_userid varchar(20) unique not null,
    m_userpw varchar(20) not null,
    m_name varchar(20) not null,
    m_email varchar(50) not null,
    m_hp varchar(20) not null,
    m_nickname varchar(20) not null,
    m_birth varchar(10) not null,
    m_interest text not null,
    m_open int not null,
    m_regdate datetime default now(), 
    m_extramood1 varchar(200),
    m_extramood2 varchar(200),
    m_extramood3 varchar(200),
    m_extramood4 varchar(200),
    m_extramood5 varchar(200),
	m_report int default 0
);

create table tb_interest (
	i_idx int auto_increment primary key,
    i_name varchar(20) not null
);

select * from tb_member;
drop table tb_member;
select * from tb_interest;