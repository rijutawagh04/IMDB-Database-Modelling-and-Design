/*
Created: 12/6/2016
Modified: 12/6/2016
Model: IMDB_Oracle
Database: Oracle 11g Release 2
*/




-- Create tables section -------------------------------------------------

-- Table ShowTime

CREATE TABLE "ShowTime"(
  "Show_Id" Integer NOT NULL,
  "Show_Time" Date
)
/

-- Add keys for table ShowTime

ALTER TABLE "ShowTime" ADD CONSTRAINT "Key1" PRIMARY KEY ("Show_Id")
/

-- Table Production_Company

CREATE TABLE "Production_Company"(
  "Company_Id" Integer NOT NULL,
  "Company_Name" Char(50 )
)
/

-- Add keys for table Production_Company

ALTER TABLE "Production_Company" ADD CONSTRAINT "Key13" PRIMARY KEY ("Company_Id")
/

-- Table Theatre

CREATE TABLE "Theatre"(
  "Theatre_Id" Integer NOT NULL,
  "Location_Id" Integer NOT NULL,
  "Name" Varchar2(50 ),
  "No_Of_Screens" Integer,
  "Contact_Number" Integer
)
/

-- Create indexes for table Theatre

CREATE INDEX "IX_Relationship50" ON "Theatre" ("Location_Id")
/

-- Add keys for table Theatre

ALTER TABLE "Theatre" ADD CONSTRAINT "Key15" PRIMARY KEY ("Theatre_Id")
/

-- Table Location

CREATE TABLE "Location"(
  "Location_Id" Integer NOT NULL,
  "AddressLine" Varchar2(50 ),
  "City" Char(15 ),
  "State" Char(15 ),
  "ZipCode" Integer,
  "Country" Char(15 )
)
/

-- Add keys for table Location

ALTER TABLE "Location" ADD CONSTRAINT "Key16" PRIMARY KEY ("Location_Id")
/

-- Table Person

CREATE TABLE "Person"(
  "Person_Id" Integer NOT NULL,
  "Gender" Char(8 ),
  "Birth_City" Char(20 ),
  "First_Name" Char(15 ),
  "Last_Name" Char(15 ),
  "Birth_Country" Char(20 ),
  "Date_of_Birth" Date
)
/

-- Add keys for table Person

ALTER TABLE "Person" ADD CONSTRAINT "Key20" PRIMARY KEY ("Person_Id")
/

-- Table Movie_Review

CREATE TABLE "Movie_Review"(
  "Review_Id" Integer NOT NULL,
  "Review_Type" Char(12 ),
  "Review_Comments" Varchar2(75 ),
  "Rating" Integer,
  "Movie_Id" Integer NOT NULL,
  "Review_Date" Date,
  "User_Id" Integer NOT NULL
)
/

-- Add keys for table Movie_Review

ALTER TABLE "Movie_Review" ADD CONSTRAINT "Key29" PRIMARY KEY ("Review_Id","Movie_Id","User_Id")
/

-- Table WatchList

CREATE TABLE "WatchList"(
  "WatchList_Id" Integer NOT NULL,
  "User_Id" Integer NOT NULL
)
/

-- Add keys for table WatchList

ALTER TABLE "WatchList" ADD CONSTRAINT "Key30" PRIMARY KEY ("WatchList_Id","User_Id")
/

-- Table Customer

CREATE TABLE "Customer"(
  "User_Id" Integer NOT NULL,
  "User_Name" Char(12 ) NOT NULL,
  "Password" Char(12 ),
  "Email_Id" Char(20 ),
  "Name" Char(25 )
)
/

-- Add keys for table Customer

ALTER TABLE "Customer" ADD CONSTRAINT "Key31" PRIMARY KEY ("User_Id")
/

-- Table Screen

CREATE TABLE "Screen"(
  "Screen_ID" Integer NOT NULL,
  "Screen_Capacity" Integer,
  "Size_of_Screen" Integer
)
/

-- Add keys for table Screen

ALTER TABLE "Screen" ADD CONSTRAINT "Key38" PRIMARY KEY ("Screen_ID")
/

-- Table Movie

