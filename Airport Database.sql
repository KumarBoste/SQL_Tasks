# Create a Airport database
# Tables will be
-- a) Airport b) Airline c) Flight d) Passender e) Ticket f) Pilot

create Database if not exists Airport;
use Airport;

# Creation of Tables

Create table Airport (
ticket_id int not null,
flight_id int not null,
airline_id int not null,
pilot_id int not null,
passenger_id int not null,
airport_id int primary key not null unique,
airport_name varchar(50) not null,
city_name varchar(10) not null,
country_name varchar(10) not null,
foreign key (ticket_id) references tickets (ticket_id),
foreign key (flight_id) references flights (flight_id),
foreign key (airline_id) references airlines (airline_id),
foreign key (pilot_id) references pilots (pilot_id),
foreign key (passenger_id) references passengers (passenger_id)
);

CREATE TABLE airlines (
    airline_id INT PRIMARY KEY NOT NULL UNIQUE,
    airline_name VARCHAR(20) NOT NULL,
    country_airline VARCHAR(20) NOT NULL,
    website VARCHAR(30) NOT NULL,
    airline_mobNum BIGINT NOT NULL,
    status ENUM('Active', 'Inactive')
);
alter table airlines
rename column status to airline_status;

CREATE TABLE Flights (
    flight_id INT NOT NULL PRIMARY KEY UNIQUE,
    flight_name VARCHAR(20) NOT NULL,
    airline_id INT NOT NULL,
    destination_airport_id INT NOT NULL,
    source_airport_id INT NOT NULL,
    arrival_time DATETIME NOT NULL,
    departure_time DATETIME NOT NULL,
    flight_status ENUM('Scheduled', 'Departured', 'Arrived', 'Delayed', 'Cancelled'),
    foreign key (airline_id) references airlines (airline_id)
);

CREATE TABLE passengers (
    passenger_id INT NOT NULL PRIMARY KEY UNIQUE,
    passenger_name VARCHAR(20) NOT NULL,
    passenger_gender ENUM('male', 'female', 'others'),
    nationality VARCHAR(15)
);

CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY NOT NULL UNIQUE,
    passenger_id INT NOT NULL,
    flight_id INT NOT NULL,
    ticket_fair BIGINT NOT NULL,
    booking_date DATETIME NOT NULL,
    seat_number INT NOT NULL,
    class ENUM('Bussiness', 'Economy', 'First'),
    FOREIGN KEY (passenger_id)
        REFERENCES passengers (passenger_id),
    FOREIGN KEY (flight_id)
        REFERENCES flights (flight_id)
);

CREATE TABLE pilots (
    pilot_id INT NOT NULL PRIMARY KEY UNIQUE,
    pilot_name VARCHAR(15) NOT NULL,
    pilot_number INT NOT NULL,
    licence_number BIGINT NOT NULL,
    pilot_nationality VARCHAR(20) NOT NULL,
    experience_year INT NOT NULL
);
drop table airport;
