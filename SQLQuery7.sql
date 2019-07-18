--problem in this link
--https://docs.google.com/document/d/1qIgEL6k5AK-KRmFpQKj8DjhUJRh1ynNjyewtOP1GPKs/edit#heading=h.ae7pks3k1no8
select * from movie_schedule;

--Query Assignment
go
alter view [movie_value] as
select cinema.id as CinemaId,cinema.city_id as cityId,cinema.name as CineplexName,hall.id as hallId,hall.capacity as Capacity,hall.name as hallName,
schedule.day as [day],schedule.id as scheduleId,schedule.start_time as start_time,schedule.end_time as end_time,movie_schedule.id as movie_schedule_id,
movie_schedule.date as movie_schedule_date,movie_schedule.ticket_price as ticket_price,movie.id as movieId,movie.name as movieName,movie.rating movie_Rating,movie.release_date as release_date 
	from cinema join hall on cinema.id=hall.cinema_id 
	join schedule on schedule.hall_id=hall.id 
	join movie_schedule on schedule.id=movie_schedule.schedule_id
	join movie on movie_schedule.movie_id=movie.id;
go

go
alter view [movie_all] as
select cinema.id as CinemaId,cinema.city_id as cityId,cinema.name as CineplexName,hall.id as hallId,hall.capacity as Capacity,hall.name as hallName,
schedule.day as [day],schedule.id as scheduleId,schedule.start_time as start_time,schedule.end_time as end_time,movie_schedule.id as movie_schedule_id,
movie_schedule.date as movie_schedule_date,movie_schedule.ticket_price as ticket_price,movie.id as movieId,movie.name as movieName,movie.rating movie_Rating,movie.release_date as release_date,
city.name as CityName,[user].dateOfBirth as dateOfBirth,[user].firstName as firstname,[user].lastName as lastName,[user].id as UserId,[user].gender as Gender
	from cinema join hall on cinema.id=hall.cinema_id 
	join schedule on schedule.hall_id=hall.id 
	join movie_schedule on schedule.id=movie_schedule.schedule_id
	join movie on movie_schedule.movie_id=movie.id
	join city on city.id=cinema.city_id
	join [user] on [user].city_id=city.id;
go


--1.Write a query to find all distinct movies released per cinema.
select distinct movieName,CineplexName from movie_value order by CineplexName;

--2.Write a query to find the number of movies released this year/this month per cinema.
select CineplexName,count(movieId) as [Number of Movies] from movie_value where YEAR(movie_schedule_date)='2011' group by CineplexName;
select CineplexName,count(movieId) as [Number of Movies] from movie_value where month(movie_schedule_date)='12' group by CineplexName;

--3.Write a query to find those schedules for all halls which did not show any movies.
select * from movie_schedule where movie_id is null;
---new solution
select schedule.id,schedule.hall_id,schedule.day from schedule left join movie_schedule on schedule.id=movie_schedule.schedule_id where movie_schedule.id is null;



--4.Write a scalar valued function which returns the weekend id for a hall.
go
alter FUNCTION fn_Holiday(@id int)
returns int
as
begin
 DECLARE @day INT  
 declare @sum int
	set @sum=1+2+3+4+5+6+7;
	select @day=sum(distinct [day]) from schedule where schedule.hall_id=@id;
 RETURN @sum-@day  
end
go

go
alter FUNCTION fn_Holiday_new(@id int)
returns @Table table(Week_day int)
as
begin
 DECLARE @day table(Week_day int);

 insert into @day(Week_day) values (1),(2),(3),(4),(5),(6),(7);

	with hall_day as
	(
		select schedule.id,schedule.day from hall join schedule on hall.id=schedule.hall_id where hall.id=1
	)
	insert into @Table select Week_day from @day left join hall_day on Week_day=hall_day.day where hall_day.day is null; 
 RETURN  
end
go

go
select dbo.fn_Holiday(1) as [day];
select * from dbo.fn_Holiday_new(1);
select dbo.fn_Holiday(2) as [day];
select dbo.fn_Holiday(3) as [day];
select dbo.fn_Holiday(4) as [day];
select dbo.fn_Holiday(5) as [day];
select dbo.fn_Holiday(6) as [day];
select dbo.fn_Holiday(7) as [day];
select dbo.fn_Holiday(8) as [day];
go


--5.Write a stored procedure to book ticket for a user.

----------------------------------------------------------------------------------------
select UserId,movie_schedule_id from movie_all order by UserId,movie_schedule_id;

declare @capacity int;
select top 1 @capacity=Capacity from movie_value where movie_value.movie_schedule_id=55;
print @capacity
-----------------------------------------------------------------------------------------
go
alter procedure spBooking
@UserId int,
@NumOfTicket int,
@Movie_Schedule_Id int,
@Ans int output
as
begin
	declare @UserPerviousTicket int;
	select @UserPerviousTicket=sum(number_of_seat) from booking where booking.movie_schedule_id=@Movie_Schedule_Id and booking.user_id=@UserId;
	if(@NumOfTicket+@UserPerviousTicket>4)
		begin
			set @Ans=-2;
		end
	else 
		begin
			declare @countSeat int;
			declare @capacity int;
			set @countSeat=0;
			select @countSeat=sum(number_of_seat) from booking where booking.movie_schedule_id=@Movie_Schedule_Id;
			select top 1 @capacity=Capacity from movie_value where movie_value.movie_schedule_id=@Movie_Schedule_Id;
			if(@NumOfTicket+@countSeat>@capacity)
				begin
					set @Ans=-1;
				end
			else
				begin
					declare @TicketPrice int;
					select top 1 @TicketPrice=ticket_price from movie_value where movie_value.movie_schedule_id=@Movie_Schedule_Id;
					set @Ans=@TicketPrice*@NumOfTicket;
					insert into booking(movie_schedule_id,[user_id],number_of_seat) values(@Movie_Schedule_Id,@UserId,@NumOfTicket);
				end
		end
end
go

declare @Cost int;
execute spBooking 1,2,2,@Cost output
print @Cost


declare @capacity int;
select top 1 @capacity=Capacity from movie_value where movie_value.movie_schedule_id=2;
print @capacity


go
 DECLARE @day table(Week_day int);

 insert into @day(Week_day) values (1),(2),(3),(4),(5),(6),(7);

with hall_day as
(
	select schedule.id,schedule.day from hall join schedule on hall.id=schedule.hall_id where hall.id=1
)
select * from @day left join hall_day on Week_day=hall_day.day where hall_day.day is null; 

go