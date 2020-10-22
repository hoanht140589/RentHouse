create database RentHouse
go
USE [RentHouse]
GO
/****** Object:  Table [dbo].[branch]    Script Date: 10/22/2020 11:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branch](
	[branchid] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[companyid] [bigint] NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[street] [nvarchar](50) NULL,
	[district] [nvarchar](10) NULL,
	[ward] [varchar](10) NULL,
	[city] [varchar](20) NULL,
	[phoneNumber] [nvarchar](12) NOT NULL,
	[FAX] [nvarchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[branchid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company]    Script Date: 10/22/2020 11:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company](
	[companyid] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[companyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 10/22/2020 11:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customerid] [bigint] IDENTITY(1,1) NOT NULL,
	[userid] [bigint] NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[status] [int] NOT NULL,
	[requesthousetypeid] [bigint] NULL,
	[branchid] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[customerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 10/22/2020 11:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[employeeid] [bigint] IDENTITY(1,1) NOT NULL,
	[branchid] [bigint] NOT NULL,
	[userid] [bigint] NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[birthday] [timestamp] NOT NULL,
	[salary] [decimal](38, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[employeeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[house]    Script Date: 10/22/2020 11:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[house](
	[houseid] [bigint] IDENTITY(1,1) NOT NULL,
	[employeeid] [bigint] NOT NULL,
	[houseOwnerId] [bigint] NOT NULL,
	[price] [decimal](38, 2) NOT NULL,
	[housetypeid] [bigint] NOT NULL,
	[customerid] [bigint] NULL,
	[street] [nvarchar](50) NULL,
	[district] [nvarchar](10) NULL,
	[ward] [varchar](10) NULL,
	[city] [varchar](20) NULL,
	[roomquantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[houseid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[houseOwner]    Script Date: 10/22/2020 11:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[houseOwner](
	[houseOwnerId] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[userid] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[houseOwnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[housetype]    Script Date: 10/22/2020 11:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[housetype](
	[housetypeid] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[code] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[housetypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schedule]    Script Date: 10/22/2020 11:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedule](
	[scheduleid] [bigint] IDENTITY(1,1) NOT NULL,
	[customerid] [bigint] NOT NULL,
	[employeeid] [bigint] NOT NULL,
	[scheduledate] [timestamp] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[scheduleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[scheduledate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usergroup]    Script Date: 10/22/2020 11:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usergroup](
	[usergroupid] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[usergroupid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/22/2020 11:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userid] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NULL,
	[usergroupid] [bigint] NOT NULL,
	[address] [nvarchar](255) NULL,
	[sex] [int] NOT NULL,
	[phoneNumber] [nvarchar](12) NULL,
	[fullname] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[branch]  WITH CHECK ADD FOREIGN KEY([companyid])
REFERENCES [dbo].[company] ([companyid])
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD FOREIGN KEY([branchid])
REFERENCES [dbo].[branch] ([branchid])
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD FOREIGN KEY([requesthousetypeid])
REFERENCES [dbo].[housetype] ([housetypeid])
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([userid])
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD FOREIGN KEY([branchid])
REFERENCES [dbo].[branch] ([branchid])
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([userid])
GO
ALTER TABLE [dbo].[house]  WITH CHECK ADD FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([customerid])
GO
ALTER TABLE [dbo].[house]  WITH CHECK ADD FOREIGN KEY([employeeid])
REFERENCES [dbo].[employee] ([employeeid])
GO
ALTER TABLE [dbo].[house]  WITH CHECK ADD FOREIGN KEY([houseOwnerId])
REFERENCES [dbo].[houseOwner] ([houseOwnerId])
GO
ALTER TABLE [dbo].[house]  WITH CHECK ADD FOREIGN KEY([housetypeid])
REFERENCES [dbo].[housetype] ([housetypeid])
GO
ALTER TABLE [dbo].[houseOwner]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([userid])
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([customerid])
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD FOREIGN KEY([employeeid])
REFERENCES [dbo].[employee] ([employeeid])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([usergroupid])
REFERENCES [dbo].[usergroup] ([usergroupid])
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [customer_status] CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [customer_status]
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [schedule_status] CHECK  (([status]=(2) OR [status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [schedule_status]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [users_sex] CHECK  (([sex]=(1) OR [sex]=(0)))
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [users_sex]
GO
/****** Object:  StoredProcedure [dbo].[demoProc]    Script Date: 10/22/2020 11:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[demoProc]
AS 
SELECT * FROM users
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_USER]    Script Date: 10/22/2020 11:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[REGISTER_USER]
@username nvarchar(50),
@password nvarchar(255),
@fullname nvarchar(50),
@phoneNumber nvarchar(12),
@usergroupid bigint,
@address nvarchar(255),
@sex int
AS 
insert into users(username, password, fullname, phoneNumber, usergroupid, address, sex)
values(@username, @password, @fullname, @phoneNumber, @usergroupid, @address, @sex)
GO