CREATE TABLE "Movie"(
  "Movie_Id" Integer NOT NULL,
  "Release_Date" Date,
  "Movie_Name" Varchar2(50 ),
  "Description" Varchar2(250 ),
  "Running_Time" Date,
  "Origin_Country" Char(15 )
)
/

-- Add keys for table Movie

ALTER TABLE "Movie" ADD CONSTRAINT "Key41" PRIMARY KEY ("Movie_Id")
/

-- Table Tv_Series

CREATE TABLE "Tv_Series"(
  "Series_Id" Integer NOT NULL,
  "Series_Name" Varchar2(50 ),
  "Description" Varchar2(250 ),
  "Origin_Country" Char(15 ),
  "Series_Start_Year" Integer
)
/

-- Add keys for table Tv_Series

ALTER TABLE "Tv_Series" ADD CONSTRAINT "Key42" PRIMARY KEY ("Series_Id")
/

-- Table Episode

CREATE TABLE "Episode"(
  "Episode_Id" Integer NOT NULL,
  "Air_Date" Date,
  "Description" Varchar2(50 ),
  "Running_Time" Date,
  "Season_ID" Integer NOT NULL,
  "Series_Id" Integer NOT NULL,
  "Channel_Id" Integer NOT NULL,
  "Show_Id" Integer NOT NULL
)
/

-- Create indexes for table Episode

CREATE INDEX "IX_Relationship124" ON "Episode" ("Channel_Id")
/

CREATE INDEX "IX_Relationship125" ON "Episode" ("Show_Id")
/

-- Add keys for table Episode

ALTER TABLE "Episode" ADD CONSTRAINT "Key43" PRIMARY KEY ("Episode_Id","Season_ID","Series_Id")
/

-- Table Ticket_Purchased

CREATE TABLE "Ticket_Purchased"(
  "Ticket_Id" Integer NOT NULL,
  "Total_Tickets" Integer,
  "Total_Cost" Number(10,2),
  "Senior_Tickets" Integer,
  "Adult_Tickets" Integer,
  "Child_Tickets" Integer,
  "Screen_ID" Integer NOT NULL,
  "Theatre_Id" Integer NOT NULL,
  "Movie_Id" Integer NOT NULL,
  "Show_Id" Integer NOT NULL,
  "User_Id" Integer
)
/

-- Create indexes for table Ticket_Purchased

CREATE INDEX "IX_Relationship85" ON "Ticket_Purchased" ("User_Id")
/

CREATE INDEX "IX_Relationship86" ON "Ticket_Purchased" ("Screen_ID","Theatre_Id","Movie_Id","Show_Id")
/

-- Add keys for table Ticket_Purchased

ALTER TABLE "Ticket_Purchased" ADD CONSTRAINT "Key45" PRIMARY KEY ("Ticket_Id")
/

-- Table Movie_Theatre

CREATE TABLE "Movie_Theatre"(
  "Theatre_Id" Integer NOT NULL,
  "Movie_Id" Integer NOT NULL
)
/

-- Add keys for table Movie_Theatre

ALTER TABLE "Movie_Theatre" ADD CONSTRAINT "Key46" PRIMARY KEY ("Theatre_Id","Movie_Id")
/

-- Table Theatre_Screen

CREATE TABLE "Theatre_Screen"(
  "Screen_ID" Integer NOT NULL,
  "Theatre_Id" Integer NOT NULL,
  "Movie_Id" Integer NOT NULL
)
/

-- Add keys for table Theatre_Screen

ALTER TABLE "Theatre_Screen" ADD CONSTRAINT "Key47" PRIMARY KEY ("Screen_ID","Theatre_Id","Movie_Id")
/

-- Table Movie_Show

CREATE TABLE "Movie_Show"(
  "Screen_ID" Integer NOT NULL,
  "Theatre_Id" Integer NOT NULL,
  "Movie_Id" Integer NOT NULL,
  "Show_Id" Integer NOT NULL,
  "Tickets_Available" Integer
)
/

-- Add keys for table Movie_Show

