CREATE TABLE user(
name varchar(30) PRIMARY KEY,
surname varchar(30) ,
password varchar(12),
username varchar(30)
);
CREATE TABLE jury(
	name varchar(30) PRIMARY KEY,
    nationality varchar(4) ,
    UNIQUE (name,nationality),
     FOREIGN KEY (name) REFERENCES user(name)
);

CREATE TABLE positions(
	id int PRIMARY KEY,
    name varchar(50)
); 

create table player(
	name varchar(30) PRIMARY KEY,
    height int ,
    weight int,
    date_of_birth date,
 FOREIGN KEY (name) REFERENCES user(name)
);
CREATE TABLE player_position (
    player_name VARCHAR(30),
    position_id INT,
    PRIMARY KEY (player_name, position_id),
    FOREIGN KEY (player_name) REFERENCES player(name),
    FOREIGN KEY (position_id) REFERENCES positions(id)
);
CREATE table coach(
	name varchar(30) PRIMARY KEY,
    nationality varchar(4) ,
    UNIQUE (name,nationality),
	FOREIGN KEY (name) REFERENCES user(name)
    
);
create table team(
	id int PRIMARY KEY,
    name varchar(50)
);
create table coach_directs_team(
	 coach_name varchar(50) Not null , 
    start date,
    finish date,
    team_id int,
    FOREIGN KEY (coach_name) references coach(name),
    FOREIGN KEY (team_id) references team(id),
    primary key(team_id,coach_name)
    
);
create table channel(
	id int PRIMARY KEY,
    name varchar(50),
    UNIQUE (name,id)
);
create table team_contracted_channel(
	team_id int PRIMARY KEY,
    channel_id int NOT NULL,
    start date,
    finish date,
    FOREIGN KEY(team_id) REFERENCES team(id),
    FOREIGN KEY(channel_id) REFERENCES channel(id)
    
);

CREATE TABLE stadium (
    stadium_id INT PRIMARY KEY,
    stadium_country VARCHAR(50),
    stadium_name VARCHAR(50),
     UNIQUE (stadium_id, stadium_country, stadium_name)
);


create table match_session(
session_id int primary key,
match_session_date date ,
rating double not null,
assigned_jury varchar(30) not null,
UNIQUE (session_id,assigned_jury),
time_slot ENUM('1', '2', '3', '4') not null,
match_stadium_id int not null, 
UNIQUE(match_session_date,time_slot,match_stadium_id),
FOREIGN KEY (assigned_jury) REFERENCES jury(name),
FOREIGN KEY(match_stadium_id) REFERENCES stadium(stadium_id)
);
create table player_match_matchsession(
player_name VARCHAR(30),
team_id int,
match_session_id int,
position_id INT,
PRIMARY KEY (player_name, match_session_id),
FOREIGN KEY (player_name) REFERENCES player(name),
FOREIGN key(team_id) REFERENCES team(id),
FOREIGN KEY(match_session_id) REFERENCES match_session(session_id),
FOREIGN KEY (player_name, position_id) REFERENCES player_position(player_name, position_id)
 
);




