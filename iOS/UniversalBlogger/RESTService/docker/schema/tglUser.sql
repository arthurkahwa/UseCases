create table "tbl_user"
(
    id         serial
        constraint "tbl_user_pk"
            primary key,
    user_name VARCHAR not null,
    email      varchar not null
);