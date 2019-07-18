--insert data to city
insert into city(name) values('Dhaka');
insert into city(name) values('Khulna');

select * from city;

--insert data to cinema

insert into cinema(city_id,name) values(1,'Star Cineplex');
insert into cinema(city_id,name) values(1,'Blockbuster Cinemas');

insert into cinema(city_id,name) values(2,'Liberty Cineplex');
insert into cinema(city_id,name) values(2,'Songita');

select * from cinema;

--insert data to user

insert into [user](city_id,firstName,lastName,gender,dateOfBirth) values(1,'Nazmul','Islam','Male','05/12/1994');
insert into [user](city_id,firstName,lastName,gender,dateOfBirth) values(1,'Opu','Hasan','Male','05/11/1995');
insert into [user](city_id,firstName,lastName,gender,dateOfBirth) values(1,'Foyaz','Akanda','Male','04/10/1993');

insert into [user](city_id,firstName,lastName,gender,dateOfBirth) values(2,'Rupasree','day','Female','05/11/1997');
insert into [user](city_id,firstName,lastName,gender,dateOfBirth) values(2,'Rahima','Jahan','Female','05/12/1991');
insert into [user](city_id,firstName,lastName,gender,dateOfBirth) values(2,'Jubair','Araf','Male','06/13/1992');

select * from [user];

--insert hall 

insert into hall(cinema_id,name,capacity) values(1,'Star_Cineplex_Hall_1',10);
insert into hall(cinema_id,name,capacity) values(1,'Star_Cineplex_Hall_2',8);

insert into hall(cinema_id,name,capacity) values(2,'Blockbuster_Cinemas_Hall_1',8);
insert into hall(cinema_id,name,capacity) values(2,'Blockbuster_Cinemas_Hall_2',7);

insert into hall(cinema_id,name,capacity) values(3,'Liberty_Cineplex_Hall_1',12);
insert into hall(cinema_id,name,capacity) values(3,'Liberty_Cineplex_Hall_2',10);

insert into hall(cinema_id,name,capacity) values(4,'Songita_Hall_1',11);
insert into hall(cinema_id,name,capacity) values(4,'Songita_Hall_2',11);

select * from hall;

--input for movie

insert into movie(name,release_date,rating) values('Dhaka Attack','02/10/2017',8);
insert into movie(name,release_date,rating) values('Aynabaji','03/09/2016',9.3);
insert into movie(name,release_date,rating) values('Gladiator','05/05/2000',8.5);
insert into movie(name,release_date,rating) values('Inception','06/07/2010',8.8);
insert into movie(name,release_date,rating) values('Your Name','07/04/2017',8.4);
insert into movie(name,release_date,rating) values('The Miracle','01/01/2015',7.6);
insert into movie(name,release_date,rating) values('K.G.F: Chapter 1','02/12/2018',8.3);
insert into movie(name,release_date,rating) values('The Illusionist','01/08/2006',7.6);
insert into movie(name,release_date,rating) values('Interstellar','07/11/2014',8.6);
insert into movie(name,release_date,rating) values('Life Is Beautiful','12/02/1999',8.6);

select * from movie;

 --schedule input