ALTER TABLE "Movie_Show" ADD CONSTRAINT "Key48" PRIMARY KEY ("Screen_ID","Theatre_Id","Movie_Id","Show_Id")
/

-- Table Season

CREATE TABLE "Season"(
  "Season_ID" Integer NOT NULL,
  "Description" Varchar2(50 ),
  "Released_Year" Integer,
  "No_of_Episodes" Integer,
  "Series_Id" Integer NOT NULL
)
/

-- Add keys for table Season

ALTER TABLE "Season" ADD CONSTRAINT "Key49" PRIMARY KEY ("Season_ID","Series_Id")
/

-- Table Genre

CREATE TABLE "Genre"(
  "Genre_Id" Integer NOT NULL,
  "Genre_Type" Char(15 )
)
/

-- Add keys for table Genre

ALTER TABLE "Genre" ADD CONSTRAINT "Key53" PRIMARY KEY ("Genre_Id")
/

-- Table Movie_Genre

CREATE TABLE "Movie_Genre"(
  "Movie_Id" Integer NOT NULL,
  "Genre_Id" Integer NOT NULL
)
/

-- Add keys for table Movie_Genre

ALTER TABLE "Movie_Genre" ADD CONSTRAINT "Key54" PRIMARY KEY ("Movie_Id","Genre_Id")
/

-- Table Episode_Genre

CREATE TABLE "Episode_Genre"(
  "Episode_Id" Integer NOT NULL,
  "Genre_Id" Integer NOT NULL,
  "Season_ID" Integer NOT NULL,
  "Series_Id" Integer NOT NULL
)
/

-- Add keys for table Episode_Genre

ALTER TABLE "Episode_Genre" ADD CONSTRAINT "Key55" PRIMARY KEY ("Episode_Id","Genre_Id","Season_ID","Series_Id")
/

-- Table Movie_Cast

CREATE TABLE "Movie_Cast"(
  "Movie_Id" Integer NOT NULL,
  "Person_Id" Integer NOT NULL,
  "Role" Char(25 )
)
/

-- Add keys for table Movie_Cast

ALTER TABLE "Movie_Cast" ADD CONSTRAINT "Key57" PRIMARY KEY ("Movie_Id","Person_Id")
/

-- Table Movie_Crew

CREATE TABLE "Movie_Crew"(
  "Movie_Id" Integer NOT NULL,
  "Person_Id" Integer NOT NULL,
  "Job_Title" Char(25 )
)
/

-- Add keys for table Movie_Crew

ALTER TABLE "Movie_Crew" ADD CONSTRAINT "Key58" PRIMARY KEY ("Movie_Id","Person_Id")
/

-- Table Series_Genre

CREATE TABLE "Series_Genre"(
  "Series_Id" Integer NOT NULL,
  "Genre_Id" Integer NOT NULL
)
/

-- Add keys for table Series_Genre

ALTER TABLE "Series_Genre" ADD CONSTRAINT "Key59" PRIMARY KEY ("Series_Id","Genre_Id")
/

-- Table Movie_Production

CREATE TABLE "Movie_Production"(
  "Movie_Id" Integer NOT NULL,
  "Company_Id" Integer NOT NULL
)
/

-- Add keys for table Movie_Production

ALTER TABLE "Movie_Production" ADD CONSTRAINT "Key60" PRIMARY KEY ("Movie_Id","Company_Id")
/

-- Table Series_Production

CREATE TABLE "Series_Production"(
  "Series_Id" Integer NOT NULL,
  "Company_Id" Integer NOT NULL
)
/

-- Add keys for table Series_Production

ALTER TABLE "Series_Production" ADD CONSTRAINT "Key61" PRIMARY KEY ("Series_Id","Company_Id")
/

-- Table Series_Cast

CREATE TABLE "Series_Cast"(
  "Series_Id" Integer NOT NULL,
  "Person_Id" Integer NOT NULL,
  "Role" Char(1 )
)
/

-- Add keys for table Series_Cast

ALTER TABLE "Series_Cast" ADD CONSTRAINT "Key62" PRIMARY KEY ("Series_Id","Person_Id")
/

-- Table Series_Crew

