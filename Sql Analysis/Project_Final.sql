--Create database Final_Project;

--Use Final_Project;


create table Host(
host_id int primary key, 
	host_since datetime,
	host_is_superhost bit, 
	host_has_profile_pic bit,
	calculated_host_listings_count int
	);


create table House_Neighborhood(
house_neighborhood_id int primary key
	);


create table Neighborhood(
neighborhood_id int primary key identity(1,1),
	neighborhood_cleansed varchar(50), 
	latitude float,
	longtitude float,
	property_type int,
	house_neighborhood_id int,
foreign key (house_neighborhood_id) references House_Neighborhood(house_neighborhood_id)
	);


create table House(
house_id int primary key,
		listing_id int,
		Room_type nvarchar(50),
		price	money,
		accomodates int,
		bedrooms int,
		beds int,
		amenitites int,
		minimumu_nights int,
		availability_365 int,
		reviews_per_month int,
		house_neighborhood_id int,
		host_id int,
foreign key (house_neighborhood_id) references House_Neighborhood(house_neighborhood_id),
foreign key (host_id) references Host(host_id),
		);


create table Calendar(
id int primary key identity(1,1), 
	listing_id int,
	date datetime,
	available bit, 
	price money, 
	minimum_nights int,
	maximum_nights int,
foreign key (listing_id) references House(house_id)
	);


--Track thn istorikothta enos spitiou
create table History(
id int primary key identity(1,1),
	availability_365 int,
	reviews_per_month int,
	house_id int,
foreign key (house_id) references House(house_id)
		);


create table Host_Verified(
id int primary key identity(1,1), 
	host_identity_verified bit,
	host_id int,
foreign key (host_id) references Host(host_id)
	);


create table Reviews(
review_id int primary key,
	[date] datetime,
	reviewer_id int,
	reviewer_name varchar(50),
	comment varchar(1000),
	house_id int, -- to listing_id sto reviews.csv
foreign key	(house_id) references House(house_id),
	);