--hall_id_1
insert into schedule(hall_id,day,start_time,end_time) values(1,1,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(1,1,'15:00','19:00');

insert into schedule(hall_id,day,start_time,end_time) values(1,2,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(1,2,'15:00','19:00');

insert into schedule(hall_id,day,start_time,end_time) values(1,3,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(1,3,'15:00','19:00');

insert into schedule(hall_id,day,start_time,end_time) values(1,4,'11:30','15:30');
insert into schedule(hall_id,day,start_time,end_time) values(1,4,'16:00','20:00');

insert into schedule(hall_id,day,start_time,end_time) values(1,5,'12:30','16:30');
insert into schedule(hall_id,day,start_time,end_time) values(1,5,'19:00','23:00');

insert into schedule(hall_id,day,start_time,end_time) values(1,6,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(1,6,'15:00','19:00');

--hall_id_2

insert into schedule(hall_id,day,start_time,end_time) values(2,1,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(2,1,'15:00','19:00');

insert into schedule(hall_id,day,start_time,end_time) values(2,2,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(2,2,'15:00','19:00');

insert into schedule(hall_id,day,start_time,end_time) values(2,3,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(2,3,'15:00','19:00');

insert into schedule(hall_id,day,start_time,end_time) values(2,4,'11:30','15:30');
insert into schedule(hall_id,day,start_time,end_time) values(2,4,'16:00','20:00');

insert into schedule(hall_id,day,start_time,end_time) values(2,5,'12:30','16:30');
insert into schedule(hall_id,day,start_time,end_time) values(2,5,'19:00','23:00');

insert into schedule(hall_id,day,start_time,end_time) values(2,7,'12:30','16:30');
insert into schedule(hall_id,day,start_time,end_time) values(2,7,'17:00','21:00');


--hall_id_3

insert into schedule(hall_id,day,start_time,end_time) values(3,1,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(3,1,'15:00','19:00');

insert into schedule(hall_id,day,start_time,end_time) values(3,2,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(3,2,'15:00','19:00');

insert into schedule(hall_id,day,start_time,end_time) values(3,3,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(3,3,'16:00','20:00');

insert into schedule(hall_id,day,start_time,end_time) values(3,4,'11:30','15:30');
insert into schedule(hall_id,day,start_time,end_time) values(3,4,'16:00','20:00');

insert into schedule(hall_id,day,start_time,end_time) values(3,6,'12:30','16:30');
insert into schedule(hall_id,day,start_time,end_time) values(3,6,'18:00','22:00');

insert into schedule(hall_id,day,start_time,end_time) values(3,7,'12:30','16:30');
insert into schedule(hall_id,day,start_time,end_time) values(3,7,'17:00','21:00');


--hall_id_4

insert into schedule(hall_id,day,start_time,end_time) values(4,1,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(4,1,'15:00','19:00');

insert into schedule(hall_id,day,start_time,end_time) values(4,2,'09:30','13:30');
insert into schedule(hall_id,day,start_time,end_time) values(4,2,'15:00','19:00');

insert into schedule(hall_id,day,start_time,end_time) values(4,3,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(4,3,'16:00','20:00');

insert into schedule(hall_id,day,start_time,end_time) values(4,5,'11:30','15:30');
insert into schedule(hall_id,day,start_time,end_time) values(4,5,'16:00','20:00');

insert into schedule(hall_id,day,start_time,end_time) values(4,6,'12:40','16:40');
insert into schedule(hall_id,day,start_time,end_time) values(4,6,'18:00','22:00');

insert into schedule(hall_id,day,start_time,end_time) values(4,7,'04:30','08:30');
insert into schedule(hall_id,day,start_time,end_time) values(4,7,'17:00','21:00');


--hall_id_5

insert into schedule(hall_id,day,start_time,end_time) values(5,1,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(5,1,'16:00','20:00');

insert into schedule(hall_id,day,start_time,end_time) values(5,2,'09:30','13:30');
insert into schedule(hall_id,day,start_time,end_time) values(5,2,'15:00','19:00');

insert into schedule(hall_id,day,start_time,end_time) values(5,4,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(5,4,'16:00','20:00');

insert into schedule(hall_id,day,start_time,end_time) values(5,5,'11:30','15:30');
insert into schedule(hall_id,day,start_time,end_time) values(5,5,'16:00','20:00');

insert into schedule(hall_id,day,start_time,end_time) values(5,6,'12:40','16:40');
insert into schedule(hall_id,day,start_time,end_time) values(5,6,'18:20','22:20');

insert into schedule(hall_id,day,start_time,end_time) values(5,7,'04:30','08:30');
insert into schedule(hall_id,day,start_time,end_time) values(5,7,'17:15','21:15');


--hall_id_6

insert into schedule(hall_id,day,start_time,end_time) values(6,1,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(6,1,'16:00','20:00');

insert into schedule(hall_id,day,start_time,end_time) values(6,3,'09:30','13:30');
insert into schedule(hall_id,day,start_time,end_time) values(6,3,'15:00','19:00');

insert into schedule(hall_id,day,start_time,end_time) values(6,4,'10:38','14:38');
insert into schedule(hall_id,day,start_time,end_time) values(6,4,'16:05','20:05');

insert into schedule(hall_id,day,start_time,end_time) values(6,5,'11:30','15:30');
insert into schedule(hall_id,day,start_time,end_time) values(6,5,'16:10','20:10');

insert into schedule(hall_id,day,start_time,end_time) values(6,6,'12:45','16:45');
insert into schedule(hall_id,day,start_time,end_time) values(6,6,'18:20','22:20');

insert into schedule(hall_id,day,start_time,end_time) values(6,7,'04:30','08:30');
insert into schedule(hall_id,day,start_time,end_time) values(6,7,'17:15','21:15');


--hall_id_7

insert into schedule(hall_id,day,start_time,end_time) values(7,2,'10:34','14:34');
insert into schedule(hall_id,day,start_time,end_time) values(7,2,'16:00','20:00');

insert into schedule(hall_id,day,start_time,end_time) values(7,3,'09:30','13:30');
insert into schedule(hall_id,day,start_time,end_time) values(7,3,'15:00','19:00');

insert into schedule(hall_id,day,start_time,end_time) values(7,4,'10:38','14:38');
insert into schedule(hall_id,day,start_time,end_time) values(7,4,'16:05','20:05');

insert into schedule(hall_id,day,start_time,end_time) values(7,5,'10:30','14:30');
insert into schedule(hall_id,day,start_time,end_time) values(7,5,'16:10','20:10');

insert into schedule(hall_id,day,start_time,end_time) values(7,6,'12:45','16:45');
insert into schedule(hall_id,day,start_time,end_time) values(7,6,'18:20','22:20');

insert into schedule(hall_id,day,start_time,end_time) values(7,7,'04:35','08:35');
insert into schedule(hall_id,day,start_time,end_time) values(7,7,'17:10','21:10');


--hall_id_8

insert into schedule(hall_id,day,start_time,end_time) values(8,2,'10:35','14:35');
insert into schedule(hall_id,day,start_time,end_time) values(8,2,'16:00','20:00');

insert into schedule(hall_id,day,start_time,end_time) values(8,3,'09:30','13:30');
insert into schedule(hall_id,day,start_time,end_time) values(8,3,'15:00','19:00');

insert into schedule(hall_id,day,start_time,end_time) values(8,4,'10:38','14:38');
insert into schedule(hall_id,day,start_time,end_time) values(8,4,'16:05','20:05');

insert into schedule(hall_id,day,start_time,end_time) values(8,5,'11:30','15:30');
insert into schedule(hall_id,day,start_time,end_time) values(8,5,'16:10','20:10');

insert into schedule(hall_id,day,start_time,end_time) values(8,6,'12:40','16:40');
insert into schedule(hall_id,day,start_time,end_time) values(8,6,'18:20','22:20');

insert into schedule(hall_id,day,start_time,end_time) values(8,7,'04:30','08:30');
insert into schedule(hall_id,day,start_time,end_time) values(8,7,'17:10','21:10');


select * from schedule;
select * from movie;


--insert movie_schedule

insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(1,1,'05/06/2010',200);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(2,2,'06/07/2019',200);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(3,3,'07/08/2018',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(4,3,'08/09/2012',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(5,4,'09/07/2019',350);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(6,5,'10/08/2011',350);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(7,6,'01/09/2012',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(8,7,'02/06/2013',400);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(9,7,'03/06/2014',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(10,8,'04/04/2018',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(2,9,'05/05/2014',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(1,10,'06/11/2018',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(1,11,'07/10/2019',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(3,12,'08/23/2011',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(4,12,'09/22/2012',400);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(10,12,'10/21/2013',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(6,13,'11/22/2014',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(7,14,'12/24/2015',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(8,15,'01/22/2016',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(9,16,'02/11/2017',700);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(4,16,'03/22/2018',200);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(5,17,'04/25/2019',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(3,18,'05/01/2011',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(2,19,'06/02/2012',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(4,19,'07/03/2013',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(2,20,'08/04/2014',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(6,21,'09/05/2015',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(3,22,'10/06/2016',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(3,23,'11/07/2017',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(3,24,'12/08/2018',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(4,25,'12/09/2019',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(4,26,'11/10/2011',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(6,27,'10/11/2012',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(6,28,'09/12/2013',350);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(7,29,'08/13/2014',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(8,30,'07/14/2015',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(9,31,'05/15/2016',800);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(2,32,'04/16/2014',900);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(1,33,'01/17/2011',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(2,34,'02/18/2012',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(3,35,'03/19/2011',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(4,36,'04/20/2012',400);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(5,37,'06/21/2013',400);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(6,38,'07/22/2014',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(7,39,'08/23/2016',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(8,40,'09/24/2013',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(9,41,'08/25/2015',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(10,42,'10/26/2018',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(1,43,'11/01/2016',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(2,44,'12/02/2017',200);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(3,45,'11/03/2019',300);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(4,46,'01/04/2016',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(5,47,'02/05/2014',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(6,47,'03/06/2012',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(7,49,'05/07/2019',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(8,50,'06/06/2015',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(9,50,'07/07/2014',800);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(10,51,'08/16/2038',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(2,52,'09/12/2012',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(1,53,'01/13/2011',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(3,54,'03/14/2012',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(4,54,'04/15/2013',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(5,55,'06/16/2015',550);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(6,56,'07/17/2016',550);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(7,57,'08/18/2017',550);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(8,58,'09/19/2019',550);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(9,59,'08/20/2018',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(10,60,'10/21/2015',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(10,61,'11/22/2012',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(9,62,'12/23/2018',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(8,63,'11/24/2019',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(7,64,'05/25/2018',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(6,64,'03/26/2013',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(5,65,'02/21/2019',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(4,66,'01/22/2012',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(3,67,'04/06/2013',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(2,68,'03/07/2011',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(1,69,'02/01/2018',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(2,70,'01/02/2011',600);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(1,71,'02/03/2014',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(3,72,'03/04/2016',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(4,72,'04/05/2018',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(5,72,'05/07/2017',400);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(6,73,'06/06/2014',400);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(7,74,'07/08/2012',400);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(8,75,'08/09/2011',400);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(9,76,'09/01/2014',400);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(10,77,'05/02/2017',400);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(5,78,'04/03/2014',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(6,79,'02/04/2019',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(7,80,'01/05/2018',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(8,80,'07/06/2019',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(1,81,'08/07/2018',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(2,82,'09/08/2013',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(4,83,'10/09/2012',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(5,83,'11/10/2013',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(6,84,'12/11/2012',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(7,85,'10/12/2013',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(8,86,'11/13/2011',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(10,86,'12/14/2011',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(10,87,'10/15/2013',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(2,88,'11/16/2012',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(1,89,'12/17/2013',500);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(1,90,'01/18/2014',450);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(3,90,'02/19/2016',350);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(4,91,'03/20/2017',350);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(5,92,'01/21/2016',350);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(6,93,'02/01/2019',650);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(8,94,'01/02/2016',650);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(2,95,'02/03/2019',750);
insert into movie_schedule(movie_id,schedule_id,[date],ticket_price) values(7,96,'01/04/2016',250);


select * from movie_schedule;