CREATE TABLE "Series_Crew"(
  "Series_Id" Integer NOT NULL,
  "Person_Id" Integer NOT NULL,
  "Job_Title" Char(20 )
)
/

-- Add keys for table Series_Crew

ALTER TABLE "Series_Crew" ADD CONSTRAINT "Key63" PRIMARY KEY ("Series_Id","Person_Id")
/

-- Table Series_Review

CREATE TABLE "Series_Review"(
  "Series_Review_Id" Integer NOT NULL,
  "Review_Type" Char(12 ),
  "Review_Comments" Varchar2(75 ),
  "Rating" Integer,
  "User_Name" Char(12 ) NOT NULL,
  "Series_Id" Integer NOT NULL,
  "Review_Date" Date,
  "User_Id" Integer NOT NULL
)
/

-- Add keys for table Series_Review

ALTER TABLE "Series_Review" ADD CONSTRAINT "Key98" PRIMARY KEY ("Series_Review_Id","Series_Id","User_Id")
/

-- Table Movie_WatchList

CREATE TABLE "Movie_WatchList"(
  "Movie_Id" Integer NOT NULL,
  "WatchList_Id" Integer NOT NULL,
  "User_Id" Integer NOT NULL
)
/

-- Add keys for table Movie_WatchList

ALTER TABLE "Movie_WatchList" ADD CONSTRAINT "Key99" PRIMARY KEY ("Movie_Id","WatchList_Id","User_Id")
/

-- Table Series_WatchList

CREATE TABLE "Series_WatchList"(
  "Series_Id" Integer NOT NULL,
  "WatchList_Id" Integer NOT NULL,
  "User_Id" Integer NOT NULL
)
/

-- Add keys for table Series_WatchList

ALTER TABLE "Series_WatchList" ADD CONSTRAINT "Key100" PRIMARY KEY ("Series_Id","WatchList_Id","User_Id")
/

-- Table Channel

CREATE TABLE "Channel"(
  "Channel_Id" Integer NOT NULL,
  "Channel_Name" Char(12 )
)
/

-- Add keys for table Channel

ALTER TABLE "Channel" ADD CONSTRAINT "Key101" PRIMARY KEY ("Channel_Id")
/

-- Table News

CREATE TABLE "News"(
  "News_Id" Integer NOT NULL,
  "Title" Varchar2(75 ),
  "Description" Varchar2(200 )
)
/

-- Add keys for table News

ALTER TABLE "News" ADD CONSTRAINT "Key102" PRIMARY KEY ("News_Id")
/

-- Table Movie_News

CREATE TABLE "Movie_News"(
  "Movie_Id" Integer NOT NULL,
  "News_Id" Integer NOT NULL
)
/

-- Add keys for table Movie_News

ALTER TABLE "Movie_News" ADD CONSTRAINT "Key103" PRIMARY KEY ("Movie_Id","News_Id")
/

-- Table Series_News

CREATE TABLE "Series_News"(
  "Series_Id" Integer NOT NULL,
  "News_Id" Integer NOT NULL
)
/

-- Add keys for table Series_News

ALTER TABLE "Series_News" ADD CONSTRAINT "Key104" PRIMARY KEY ("Series_Id","News_Id")
/

-- Table Award_Show

CREATE TABLE "Award_Show"(
  "AwardShow_Id" Integer NOT NULL,
  "AwardShow_Name" Char(25 )
)
/

-- Add keys for table Award_Show

ALTER TABLE "Award_Show" ADD CONSTRAINT "Key106" PRIMARY KEY ("AwardShow_Id")
/

-- Table Award_Category

CREATE TABLE "Award_Category"(
  "Award_Category_Id" Integer NOT NULL,
  "Award_Name" Char(15 )
)
/

-- Add keys for table Award_Category

ALTER TABLE "Award_Category" ADD CONSTRAINT "Key107" PRIMARY KEY ("Award_Category_Id")
/

-- Table Award_Header

CREATE TABLE "Award_Header"(
  "AwardShow_Id" Integer NOT NULL,
  "Award_Category_Id" Integer NOT NULL
)
/

-- Add keys for table Award_Header

