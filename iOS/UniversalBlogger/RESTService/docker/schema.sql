create database uniblog;

create table "tbluser"
(
    id serial
        constraint "tbluser_pk"
            primary key,
    username VARCHAR not null,
    email      varchar not null
);