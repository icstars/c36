-- export PGPASSWORD=<password>
-- psql -h <host> -d <database> -U <user_name> -p <port> <path to postgres_trains_remote_example.sql file>

create table if not exists trains (
  id serial primary key,
  name text,
  inService boolean,
  numberOfAvailable int
);

insert into trains (name, inService, numberOfAvailable) values ('redline 813', true, '8');
insert into trains (name, inService, numberOfAvailable) values ('redline 912', true, '10');
insert into trains (name, inService, numberOfAvailable) values ('greenline 713', true, '10');
insert into trains (name, inService, numberOfAvailable) values ('brownline 412', true, '8');