ALTER TABLE "Award_Header" ADD CONSTRAINT "Key108" PRIMARY KEY ("AwardShow_Id","Award_Category_Id")
/

-- Table Award_Nomination

CREATE TABLE "Award_Nomination"(
  "Nominee_Id" Integer NOT NULL,
  "AwardShow_Id" Integer NOT NULL,
  "Award_Category_Id" Integer NOT NULL,
  "Award_Winner" Char(1 )
)
/

-- Add keys for table Award_Nomination

ALTER TABLE "Award_Nomination" ADD CONSTRAINT "Key109" PRIMARY KEY ("Nominee_Id","AwardShow_Id","Award_Category_Id")
/

-- Table Award_Nominated_Person

CREATE TABLE "Award_Nominated_Person"(
  "Nominee_Id" Integer NOT NULL,
  "AwardShow_Id" Integer NOT NULL,
  "Award_Category_Id" Integer NOT NULL,
  "Person_Id" Integer NOT NULL,
  "Movie_Id" Integer,
  "Series_Id" Integer
)
/

-- Create indexes for table Award_Nominated_Person

CREATE INDEX "IX_Relationship111" ON "Award_Nominated_Person" ("Movie_Id")
/

CREATE INDEX "IX_Relationship112" ON "Award_Nominated_Person" ("Series_Id")
/

-- Add keys for table Award_Nominated_Person

ALTER TABLE "Award_Nominated_Person" ADD CONSTRAINT "Key110" PRIMARY KEY ("Nominee_Id","AwardShow_Id","Award_Category_Id","Person_Id")
/

-- Table Movie_Nomination

CREATE TABLE "Movie_Nomination"(
  "Movie_Id" Integer NOT NULL,
  "Nominee_Id" Integer NOT NULL,
  "AwardShow_Id" Integer NOT NULL,
  "Award_Category_Id" Integer NOT NULL
)
/

-- Add keys for table Movie_Nomination

ALTER TABLE "Movie_Nomination" ADD CONSTRAINT "Key111" PRIMARY KEY ("Movie_Id","Nominee_Id","AwardShow_Id","Award_Category_Id")
/

-- Table Series_Nomination

CREATE TABLE "Series_Nomination"(
  "Nominee_Id" Integer NOT NULL,
  "AwardShow_Id" Integer NOT NULL,
  "Award_Category_Id" Integer NOT NULL,
  "Series_Id" Integer NOT NULL
)
/

-- Add keys for table Series_Nomination

ALTER TABLE "Series_Nomination" ADD CONSTRAINT "Key112" PRIMARY KEY ("Nominee_Id","AwardShow_Id","Award_Category_Id","Series_Id")
/

-- Table AwardShow_Location

CREATE TABLE "AwardShow_Location"(
  "Location_Id" Integer NOT NULL,
  "AwardShow_Id" Integer NOT NULL,
  "Show_Date" Date
)
/

-- Add keys for table AwardShow_Location

ALTER TABLE "AwardShow_Location" ADD CONSTRAINT "Key114" PRIMARY KEY ("Location_Id","AwardShow_Id")
/

-- Table Celeb_News

CREATE TABLE "Celeb_News"(
  "News_Id" Integer NOT NULL,
  "Person_Id" Integer NOT NULL
)
/

-- Add keys for table Celeb_News

ALTER TABLE "Celeb_News" ADD CONSTRAINT "Key115" PRIMARY KEY ("News_Id","Person_Id")
/

-- Create relationships section ------------------------------------------------- 

ALTER TABLE "Movie_Theatre" ADD CONSTRAINT "Theatre_plays_movies" FOREIGN KEY ("Theatre_Id") REFERENCES "Theatre" ("Theatre_Id")
/

ALTER TABLE "Movie_Theatre" ADD CONSTRAINT "Movies_are_played_in_theatres" FOREIGN KEY ("Movie_Id") REFERENCES "Movie" ("Movie_Id")
/

ALTER TABLE "Theatre_Screen" ADD CONSTRAINT "Screen_is_in_a_Theatre" FOREIGN KEY ("Screen_ID") REFERENCES "Screen" ("Screen_ID")
/

