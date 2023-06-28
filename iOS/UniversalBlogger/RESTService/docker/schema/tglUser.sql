create table "tblUser"
(
    id         serial
        constraint "tblUser_pk"
            primary key,
    "userName" VARCHAR not null,
    email      varchar not null
);