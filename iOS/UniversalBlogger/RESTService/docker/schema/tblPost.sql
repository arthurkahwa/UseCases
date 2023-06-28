create table "tblPost"
(
    id      serial
        constraint "tblPost_pk"
            primary key,
    title   varchar not null,
    body    varchar not null,
    user_id integer
        constraint "tblPost_tblUser_id_fk"
            references "tblUser"
);