ALTER TABLE "Theatre_Screen" ADD CONSTRAINT "Theatre_has_a_screen" FOREIGN KEY ("Theatre_Id", "Movie_Id") REFERENCES "Movie_Theatre" ("Theatre_Id", "Movie_Id")
/

ALTER TABLE "Movie_Show" ADD CONSTRAINT "TheatreScreen_has_a_Show" FOREIGN KEY ("Screen_ID", "Theatre_Id", "Movie_Id") REFERENCES "Theatre_Screen" ("Screen_ID", "Theatre_Id", "Movie_Id")
/

ALTER TABLE "Movie_Show" ADD CONSTRAINT "Movie_has_A_Showtime" FOREIGN KEY ("Show_Id") REFERENCES "ShowTime" ("Show_Id")
/

ALTER TABLE "Theatre" ADD CONSTRAINT "Theatre_has_a_location" FOREIGN KEY ("Location_Id") REFERENCES "Location" ("Location_Id")
/

ALTER TABLE "Movie_Genre" ADD CONSTRAINT "Movie_has_a_genre" FOREIGN KEY ("Movie_Id") REFERENCES "Movie" ("Movie_Id")
/

ALTER TABLE "Movie_Genre" ADD CONSTRAINT "Genre_is_in_Movie" FOREIGN KEY ("Genre_Id") REFERENCES "Genre" ("Genre_Id")
/

ALTER TABLE "Episode_Genre" ADD CONSTRAINT "Episode_has_a_genre" FOREIGN KEY ("Episode_Id", "Season_ID", "Series_Id") REFERENCES "Episode" ("Episode_Id", "Season_ID", "Series_Id")
/

ALTER TABLE "Episode_Genre" ADD CONSTRAINT "Genre_is_in_episode" FOREIGN KEY ("Genre_Id") REFERENCES "Genre" ("Genre_Id")
/

ALTER TABLE "Movie_Cast" ADD CONSTRAINT "Movie_has_Actors" FOREIGN KEY ("Movie_Id") REFERENCES "Movie" ("Movie_Id")
/

ALTER TABLE "Movie_Cast" ADD CONSTRAINT "Person_acts_in_movies" FOREIGN KEY ("Person_Id") REFERENCES "Person" ("Person_Id")
/

ALTER TABLE "Movie_Crew" ADD CONSTRAINT "Movie_has_crew" FOREIGN KEY ("Movie_Id") REFERENCES "Movie" ("Movie_Id")
/

ALTER TABLE "Movie_Crew" ADD CONSTRAINT "Person_works_in_movies" FOREIGN KEY ("Person_Id") REFERENCES "Person" ("Person_Id")
/

ALTER TABLE "Series_Genre" ADD CONSTRAINT "TVSeries_has_a_genre" FOREIGN KEY ("Series_Id") REFERENCES "Tv_Series" ("Series_Id")
/

ALTER TABLE "Series_Genre" ADD CONSTRAINT "Genre_is_in_series" FOREIGN KEY ("Genre_Id") REFERENCES "Genre" ("Genre_Id")
/

ALTER TABLE "WatchList" ADD CONSTRAINT "Customer_has_a_watchlist" FOREIGN KEY ("User_Id") REFERENCES "Customer" ("User_Id")
/

ALTER TABLE "Movie_Production" ADD CONSTRAINT "Movie_is_produced_by_company" FOREIGN KEY ("Movie_Id") REFERENCES "Movie" ("Movie_Id")
/

ALTER TABLE "Movie_Production" ADD CONSTRAINT "Company_produces_movies" FOREIGN KEY ("Company_Id") REFERENCES "Production_Company" ("Company_Id")
/

ALTER TABLE "Series_Production" ADD CONSTRAINT "TV_series_is_produced_by_company" FOREIGN KEY ("Series_Id") REFERENCES "Tv_Series" ("Series_Id")
/

ALTER TABLE "Series_Production" ADD CONSTRAINT "Production_Company_Produces_TV_Series" FOREIGN KEY ("Company_Id") REFERENCES "Production_Company" ("Company_Id")
/

