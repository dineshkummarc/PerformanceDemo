USE [master]
GO

--Create database
CREATE DATABASE [PerformanceDemo] ON  PRIMARY 
( NAME = N'PerformanceDemo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\PerformanceDemo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PerformanceDemo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\PerformanceDemo_log.ldf' , SIZE = 2304KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

USE [PerformanceDemo]
GO

--Creat table
CREATE TABLE [dbo].[person](
	[person_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_person] PRIMARY KEY NONCLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--Creat data
DECLARE @i INT

SET @i = 100000

WHILE @i > 0
BEGIN
	INSERT INTO person (name) VALUES ( 'AAAAA' + CONVERT(VARCHAR, @i))
	
	SET @i = @i - 1
END

