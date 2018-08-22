# IMDB-Database-Modelling-and-Design
Designed and modeled IMDB database using Toad Data Modeller 6.1 and queried the data to answer analytical questions in SQL Server and Oracle. Generated DDL scripts using reverse engineering in Toad Data Modeler.  Also, answered analytical questions using SQL stored procedures and triggers.

The IMDB data model consists of the following main entities along with its relationship: <br />
-> Movie <br />
-> Tv Series <br />
-> Genre <br />
-> Theatre <br />
-> Location <br />
-> Season, Episode <br />
-> Watch List <br />
-> User <br />
-> Channel <br />
-> Show Time <br />
-> Cast and Crew <br />
-> Production <br />
-> Nomination <br />
-> Tickets Purchased <br />

The following analytical queries were addressed for the IMDB users in SQL Server Management Studio: <br />
1. Top 10 movies with respect to movie ratings and genre  <br />
2. Top 10 movies in demand by the users  <br />
3. Most awarded movies on IMDB  <br />
4. Find cast and crew for a given movie  <br />

5. Triggers  <br />
Whenever a user buys tickets, the total number of tickets available will be reduced by deleting the number of tickets brought by the user from the Available tickets column.  <br />

6. Procedures  <br />
The procedure takes Actress name as the input parameter and displays all the movies that the actress acted in.  <br />

The procedure takes City name as an input parameter and displays all theatres in that particular location. Thus, helping the user to find the nearby theatres. <br />

7. View  <br />
The view enables the user to get a unified view of Movie as well as TV Series details along with its other attributes by joining these two tables.






