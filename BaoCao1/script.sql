if(DB_ID('RentHouse') IS NULL) create database RentHouse;
use RentHouse;

drop table if exists schedule;
drop table if exists house;
drop table if exists customer;
drop table if exists housetype;
drop table if exists houseowner;
drop table if exists employee;
drop table if exists branch;
drop table if exists company;
drop table if exists users;
drop table if exists usergroup;

create table usergroup(
	usergroupid bigint not null identity primary key,
	name nvarchar(255) not null unique,
	description text null
);

create table users(
	userid bigint not null identity primary key,
	username nvarchar(50) not null unique,
	password nvarchar(100) not null,
	usergroupid bigint not null foreign key references usergroup(usergroupid),
	address nvarchar(255) null,
	sex int not null constraint users_sex check ([sex] IN (0, 1)), --0 is female, 1 is male
	phoneNumber nvarchar(12) null
);

create table company(
	companyid bigint not null identity primary key,
	name nvarchar(50) not null
);

create table branch(
	branchid bigint not null identity primary key,
	name nvarchar(50) not null,
	companyid bigint not null foreign key references company(companyid),
	code nvarchar(10) not null unique,
	street nvarchar(50) null,
	district nvarchar(10) null,
	ward varchar(10) null,
	city varchar(20) null,
	phoneNumber nvarchar(12) not null,
	FAX nvarchar(12) null
);

create table employee(
	employeeid bigint not null identity primary key,
	branchid bigint not null foreign key references branch(branchid),
	userid bigint not null foreign key references users(userid),
	code nvarchar(10) not null unique,
	birthday timestamp not null,
	salary decimal(38,2)
);

create table houseOwner(
	houseOwnerId bigint not null identity primary key,
	code nvarchar(10) not null unique,
	userid bigint not null foreign key references users(userid)
);

create table housetype(
	housetypeid bigint not null identity primary key,
	name nvarchar(50) not null,
	code nvarchar(10) not null unique
);

create table customer(
	customerid bigint not null identity primary key,
	userid bigint not null foreign key references users(userid),
	code nvarchar(10) not null unique,
	status int not null constraint customer_status check ([status] in (0, 1)), --0 is inactive, 1 is active
	requesthousetypeid bigint null foreign key references housetype(housetypeid),
	branchid bigint null foreign key references branch(branchid)
);

create table house(
	houseid bigint not null identity primary key,
	employeeid bigint not null foreign key references employee(employeeid),
	houseOwnerId bigint not null foreign key references houseOwner(houseOwnerId),
	price decimal(38,2) not null,
	housetypeid bigint not null foreign key references housetype(housetypeid),
	customerid bigint null foreign key references customer(customerid),
	street nvarchar(50) null,
	district nvarchar(10) null,
	ward varchar(10) null,
	city varchar(20) null,
	roomquantity int not null
);

create table schedule(
	scheduleid bigint not null identity primary key,
	customerid bigint not null foreign key references customer(customerid),
	employeeid bigint not null foreign key references employee(employeeid),
	scheduledate timestamp not null unique,
	status int not null constraint schedule_status check ([status] in (0,1,2)) --0 đang chờ xem nhà, 1 đang xem, 2 đã xem
);