insert into schedule(start_time,end_time) values('10:09','11:10');

--print the varchar(number_of_chracter) print the time format
select convert(varchar(5),start_time,108) from schedule;
--time difference
select DATEDIFF(MINUTE,start_time,end_time) from schedule;

insert into movie_schedule(movie_schedule_date) values(GETDATE());

alter table [user] add constraint FK_city_id foreign key(city_id)  references city(id);  

alter table booking add constraint FK_user_id foreign key(user_id)  references [user](id); 

alter table booking add constraint FK_movie_schedule_id foreign key(movie_schedule_id)  references movie_schedule(id); 

alter table movie_schedule add constraint FK_movie_id foreign key(movie_id)  references movie(id); 

alter table movie_schedule add constraint FK_schedule_id foreign key(schedule_id)  references schedule(id); 

alter table schedule add constraint FK_hall_id foreign key(hall_id)  references hall(id); 

alter table hall add constraint FK_cinema_id foreign key(cinema_id)  references cinema(id); 

alter table cinema add constraint FK_city_id_cinema foreign key(city_id)  references city(id); 






