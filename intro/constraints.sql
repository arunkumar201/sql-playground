create table employee (
	id TEXT NOT NULL PRIMARY KEY,
	name VARCHAR(20) UNIQUE,
	email VARCHAR(20) UNIQUE,
	phone VARCHAR(20) DEFAULT 233334,
	password VARCHAR(20),
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO admin (id, name, email, phone,password)
values ('1', 'admin', 'admin@123', '1234567890','arun@222');

select * from admin;

update admin set name='arun kumar ' where id='3';

insert into admin (id, name, email, phone,password)
values ('2', 'admin', 'admin@123', '1234567890','arun@222');

delete from admin  where id='2';

delete from admin where email='admin@123';

DESCRIBE employee;
