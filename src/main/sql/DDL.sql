create table users(
                uid serial primary key,
                firstname varchar(255) not null,
                lastname varchar(255) not null,
                byear int not null,
                bmon int not null,
                bday int not null,
                email varchar(127) not null,
                password varchar(31) not null,
                smoke boolean not null,
                note varchar(1023),
                flower int not null default 0,
                photo varchar(1023) not null,
                gender boolean not null,
                relationship int not null
                );

create table connections(
                cid serial primary key,
                ufrom int not null,
                uto int not null
                );