ALTER TABLE "Series_Cast" ADD CONSTRAINT "TV_Series_has_cast" FOREIGN KEY ("Series_Id") REFERENCES "Tv_Series" ("Series_Id")
/

ALTER TABLE "Series_Cast" ADD CONSTRAINT "Person_acts_in_series" FOREIGN KEY ("Person_Id") REFERENCES "Person" ("Person_Id")
/

ALTER TABLE "Series_Crew" ADD CONSTRAINT "TV_Series_has_crew" FOREIGN KEY ("Series_Id") REFERENCES "Tv_Series" ("Series_Id")
/

ALTER TABLE "Series_Crew" ADD CONSTRAINT "Person_works_in_TV_series" FOREIGN KEY ("Person_Id") REFERENCES "Person" ("Person_Id")
/

ALTER TABLE "Movie_Review" ADD CONSTRAINT "Customer_gives_reviews_for_movies" FOREIGN KEY ("User_Id") REFERENCES "Customer" ("User_Id")
/

ALTER TABLE "Movie_Review" ADD CONSTRAINT "Movie_is_reviewed_by_customers" FOREIGN KEY ("Movie_Id") REFERENCES "Movie" ("Movie_Id")
/

ALTER TABLE "Ticket_Purchased" ADD CONSTRAINT "Customer_Purchases_Tickets" FOREIGN KEY ("User_Id") REFERENCES "Customer" ("User_Id")
/

ALTER TABLE "Ticket_Purchased" ADD CONSTRAINT "Tickets_Sold_of_Movie" FOREIGN KEY ("Screen_ID", "Theatre_Id", "Movie_Id", "Show_Id") REFERENCES "Movie_Show" ("Screen_ID", "Theatre_Id", "Movie_Id", "Show_Id")
/

ALTER TABLE "Series_Review" ADD CONSTRAINT "Customer_gives_reviews_for_TV_Series" FOREIGN KEY ("User_Id") REFERENCES "Customer" ("User_Id")
/

ALTER TABLE "Series_Review" ADD CONSTRAINT "TV_Series_is_reviewed" FOREIGN KEY ("Series_Id") REFERENCES "Tv_Series" ("Series_Id")
/

ALTER TABLE "Movie_WatchList" ADD CONSTRAINT "Movies_are_in_watchlist" FOREIGN KEY ("Movie_Id") REFERENCES "Movie" ("Movie_Id")
/

ALTER TABLE "Movie_WatchList" ADD CONSTRAINT "Customer_has_movies_in_watchlist" FOREIGN KEY ("WatchList_Id", "User_Id") REFERENCES "WatchList" ("WatchList_Id", "User_Id")
/

ALTER TABLE "Series_WatchList" ADD CONSTRAINT "TV_Series_is_in_watchlist" FOREIGN KEY ("Series_Id") REFERENCES "Tv_Series" ("Series_Id")
/

ALTER TABLE "Series_WatchList" ADD CONSTRAINT "WatchList_has_TV_Series" FOREIGN KEY ("WatchList_Id", "User_Id") REFERENCES "WatchList" ("WatchList_Id", "User_Id")
/

ALTER TABLE "Movie_News" ADD CONSTRAINT "Movie_is_tagged_in_News" FOREIGN KEY ("Movie_Id") REFERENCES "Movie" ("Movie_Id")
/

ALTER TABLE "Movie_News" ADD CONSTRAINT "News_is_about_Movies" FOREIGN KEY ("News_Id") REFERENCES "News" ("News_Id")
/

ALTER TABLE "Series_News" ADD CONSTRAINT "Series_is_tagged_in_News" FOREIGN KEY ("Series_Id") REFERENCES "Tv_Series" ("Series_Id")
/

ALTER TABLE "Series_News" ADD CONSTRAINT "News_is_about_Series" FOREIGN KEY ("News_Id") REFERENCES "News" ("News_Id")
/

ALTER TABLE "Award_Header" ADD CONSTRAINT "Award_show_has_a_category" FOREIGN KEY ("AwardShow_Id") REFERENCES "Award_Show" ("AwardShow_Id")
/

