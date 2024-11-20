USE [master]
GO
/****** Object:  Database [ATM_DB]    Script Date: 11/21/2024 1:38:52 AM ******/
CREATE DATABASE [ATM_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ATM_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ATM_DB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ATM_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ATM_DB_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ATM_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ATM_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ATM_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ATM_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ATM_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ATM_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ATM_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ATM_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ATM_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ATM_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ATM_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ATM_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ATM_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ATM_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ATM_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ATM_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ATM_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ATM_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ATM_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ATM_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ATM_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ATM_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ATM_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ATM_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ATM_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ATM_DB] SET  MULTI_USER 
GO
ALTER DATABASE [ATM_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ATM_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ATM_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ATM_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ATM_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ATM_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ATM_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ATM_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ATM_DB]
GO
/****** Object:  User [Akifa]    Script Date: 11/21/2024 1:38:52 AM ******/
CREATE USER [Akifa] FOR LOGIN [Akifa] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Akifa]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [Akifa]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [Akifa]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Akifa]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [Akifa]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Akifa]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Akifa]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [Akifa]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [Akifa]
GO
/****** Object:  Table [dbo].[ATM]    Script Date: 11/21/2024 1:38:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATM](
	[ATM_ID] [int] NOT NULL,
	[TIME_ZONE] [varchar](30) NULL,
	[ENTITY_ID] [varchar](30) NULL,
	[CREATED_ON] [datetime] NOT NULL,
	[CREATED_BY] [varchar](30) NULL,
	[UPDATED_ON] [datetime] NOT NULL,
	[UPDATED_BY] [varchar](30) NULL,
	[ATM_NAME] [varchar](30) NULL,
	[LOCATION] [varchar](50) NULL,
	[LUNO] [varchar](9) NULL,
	[IS_CONFIGURED] [char](1) NULL,
	[LAST_BOOT_TIME] [varchar](14) NULL,
	[CONFIG_FILE_PATH] [varchar](256) NOT NULL,
	[CURRENT_MODE] [int] NULL,
	[PREVIOUS_MODE] [int] NULL,
	[CONFIG_LOADED] [char](1) NULL,
	[CONFIG_LOAD_STATUS] [int] NULL,
	[KEY_LOADED] [char](1) NULL,
	[ATM_TYPE_ID] [int] NOT NULL,
	[Branch_Id] [char](4) NOT NULL,
	[TERMINAL_ID] [varchar](30) NOT NULL,
	[TIME_ZONE_ID] [varchar](30) NOT NULL,
	[IS_ACTIVE] [numeric](1, 0) NULL,
	[CITY] [varchar](30) NULL,
	[IS_BKEY_GENERATED] [numeric](1, 0) NULL,
	[BKEY] [varchar](50) NULL,
	[TPK] [varchar](50) NULL,
	[ADK] [varchar](50) NULL,
	[ATM_FUNCTIONALITY] [varchar](10) NULL,
	[POSTAL_CODE] [varchar](10) NULL,
	[REGION] [varchar](3) NULL,
	[BKEYCOMPONENT_1] [varchar](50) NULL,
	[BKEYCOMPONENT_2] [varchar](50) NULL,
	[BKEY1_USED] [varchar](50) NULL,
	[IS_SSL] [varchar](1) NULL,
	[Signature_A1] [varchar](640) NULL,
	[Signature_A2] [varchar](640) NULL,
	[Signature_B] [varchar](640) NULL,
	[Signature_C] [varchar](640) NULL,
	[Signature_D] [varchar](640) NULL,
	[NCR_PK] [varchar](1000) NULL,
	[NCR_SUB_PK] [varchar](1000) NULL,
	[HSM_PK] [varchar](1000) NULL,
	[HSM_SK] [varchar](1500) NULL,
	[Random_No] [varchar](32) NULL,
	[EPP_SerialNo] [varchar](8) NULL,
	[EPP_PK] [varchar](1000) NULL,
	[DES_KCV] [varchar](10) NULL,
	[D1_DES_KEY_UNDER_EPP_PK] [varchar](512) NULL,
	[D2_Random_No_DES_KEY_UNDER_EPP_PK] [varchar](600) NULL,
	[D3_Random_No_DES_KEY_UNDER_EPP_PK_Signature] [varchar](512) NULL,
	[REMOTE_KEY_LOADED] [varchar](1) NULL,
	[HSM_PK_OLD] [varchar](1000) NULL,
	[HSM_SK_OLD] [varchar](1500) NULL,
 CONSTRAINT [PK6] PRIMARY KEY NONCLUSTERED 
(
	[ATM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ATM_TYPE]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATM_TYPE](
	[ATM_TYPE_ID] [int] NOT NULL,
	[CREATED_ON] [datetime] NOT NULL,
	[CREATED_BY] [varchar](30) NULL,
	[UPDATED_ON] [datetime] NOT NULL,
	[UPDATED_BY] [varchar](30) NULL,
	[NAME] [varchar](30) NULL,
	[DESCRIPTION] [varchar](256) NULL,
	[IMAGE_LINK] [varchar](256) NULL,
	[ATM_PROTOCOL_ID] [int] NOT NULL,
 CONSTRAINT [PK75] PRIMARY KEY NONCLUSTERED 
(
	[ATM_TYPE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Declined_Tran_Log]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Declined_Tran_Log](
	[Declined_Tran_Log_Id] [int] NOT NULL,
	[ATM_ID] [int] NOT NULL,
	[Amount] [char](50) NULL,
	[TSN] [char](4) NULL,
	[setID] [int] NULL,
	[Transaction_Code] [char](256) NULL,
	[Transmission_Date_Time] [char](14) NULL,
	[PAN] [char](50) NULL,
 CONSTRAINT [PK101] PRIMARY KEY NONCLUSTERED 
(
	[Declined_Tran_Log_Id] ASC,
	[ATM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INCOMING_TRANSACTION]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INCOMING_TRANSACTION](
	[Incoming_Tran_Id] [int] NOT NULL,
	[ATM_ID] [int] NOT NULL,
	[TSN] [varchar](50) NULL,
	[Amount] [varchar](50) NULL,
	[PAN] [varchar](50) NULL,
	[STAN] [varchar](50) NULL,
	[ProcCode] [varchar](50) NULL,
	[Transmission_Date_Time] [varchar](50) NULL,
	[CurrencyCode] [char](3) NULL,
	[IS_TRAN_COMPLETED] [varchar](6) NULL,
 CONSTRAINT [PK100] PRIMARY KEY NONCLUSTERED 
(
	[Incoming_Tran_Id] ASC,
	[ATM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LAST_TRAN_STATUS]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LAST_TRAN_STATUS](
	[Last_Tran_Status_Id] [int] NOT NULL,
	[Last_Tran_Status_Type_Id] [char](1) NOT NULL,
	[ATM_ID] [int] NOT NULL,
	[Notes_Dispensed_C1] [char](5) NULL,
	[Notes_Dispensed_C2] [char](5) NULL,
	[Notes_Dispensed_C3] [char](5) NULL,
	[Notes_Dispensed_C4] [char](5) NULL,
	[TSN] [char](4) NULL,
	[STATUS] [varchar](1000) NULL,
 CONSTRAINT [PK99] PRIMARY KEY NONCLUSTERED 
(
	[Last_Tran_Status_Id] ASC,
	[Last_Tran_Status_Type_Id] ASC,
	[ATM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LAST_TRAN_STATUS_TYPE]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LAST_TRAN_STATUS_TYPE](
	[Last_Tran_Status_Type_Id] [char](1) NOT NULL,
	[Last_Tran_Status_Desc] [char](512) NULL,
 CONSTRAINT [PK98] PRIMARY KEY NONCLUSTERED 
(
	[Last_Tran_Status_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ATM_View1]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATM_View1] AS
SELECT 
    A.ATM_NAME, A.ATM_FUNCTIONALITY, A.LOCATION, A.CURRENT_MODE, A.Branch_Id, A.CITY, A.POSTAL_CODE, A.REGION, A.ATM_ID, 
    AT.NAME AS ATM_TYPE_NAME, AT.DESCRIPTION AS ATM_TYPE_DESCRIPTION,
    D.Amount as DECLINED_AMOUNT, D.Transaction_Code,
    L.Notes_Dispensed_C1, L.Notes_Dispensed_C2, L.Notes_Dispensed_C3, L.Notes_Dispensed_C4, L.STATUS AS LAST_TRAN_STATUS,
    LT.Last_Tran_Status_Desc,
    I.Amount AS TRANSACTION_AMOUNT, I.IS_TRAN_COMPLETED, I.Incoming_Tran_Id, I.Transmission_Date_Time, I.CurrencyCode
FROM 
    ATM A
JOIN 
    ATM_TYPE AT ON A.ATM_TYPE_ID=AT.ATM_TYPE_ID
JOIN 
    Declined_Tran_Log D ON A.ATM_ID=D.ATM_ID
JOIN 
    LAST_TRAN_STATUS L ON A.ATM_ID=L.ATM_ID
JOIN 
    LAST_TRAN_STATUS_TYPE LT ON L.Last_Tran_Status_Type_Id=LT.Last_Tran_Status_Type_Id
JOIN 
    INCOMING_TRANSACTION I ON A.ATM_ID=I.ATM_ID;
GO
/****** Object:  Table [dbo].[ATM_DEVICE]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATM_DEVICE](
	[ATM_ID] [int] NOT NULL,
	[DEVICE_ID] [int] NOT NULL,
	[CONFIG_DATA] [varchar](40) NULL,
	[IS_DELETED] [char](1) NULL,
 CONSTRAINT [PK26] PRIMARY KEY NONCLUSTERED 
(
	[ATM_ID] ASC,
	[DEVICE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CASH_HANDLER]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CASH_HANDLER](
	[ATM_ID] [int] NOT NULL,
	[DEVICE_ID] [int] NOT NULL,
	[CREATED_ON] [datetime] NOT NULL,
	[CREATED_BY] [varchar](30) NULL,
	[UPDATED_ON] [datetime] NOT NULL,
	[UPDATED_BY] [varchar](30) NULL,
	[NOTES_REJECTED] [int] NULL,
	[NOTES_REMAINING] [int] NULL,
	[NOTES_DISPENSED] [int] NULL,
	[NOTES_JAMMED] [int] NULL,
	[NOTES_DENOMINATION] [int] NULL,
	[CURRENCY_ID] [int] NULL,
 CONSTRAINT [PK7] PRIMARY KEY NONCLUSTERED 
(
	[ATM_ID] ASC,
	[DEVICE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CURRENCY]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CURRENCY](
	[CURRENCY_ID] [int] NOT NULL,
	[ISO_CURRENCY] [varchar](256) NULL,
	[CURRENCY_DESC] [varchar](256) NULL,
	[decimal_places] [varchar](256) NULL,
 CONSTRAINT [PK47] PRIMARY KEY NONCLUSTERED 
(
	[CURRENCY_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ATM_View2]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATM_View2] AS
SELECT
    A.ATM_ID,
    C.NOTES_REJECTED, C.NOTES_REMAINING, C.NOTES_DISPENSED, C.NOTES_JAMMED, C.NOTES_DENOMINATION,
    CU.CURRENCY_DESC
FROM
    ATM A
JOIN
    ATM_DEVICE ON A.ATM_ID=ATM_DEVICE.ATM_ID
JOIN
    CASH_HANDLER C ON C.DEVICE_ID=ATM_DEVICE.DEVICE_ID
JOIN
    CURRENCY CU ON C.CURRENCY_ID=CU.CURRENCY_ID;
GO
/****** Object:  Table [dbo].[ATM_PROTOCOL]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATM_PROTOCOL](
	[ATM_PROTOCOL_ID] [int] NOT NULL,
	[PROTOCOL] [varchar](30) NULL,
	[DESCRIPTION] [varchar](256) NULL,
	[CONFIG_PATH] [varchar](200) NULL,
	[TCPIP_FORWARDING_QUEUE] [varchar](50) NULL,
	[PROTOCOL_PROCESSOR_PATH] [varchar](250) NULL,
	[NimbusUI_Forwarding_Queue] [varchar](50) NULL,
 CONSTRAINT [PK95] PRIMARY KEY NONCLUSTERED 
(
	[ATM_PROTOCOL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONT_RECEIPT]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONT_RECEIPT](
	[CONT_RECEIPT_ID] [int] NOT NULL,
	[PATTERN] [char](1) NULL,
	[CONT_RECEIPT_DESC] [varchar](256) NULL,
	[CONT_RECEIPT_FLAG] [char](1) NULL,
	[SET_ID] [int] NOT NULL,
	[ATM_PROTOCOL_ID] [int] NULL,
 CONSTRAINT [PK71] PRIMARY KEY NONCLUSTERED 
(
	[CONT_RECEIPT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRE_PROCESSING]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRE_PROCESSING](
	[PRE_PROCESSING_ID] [int] NOT NULL,
	[TRANSACTION_CODE_ID] [int] NULL,
	[NDC_REPLY_DATA_ID] [int] NULL,
	[SET_ID] [int] NOT NULL,
 CONSTRAINT [PK62] PRIMARY KEY NONCLUSTERED 
(
	[PRE_PROCESSING_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRAN_SET]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRAN_SET](
	[SET_ID] [int] NOT NULL,
	[ENTITY_ID] [varchar](30) NOT NULL,
	[OWNER] [varchar](256) NULL,
 CONSTRAINT [PK52] PRIMARY KEY NONCLUSTERED 
(
	[SET_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANSACTION_CODE]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANSACTION_CODE](
	[TRANSACTION_CODE_ID] [int] NOT NULL,
	[ISO_CODE] [varchar](256) NULL,
	[TRANSACTION_DESC] [varchar](256) NULL,
	[TRANSACTION_DESC_ARABIC] [varchar](256) NULL,
 CONSTRAINT [PK48] PRIMARY KEY NONCLUSTERED 
(
	[TRANSACTION_CODE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ATM_View3]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATM_View3] AS
SELECT
    T.TRANSACTION_DESC,
    A.ATM_ID
FROM
    ATM A
JOIN
    ATM_TYPE AT ON A.ATM_TYPE_ID = AT.ATM_TYPE_ID
JOIN
    ATM_PROTOCOL ON AT.ATM_PROTOCOL_ID = ATM_PROTOCOL.ATM_PROTOCOL_ID
JOIN
    CONT_RECEIPT ON ATM_PROTOCOL.ATM_PROTOCOL_ID = CONT_RECEIPT.ATM_PROTOCOL_ID
JOIN
    TRAN_SET ON CONT_RECEIPT.SET_ID = TRAN_SET.SET_ID
JOIN
    PRE_PROCESSING ON PRE_PROCESSING.SET_ID = TRAN_SET.SET_ID
JOIN
    TRANSACTION_CODE T ON T.TRANSACTION_CODE_ID = PRE_PROCESSING.TRANSACTION_CODE_ID;
GO
/****** Object:  View [dbo].[Main_View]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[Main_View] AS
SELECT DISTINCT 
    A.ATM_ID,
    A.ATM_NAME, A.ATM_FUNCTIONALITY, A.LOCATION, A.CURRENT_MODE, A.Branch_Id, A.CITY, A.POSTAL_CODE, A.REGION, 
    AT.NAME AS ATM_TYPE_NAME, AT.DESCRIPTION AS ATM_TYPE_DESCRIPTION,
    D.Amount as DECLINED_AMOUNT, D.Transaction_Code,
    L.Notes_Dispensed_C1, L.Notes_Dispensed_C2, L.Notes_Dispensed_C3, L.Notes_Dispensed_C4, L.STATUS AS LAST_TRAN_STATUS,
    LT.Last_Tran_Status_Desc, 
    I.Amount AS TRANSACTION_AMOUNT, I.IS_TRAN_COMPLETED, I.Incoming_Tran_Id, I.Transmission_Date_Time, I.CurrencyCode,
    C.NOTES_REJECTED, C.NOTES_REMAINING, C.NOTES_DISPENSED, C.NOTES_JAMMED, C.NOTES_DENOMINATION,
    T.TRANSACTION_DESC, 
    CU.CURRENCY_DESC
FROM 
    ATM A
INNER JOIN 
    ATM_TYPE AT ON A.ATM_TYPE_ID = AT.ATM_TYPE_ID
INNER JOIN 
    Declined_Tran_Log D ON A.ATM_ID = D.ATM_ID
INNER JOIN 
    LAST_TRAN_STATUS L ON A.ATM_ID = L.ATM_ID
INNER JOIN 
    LAST_TRAN_STATUS_TYPE LT ON L.Last_Tran_Status_Type_Id = LT.Last_Tran_Status_Type_Id
INNER JOIN 
    INCOMING_TRANSACTION I ON A.ATM_ID = I.ATM_ID
INNER JOIN 
    ATM_DEVICE ON A.ATM_ID = ATM_DEVICE.ATM_ID
INNER JOIN 
    CASH_HANDLER C ON C.DEVICE_ID = ATM_DEVICE.DEVICE_ID
INNER JOIN 
    CURRENCY CU ON C.CURRENCY_ID = CU.CURRENCY_ID
INNER JOIN 
    ATM_PROTOCOL ON AT.ATM_PROTOCOL_ID = ATM_PROTOCOL.ATM_PROTOCOL_ID
INNER JOIN 
    CONT_RECEIPT ON ATM_PROTOCOL.ATM_PROTOCOL_ID = CONT_RECEIPT.ATM_PROTOCOL_ID
INNER JOIN 
    TRAN_SET ON CONT_RECEIPT.SET_ID = TRAN_SET.SET_ID
INNER JOIN 
    PRE_PROCESSING ON PRE_PROCESSING.SET_ID = TRAN_SET.SET_ID
INNER JOIN 
    TRANSACTION_CODE T ON T.TRANSACTION_CODE_ID = PRE_PROCESSING.TRANSACTION_CODE_ID;
GO
/****** Object:  Table [dbo].[BNA]    Script Date: 11/21/2024 1:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BNA](
	[ATM_ID] [int] NOT NULL,
	[DEVICE_ID] [int] NOT NULL,
	[NOTES_REFUNDED] [int] NULL,
	[NOTES_REJECTED] [int] NULL,
	[NOTES_ENCASHED] [int] NULL,
	[NOTES_ESCROW] [int] NULL,
 CONSTRAINT [PK92] PRIMARY KEY NONCLUSTERED 
(
	[ATM_ID] ASC,
	[DEVICE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATM] ADD  CONSTRAINT [DF__ATM__CREATED_ON__7F60ED59]  DEFAULT (getdate()) FOR [CREATED_ON]
GO
ALTER TABLE [dbo].[ATM] ADD  CONSTRAINT [DF__ATM__UPDATED_ON__00551192]  DEFAULT (getdate()) FOR [UPDATED_ON]
GO
ALTER TABLE [dbo].[ATM] ADD  CONSTRAINT [DF__ATM__TIME_ZONE_I__13F1F5EB]  DEFAULT ((1)) FOR [TIME_ZONE_ID]
GO
ALTER TABLE [dbo].[ATM] ADD  DEFAULT ((0)) FOR [IS_ACTIVE]
GO
ALTER TABLE [dbo].[ATM] ADD  CONSTRAINT [Signature_A1_Default]  DEFAULT ('75A2513956F348BFA85661329BFC92D801C52DD6E72254E39F3D46168A1251BC8B0F67864A1AAA206D01342C2F09A16FB4E5AD420FA9F30ADD2F32AE520803D197E43FDFEB24096D526DE38881BD6D6C2ECF9BE63DD0C8BA0E4D1483B00C65AB408CE372526B8132B6FE2D2999BABBABFAC3AEFBC4C866DD80ABBEB75064BAE628114D82425BC2170517BE80BE67347AF18F51A86A2C19854B7104E0C68497E4138A2488B74FEAF1869A57FDAF9756FD952A414E048C8CC6F6B2010D1C59A7F4BC765E21DA7CAE5B254A941CCF8EBFA31E3385F2C9D6F58473204591D940BD30A87ACC9CC37AC98329FFEC5EC73CB6CC34AC4E241B6E7339499087D43F3312AD') FOR [Signature_A1]
GO
ALTER TABLE [dbo].[ATM] ADD  CONSTRAINT [Signature_A2_Default]  DEFAULT ('79307AD3952F635E3E7260888C8287911D721CEFB166A4868F7BC6A4CE4F97D5499AE805EEB50E6A884519E1DBB9453BCA79D76B0B603CE7CD26CE9AAECCED58319C692BF8CC1854368666991D80E9DF40C2543C9276B4C16F2F38697DB0BE7D6B141DAB74871876E1306B97049AE292B53D781BC9DBD12B1A809415E986D215C922E3421F0A1549AAE8A89F5FDDEB1BD6085E76A6E73D4DE3FD5D86354385E380D8CE4596EE672CE7469E06E227082D01EE221CFD287A6CC51A0835C15827675F8B4078B742CD72BEB9C20A269D22D8388E3B21E390043807625CE0D8ABFD1BB32CB319FC99324453E6571D42674F91F549D680FFFFF175B63DD693E868E880') FOR [Signature_A2]
GO
ALTER TABLE [dbo].[ATM] ADD  CONSTRAINT [NCR_PK_Default]  DEFAULT ('3082010A0282010100BC2E663C1B0B5EAD279CE9CB6EA46144153E002A9A6209A28132802AC4DBADCF3902ECFA5974FBC2F3778D790CFDDD7F77AD7E541BE9B4E5CF2F4EE4287105090EA75C863E072D033D3348100FD915012D807593C3FB5F940B4BB4168837C3FC8B34C16D4E80E8FB666AEB08529B0D7E50F1EE5376EE6C3906E9F7643C472598C6657B8D290EDE2266801B7C07D144E336FAAD3DA6A14595BBC5C3FA18835E534007C7E5898A61E2CAB64277C83EED94EB45866452F2E9187436323D0711D9A1B017345B8DEFCCABA840F6D597A2AFAE71A9DA5012890A7BA6D84B15589E8D5AAE072DE17AB55F35DC866BD1928FDD73868B80C721ED43B2F767D0D36CD397F90203010001') FOR [NCR_PK]
GO
ALTER TABLE [dbo].[ATM] ADD  CONSTRAINT [NCR_SUB_PK_Default]  DEFAULT ('3082010A028201010089EBB5222AE3E60F558B4502954F5748FC8950EBC9AD7F60A6AE133E599992C6B4F09D62944691D4565F8BA67CD6605A8A871A685E2AF19598AAC10DE75222007B6FB5C96AA79CA3C9C3A36FB8F1039F78A5B7001A35F6D2F884FDE45B9A4E42707CE2239EAF7257434C7B2A0CC7D5FF230F83B3BF4E7F23C1DA6B68CE2F620AD70878BB08C3FC8906D4F826D8A49910B155042C3DFC6C6EF8727E569742AF0B7968DE27B87156A352344DBE5BFDA7C2FEC67C7F892DD5E20564A2908D1EC79FD04EAE5C534526B00B6FA85DB1BFE7A3E6BA195A169069A8D24E7C2027E7A49318B6C054084A556DF89B04F79577029C241ACDA1ABE61A97D7B449D286503DE90203010001') FOR [NCR_SUB_PK]
GO
ALTER TABLE [dbo].[ATM] ADD  CONSTRAINT [HSM_PK_Default]  DEFAULT ('3082010A0282010100BDD6A970C0A69B86C47D88825CA3E09AD65C2B1C6E086EB801EBE263B5085AFC367816747698EEC887380EBF51EE8B6A03BA5FBDCEED4A63A73AD19AE8CAE008EA50AAD76EF8E3DBFC854073E2113D59808813AA0312AAF3691A1C427C819E1F3E4D2E81101E5F515327F5671CF2A713BCA6EB92ADFF3E290D3CEC26AAB4EFB9BB7DE392A4A677C9C5EA0B3E1075897A29CDBC5B56AC532D0A4DF7D59F441905E245D58F555861F6CD6D7802343685F2D7C6DBF9FBB6230BBCFBEDBCD26E2C546BFE5B4F295785F1C346463BE6558383E37928DA5A1335991DF1D522F821E99EFCABD157E7E9774BF97C75821B353E906732E16D55E3A41F85A30DC7171587A50203010001') FOR [HSM_PK]
GO
ALTER TABLE [dbo].[ATM] ADD  CONSTRAINT [HSM_SK_Default]  DEFAULT ('B4B01862B48C574D7F0215560656ED2AE2A744D943026DBA788F869436CC37476491E07B731F57D0C58247D605F724981FC7129B3E9138B9DFBFC87ECC8EA1717E6EA21277CA2D9F174AEA1A9A34E9C2AA664702511EA3579461FB5D13BCBBC0664E4729F38CE25C164D0B5A8A66BB5037FA4EAEE9ADDEE7A1F3EC89781929754F72C7D18190E3A8FD0800CEFC88332D0C93DA9B202FFE542D9A3BC3A0820AF95D688FC3AAC28EAC944DEB0AFE38925F25AEF9691B8FE47903542CE373A7CF01CF31E135A83BFB4CE6BA78DB61290D796FC33E6C103D647CAF735AC299243EE44FB7F44CF8234AD1EF27C5AE537AB1584902B955ADDAC7072EDD9921F6236A14E150B463D715BD6BCFC60C8F9C42178CA26C78842A3E89DACF16B42D4D950DC59E17D562D5CC489CD002018D8ABF10D068E4C78867ECE06E39249FBECB7608C81D9C96B5A4663DBDBE19750EAC8C2CE691D97AACD7ABEC8CA030E008E38369F2C9850AABF05771F5BC214619B7D5B2CE7B05139C54830A5C774B55373EDBD317CE2D4B6FAB1C7952B7D1BB3F45035367E9D5708690F3C6CA41A22E3E6D8CC903D8AC797E710CC0B6B1285AD158AA3168F5484851B94D0852942DE336E0B92BCF18DDCDEC0A8E2AF63E170591D9F05DACD8F26C082C619C77B0892F3D137F3E351C1A4249B60D2BEC6EE0E43480641EAEE0A040BEF8075BE0C17C21E6104A22C5D3963BF3E1D99AAFA1CA4B31B62FCBC998FAF3D90BE7F0F6E6741936C81ABE8C19D8F266D6D2BCBE3E4EEA12295E895585C5A56F7E0B0EF06D9CA08B93DE259049F17B4BFF1E6217B62411A5EBEB27D139295C8BE64AC43D2AF3C393EAB30E9B58E5141C54B71E7E68A72BCB12C94494F383B3C5D71C59AB176C367C6133EDDC92AD76CE12CACE9F5B46B545D060A3A9') FOR [HSM_SK]
GO
ALTER TABLE [dbo].[ATM_PROTOCOL] ADD  DEFAULT (NULL) FOR [CONFIG_PATH]
GO
ALTER TABLE [dbo].[ATM_TYPE] ADD  DEFAULT (getdate()) FOR [CREATED_ON]
GO
ALTER TABLE [dbo].[ATM_TYPE] ADD  DEFAULT (getdate()) FOR [UPDATED_ON]
GO
ALTER TABLE [dbo].[CASH_HANDLER] ADD  DEFAULT (getdate()) FOR [CREATED_ON]
GO
ALTER TABLE [dbo].[CASH_HANDLER] ADD  DEFAULT (getdate()) FOR [UPDATED_ON]
GO
ALTER TABLE [dbo].[CASH_HANDLER] ADD  CONSTRAINT [DF_CASH_HANDLER_NOTES_REJECTED]  DEFAULT ((0)) FOR [NOTES_REJECTED]
GO
ALTER TABLE [dbo].[CASH_HANDLER] ADD  CONSTRAINT [DF_CASH_HANDLER_NOTES_REMAINING]  DEFAULT ((0)) FOR [NOTES_REMAINING]
GO
ALTER TABLE [dbo].[CASH_HANDLER] ADD  CONSTRAINT [DF_CASH_HANDLER_NOTES_DISPENSED]  DEFAULT ((0)) FOR [NOTES_DISPENSED]
GO
ALTER TABLE [dbo].[CASH_HANDLER] ADD  CONSTRAINT [DF_CASH_HANDLER_NOTES_JAMMED]  DEFAULT ((0)) FOR [NOTES_JAMMED]
GO
ALTER TABLE [dbo].[CASH_HANDLER] ADD  CONSTRAINT [DF_CASH_HANDLER_NOTES_DENOMINATION]  DEFAULT ((0)) FOR [NOTES_DENOMINATION]
GO
ALTER TABLE [dbo].[ATM]  WITH CHECK ADD  CONSTRAINT [RefATM_TYPE150] FOREIGN KEY([ATM_TYPE_ID])
REFERENCES [dbo].[ATM_TYPE] ([ATM_TYPE_ID])
GO
ALTER TABLE [dbo].[ATM] CHECK CONSTRAINT [RefATM_TYPE150]
GO
ALTER TABLE [dbo].[ATM_DEVICE]  WITH CHECK ADD  CONSTRAINT [RefATM41] FOREIGN KEY([ATM_ID])
REFERENCES [dbo].[ATM] ([ATM_ID])
GO
ALTER TABLE [dbo].[ATM_DEVICE] CHECK CONSTRAINT [RefATM41]
GO
ALTER TABLE [dbo].[ATM_TYPE]  WITH CHECK ADD  CONSTRAINT [RefATM_PROTOCOL178] FOREIGN KEY([ATM_PROTOCOL_ID])
REFERENCES [dbo].[ATM_PROTOCOL] ([ATM_PROTOCOL_ID])
GO
ALTER TABLE [dbo].[ATM_TYPE] CHECK CONSTRAINT [RefATM_PROTOCOL178]
GO
ALTER TABLE [dbo].[BNA]  WITH CHECK ADD  CONSTRAINT [RefATM_DEVICE173] FOREIGN KEY([ATM_ID], [DEVICE_ID])
REFERENCES [dbo].[ATM_DEVICE] ([ATM_ID], [DEVICE_ID])
GO
ALTER TABLE [dbo].[BNA] CHECK CONSTRAINT [RefATM_DEVICE173]
GO
ALTER TABLE [dbo].[CASH_HANDLER]  WITH CHECK ADD  CONSTRAINT [RefATM_DEVICE76] FOREIGN KEY([ATM_ID], [DEVICE_ID])
REFERENCES [dbo].[ATM_DEVICE] ([ATM_ID], [DEVICE_ID])
GO
ALTER TABLE [dbo].[CASH_HANDLER] CHECK CONSTRAINT [RefATM_DEVICE76]
GO
ALTER TABLE [dbo].[CASH_HANDLER]  WITH CHECK ADD  CONSTRAINT [RefCURRENCY169] FOREIGN KEY([CURRENCY_ID])
REFERENCES [dbo].[CURRENCY] ([CURRENCY_ID])
GO
ALTER TABLE [dbo].[CASH_HANDLER] CHECK CONSTRAINT [RefCURRENCY169]
GO
ALTER TABLE [dbo].[CONT_RECEIPT]  WITH CHECK ADD  CONSTRAINT [Atm_protocol001] FOREIGN KEY([ATM_PROTOCOL_ID])
REFERENCES [dbo].[ATM_PROTOCOL] ([ATM_PROTOCOL_ID])
GO
ALTER TABLE [dbo].[CONT_RECEIPT] CHECK CONSTRAINT [Atm_protocol001]
GO
ALTER TABLE [dbo].[CONT_RECEIPT]  WITH CHECK ADD  CONSTRAINT [RefTRAN_SET139] FOREIGN KEY([SET_ID])
REFERENCES [dbo].[TRAN_SET] ([SET_ID])
GO
ALTER TABLE [dbo].[CONT_RECEIPT] CHECK CONSTRAINT [RefTRAN_SET139]
GO
ALTER TABLE [dbo].[Declined_Tran_Log]  WITH CHECK ADD  CONSTRAINT [RefATM195] FOREIGN KEY([ATM_ID])
REFERENCES [dbo].[ATM] ([ATM_ID])
GO
ALTER TABLE [dbo].[Declined_Tran_Log] CHECK CONSTRAINT [RefATM195]
GO
ALTER TABLE [dbo].[INCOMING_TRANSACTION]  WITH CHECK ADD  CONSTRAINT [RefATM194] FOREIGN KEY([ATM_ID])
REFERENCES [dbo].[ATM] ([ATM_ID])
GO
ALTER TABLE [dbo].[INCOMING_TRANSACTION] CHECK CONSTRAINT [RefATM194]
GO
ALTER TABLE [dbo].[LAST_TRAN_STATUS]  WITH CHECK ADD  CONSTRAINT [RefATM193] FOREIGN KEY([ATM_ID])
REFERENCES [dbo].[ATM] ([ATM_ID])
GO
ALTER TABLE [dbo].[LAST_TRAN_STATUS] CHECK CONSTRAINT [RefATM193]
GO
ALTER TABLE [dbo].[LAST_TRAN_STATUS]  WITH CHECK ADD  CONSTRAINT [RefLAST_TRAN_STATUS_TYPE192] FOREIGN KEY([Last_Tran_Status_Type_Id])
REFERENCES [dbo].[LAST_TRAN_STATUS_TYPE] ([Last_Tran_Status_Type_Id])
GO
ALTER TABLE [dbo].[LAST_TRAN_STATUS] CHECK CONSTRAINT [RefLAST_TRAN_STATUS_TYPE192]
GO
ALTER TABLE [dbo].[PRE_PROCESSING]  WITH CHECK ADD  CONSTRAINT [RefTRAN_SET121] FOREIGN KEY([SET_ID])
REFERENCES [dbo].[TRAN_SET] ([SET_ID])
GO
ALTER TABLE [dbo].[PRE_PROCESSING] CHECK CONSTRAINT [RefTRAN_SET121]
GO
ALTER TABLE [dbo].[PRE_PROCESSING]  WITH CHECK ADD  CONSTRAINT [RefTRANSACTION_CODE119] FOREIGN KEY([TRANSACTION_CODE_ID])
REFERENCES [dbo].[TRANSACTION_CODE] ([TRANSACTION_CODE_ID])
GO
ALTER TABLE [dbo].[PRE_PROCESSING] CHECK CONSTRAINT [RefTRANSACTION_CODE119]
GO
USE [master]
GO
ALTER DATABASE [ATM_DB] SET  READ_WRITE 
GO
