create table movies
(
  id serial8 primary key,
  title varchar(255),
  year varchar(4),
  rated varchar(10),
  released varchar(25),
  runtime varchar(25),
  genre varchar(255),
  director varchar(255),
  writer varchar(255),
  actors varchar(255),
  plot varchar(255),
  poster varchar(255),
  imdbRating varchar(255),
  imdbVotes varchar(255),
  imdbID varchar(255),
  response varchar(255)
);