ALTER TABLE "Award_Header" ADD CONSTRAINT "Awardcategory_is_of_a_show" FOREIGN KEY ("Award_Category_Id") REFERENCES "Award_Category" ("Award_Category_Id")
/

ALTER TABLE "Award_Nomination" ADD CONSTRAINT "Award_has_nominations" FOREIGN KEY ("AwardShow_Id", "Award_Category_Id") REFERENCES "Award_Header" ("AwardShow_Id", "Award_Category_Id")
/

ALTER TABLE "Award_Nominated_Person" ADD CONSTRAINT "NomineePerson_wins_award" FOREIGN KEY ("Nominee_Id", "AwardShow_Id", "Award_Category_Id") REFERENCES "Award_Nomination" ("Nominee_Id", "AwardShow_Id", "Award_Category_Id")
/

ALTER TABLE "Award_Nominated_Person" ADD CONSTRAINT "Person_wins_award" FOREIGN KEY ("Person_Id") REFERENCES "Person" ("Person_Id")
/

ALTER TABLE "Award_Nominated_Person" ADD CONSTRAINT "Movie_Actor_is_nominated" FOREIGN KEY ("Movie_Id") REFERENCES "Movie" ("Movie_Id")
/

ALTER TABLE "Award_Nominated_Person" ADD CONSTRAINT "TV_Actor_is_Nominated" FOREIGN KEY ("Series_Id") REFERENCES "Tv_Series" ("Series_Id")
/

ALTER TABLE "Movie_Nomination" ADD CONSTRAINT "Movie_is_Nominated" FOREIGN KEY ("Movie_Id") REFERENCES "Movie" ("Movie_Id")
/

ALTER TABLE "Movie_Nomination" ADD CONSTRAINT "NomineeMovie_wins_an_award" FOREIGN KEY ("Nominee_Id", "AwardShow_Id", "Award_Category_Id") REFERENCES "Award_Nomination" ("Nominee_Id", "AwardShow_Id", "Award_Category_Id")
/

ALTER TABLE "Series_Nomination" ADD CONSTRAINT "Nominee_series_wins_award" FOREIGN KEY ("Nominee_Id", "AwardShow_Id", "Award_Category_Id") REFERENCES "Award_Nomination" ("Nominee_Id", "AwardShow_Id", "Award_Category_Id")
/

ALTER TABLE "Series_Nomination" ADD CONSTRAINT "TV_Series_is_nominated_for_award" FOREIGN KEY ("Series_Id") REFERENCES "Tv_Series" ("Series_Id")
/

ALTER TABLE "AwardShow_Location" ADD CONSTRAINT "Location_hosts_Awardshow" FOREIGN KEY ("Location_Id") REFERENCES "Location" ("Location_Id")
/

ALTER TABLE "AwardShow_Location" ADD CONSTRAINT "AwardShow_has_a_location" FOREIGN KEY ("AwardShow_Id") REFERENCES "Award_Show" ("AwardShow_Id")
/

ALTER TABLE "Season" ADD CONSTRAINT "TVSeries_has_Seasons" FOREIGN KEY ("Series_Id") REFERENCES "Tv_Series" ("Series_Id")
/

ALTER TABLE "Episode" ADD CONSTRAINT "Season_has_episodes" FOREIGN KEY ("Season_ID", "Series_Id") REFERENCES "Season" ("Season_ID", "Series_Id")
/

ALTER TABLE "Episode" ADD CONSTRAINT "Channel_hosts_Episode" FOREIGN KEY ("Channel_Id") REFERENCES "Channel" ("Channel_Id")
/

ALTER TABLE "Episode" ADD CONSTRAINT "Episodes_are_at_a_showtime" FOREIGN KEY ("Show_Id") REFERENCES "ShowTime" ("Show_Id")
/

ALTER TABLE "Celeb_News" ADD CONSTRAINT "News_is_about_Celebrity" FOREIGN KEY ("News_Id") REFERENCES "News" ("News_Id")
/

ALTER TABLE "Celeb_News" ADD CONSTRAINT "Celeb_is_tagged_in_News" FOREIGN KEY ("Person_Id") REFERENCES "Person" ("Person_Id")
/





