
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/16/2022 23:58:41
-- Generated from EDMX file: D:\Semester3\FIT5032\Assignment\5032Assignment_1\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-5032Assignment_1-20220915054953];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BookingBill]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bookings] DROP CONSTRAINT [FK_BookingBill];
GO
IF OBJECT_ID(N'[dbo].[FK_ClientsBookings]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bookings] DROP CONSTRAINT [FK_ClientsBookings];
GO
IF OBJECT_ID(N'[dbo].[FK_StaffsBookings]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bookings] DROP CONSTRAINT [FK_StaffsBookings];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Bills]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Bills];
GO
IF OBJECT_ID(N'[dbo].[Bookings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Bookings];
GO
IF OBJECT_ID(N'[dbo].[Clients]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clients];
GO
IF OBJECT_ID(N'[dbo].[Staffs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Staffs];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Bills'
CREATE TABLE [dbo].[Bills] (
    [BillId] int IDENTITY(1,1) NOT NULL,
    [Rating] nvarchar(max)  NOT NULL,
    [PriceAmount] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Bookings'
CREATE TABLE [dbo].[Bookings] (
    [BookingId] int IDENTITY(1,1) NOT NULL,
    [BookingDate] datetime  NOT NULL,
    [Bill_BillId] int  NOT NULL,
    [ClientsClientId] nvarchar(max)  NOT NULL,
    [ClientsFirstName] nvarchar(max)  NOT NULL,
    [ClientsLastName] nvarchar(max)  NOT NULL,
    [ClientsEmail] nvarchar(max)  NOT NULL,
    [ClientsDOB] datetime  NOT NULL,
    [ClientsPassword] nvarchar(max)  NOT NULL,
    [ClientsCity] nvarchar(max)  NOT NULL,
    [ClientsPhoneNumber] nvarchar(max)  NOT NULL,
    [StaffsStaffId] nvarchar(max)  NOT NULL,
    [StaffsMajority] nvarchar(max)  NOT NULL,
    [StaffsFirstName] nvarchar(max)  NOT NULL,
    [StaffsLastName] nvarchar(max)  NOT NULL,
    [StaffsGender] nvarchar(max)  NOT NULL,
    [StaffsEmail] nvarchar(max)  NOT NULL,
    [StaffsPhoneNumber] int  NOT NULL,
    [StaffsPassword] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Clients'
CREATE TABLE [dbo].[Clients] (
    [ClientId] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [DOB] datetime  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [PhoneNumber] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Staffs'
CREATE TABLE [dbo].[Staffs] (
    [StaffId] nvarchar(max)  NOT NULL,
    [Majority] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Gender] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [PhoneNumber] int  NOT NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [BillId] in table 'Bills'
ALTER TABLE [dbo].[Bills]
ADD CONSTRAINT [PK_Bills]
    PRIMARY KEY CLUSTERED ([BillId] ASC);
GO

-- Creating primary key on [BookingId] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [PK_Bookings]
    PRIMARY KEY CLUSTERED ([BookingId] ASC);
GO

-- Creating primary key on [ClientId], [FirstName], [LastName], [Email], [DOB], [Password], [City], [PhoneNumber] in table 'Clients'
ALTER TABLE [dbo].[Clients]
ADD CONSTRAINT [PK_Clients]
    PRIMARY KEY CLUSTERED ([ClientId], [FirstName], [LastName], [Email], [DOB], [Password], [City], [PhoneNumber] ASC);
GO

-- Creating primary key on [StaffId], [Majority], [FirstName], [LastName], [Gender], [Email], [PhoneNumber], [Password] in table 'Staffs'
ALTER TABLE [dbo].[Staffs]
ADD CONSTRAINT [PK_Staffs]
    PRIMARY KEY CLUSTERED ([StaffId], [Majority], [FirstName], [LastName], [Gender], [Email], [PhoneNumber], [Password] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Bill_BillId] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [FK_BookingBill]
    FOREIGN KEY ([Bill_BillId])
    REFERENCES [dbo].[Bills]
        ([BillId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookingBill'
CREATE INDEX [IX_FK_BookingBill]
ON [dbo].[Bookings]
    ([Bill_BillId]);
GO

-- Creating foreign key on [ClientsClientId], [ClientsFirstName], [ClientsLastName], [ClientsEmail], [ClientsDOB], [ClientsPassword], [ClientsCity], [ClientsPhoneNumber] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [FK_ClientsBookings]
    FOREIGN KEY ([ClientsClientId], [ClientsFirstName], [ClientsLastName], [ClientsEmail], [ClientsDOB], [ClientsPassword], [ClientsCity], [ClientsPhoneNumber])
    REFERENCES [dbo].[Clients]
        ([ClientId], [FirstName], [LastName], [Email], [DOB], [Password], [City], [PhoneNumber])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientsBookings'
CREATE INDEX [IX_FK_ClientsBookings]
ON [dbo].[Bookings]
    ([ClientsClientId], [ClientsFirstName], [ClientsLastName], [ClientsEmail], [ClientsDOB], [ClientsPassword], [ClientsCity], [ClientsPhoneNumber]);
GO

-- Creating foreign key on [StaffsStaffId], [StaffsMajority], [StaffsFirstName], [StaffsLastName], [StaffsGender], [StaffsEmail], [StaffsPhoneNumber], [StaffsPassword] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [FK_StaffsBookings]
    FOREIGN KEY ([StaffsStaffId], [StaffsMajority], [StaffsFirstName], [StaffsLastName], [StaffsGender], [StaffsEmail], [StaffsPhoneNumber], [StaffsPassword])
    REFERENCES [dbo].[Staffs]
        ([StaffId], [Majority], [FirstName], [LastName], [Gender], [Email], [PhoneNumber], [Password])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StaffsBookings'
CREATE INDEX [IX_FK_StaffsBookings]
ON [dbo].[Bookings]
    ([StaffsStaffId], [StaffsMajority], [StaffsFirstName], [StaffsLastName], [StaffsGender], [StaffsEmail], [StaffsPhoneNumber], [StaffsPassword]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------