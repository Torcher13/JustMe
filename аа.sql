USE [master]
GO
/****** Object:  Database [Абоненты13]    Script Date: 21.12.2021 11:48:23 ******/
CREATE DATABASE [Абоненты13]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Абоненты13', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Абоненты13.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Абоненты13_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Абоненты13_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Абоненты13] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Абоненты13].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Абоненты13] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Абоненты13] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Абоненты13] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Абоненты13] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Абоненты13] SET ARITHABORT OFF 
GO
ALTER DATABASE [Абоненты13] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Абоненты13] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Абоненты13] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Абоненты13] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Абоненты13] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Абоненты13] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Абоненты13] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Абоненты13] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Абоненты13] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Абоненты13] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Абоненты13] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Абоненты13] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Абоненты13] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Абоненты13] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Абоненты13] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Абоненты13] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Абоненты13] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Абоненты13] SET RECOVERY FULL 
GO
ALTER DATABASE [Абоненты13] SET  MULTI_USER 
GO
ALTER DATABASE [Абоненты13] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Абоненты13] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Абоненты13] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Абоненты13] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Абоненты13] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Абоненты13', N'ON'
GO
ALTER DATABASE [Абоненты13] SET QUERY_STORE = OFF
GO
USE [Абоненты13]
GO
/****** Object:  Table [dbo].[Абоненты]    Script Date: 21.12.2021 11:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Абоненты](
	[Код_абонента] [int] NOT NULL,
	[ФИО] [varchar](100) NULL,
	[Адрес] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Абоненты] PRIMARY KEY CLUSTERED 
(
	[Код_абонента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Город]    Script Date: 21.12.2021 11:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Город](
	[Код_города] [int] NOT NULL,
	[Код_тарифа] [int] NULL,
	[Название_города] [varchar](25) NULL,
 CONSTRAINT [PK_Город] PRIMARY KEY CLUSTERED 
(
	[Код_города] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Разговоры]    Script Date: 21.12.2021 11:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Разговоры](
	[Код_разговора] [int] NOT NULL,
	[Дата] [date] NULL,
	[Город_звонящего] [varchar](25) NULL,
	[Город_принимающего] [varchar](25) NULL,
	[Продолжительность] [int] NULL,
	[Оплата] [varchar](50) NULL,
 CONSTRAINT [PK_Разговоры] PRIMARY KEY CLUSTERED 
(
	[Код_разговора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тарифы]    Script Date: 21.12.2021 11:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тарифы](
	[Код_тарифа] [int] NOT NULL,
	[Стоимость] [int] NULL,
	[Описание] [varchar](100) NULL,
 CONSTRAINT [PK_Тарифы] PRIMARY KEY CLUSTERED 
(
	[Код_тарифа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Телефоны_абонентов]    Script Date: 21.12.2021 11:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Телефоны_абонентов](
	[Код_абонента] [int] NOT NULL,
	[Номер_телефона] [nvarchar](20) NOT NULL,
	[Дата_установки] [date] NULL,
	[Номер_договора] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Телефоны_абонентов] PRIMARY KEY CLUSTERED 
(
	[Номер_телефона] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Абоненты] ([Код_абонента], [ФИО], [Адрес]) VALUES (1, N'Орлов 
Сергей Борисович
', N'г.Омск, ул. Мира, 54,4')
INSERT [dbo].[Абоненты] ([Код_абонента], [ФИО], [Адрес]) VALUES (3, N'Вавилов
Сергей Борисович
', N'Г. Омск, пр.Маркса, 34,23')
INSERT [dbo].[Абоненты] ([Код_абонента], [ФИО], [Адрес]) VALUES (4, N'Титова Александра Ивановна', N'г. Омск, ул. Ленина, 5,24')
GO
INSERT [dbo].[Город] ([Код_города], [Код_тарифа], [Название_города]) VALUES (1, 10, N'Омск')
INSERT [dbo].[Город] ([Код_города], [Код_тарифа], [Название_города]) VALUES (2, 30, N'Москва')
INSERT [dbo].[Город] ([Код_города], [Код_тарифа], [Название_города]) VALUES (3, 20, N'Воронеж')
INSERT [dbo].[Город] ([Код_города], [Код_тарифа], [Название_города]) VALUES (4, 10, N'Новосибирск')
INSERT [dbo].[Город] ([Код_города], [Код_тарифа], [Название_города]) VALUES (5, 30, N'Санкт-Петербург')
GO
INSERT [dbo].[Разговоры] ([Код_разговора], [Дата], [Город_звонящего], [Город_принимающего], [Продолжительность], [Оплата]) VALUES (1, CAST(N'2021-03-02' AS Date), N'Омск', N'Омск', 12, N'Не оплачено')
INSERT [dbo].[Разговоры] ([Код_разговора], [Дата], [Город_звонящего], [Город_принимающего], [Продолжительность], [Оплата]) VALUES (2, CAST(N'2021-03-02' AS Date), N'Омск', N'Новосибирск', 2, N'Оплачено')
INSERT [dbo].[Разговоры] ([Код_разговора], [Дата], [Город_звонящего], [Город_принимающего], [Продолжительность], [Оплата]) VALUES (3, CAST(N'2021-03-08' AS Date), N'Омск', N'Воронеж', 15, N'Оплачено')
INSERT [dbo].[Разговоры] ([Код_разговора], [Дата], [Город_звонящего], [Город_принимающего], [Продолжительность], [Оплата]) VALUES (4, CAST(N'2021-03-08' AS Date), N'Омск', N'Воронеж', 5, N'Оплачено')
INSERT [dbo].[Разговоры] ([Код_разговора], [Дата], [Город_звонящего], [Город_принимающего], [Продолжительность], [Оплата]) VALUES (5, CAST(N'2021-03-15' AS Date), N'Омск', N'Санкт-Петербург', 10, N'Оплачено')
INSERT [dbo].[Разговоры] ([Код_разговора], [Дата], [Город_звонящего], [Город_принимающего], [Продолжительность], [Оплата]) VALUES (6, CAST(N'2021-03-15' AS Date), N'Омск', N'Омск', 1, N'Не оплачено')
INSERT [dbo].[Разговоры] ([Код_разговора], [Дата], [Город_звонящего], [Город_принимающего], [Продолжительность], [Оплата]) VALUES (7, CAST(N'2021-03-15' AS Date), N'Омск', N'Омск', 10, N'Не оплачено')
INSERT [dbo].[Разговоры] ([Код_разговора], [Дата], [Город_звонящего], [Город_принимающего], [Продолжительность], [Оплата]) VALUES (8, CAST(N'2021-03-15' AS Date), N'Омск', N'Москва', 1, N'Оплачено')
INSERT [dbo].[Разговоры] ([Код_разговора], [Дата], [Город_звонящего], [Город_принимающего], [Продолжительность], [Оплата]) VALUES (9, CAST(N'2021-03-23' AS Date), N'Омск', N'Воронеж', 6, N'Оплачено')
INSERT [dbo].[Разговоры] ([Код_разговора], [Дата], [Город_звонящего], [Город_принимающего], [Продолжительность], [Оплата]) VALUES (10, CAST(N'2021-04-01' AS Date), N'Омск', N'Воронеж', 3, N'Не оплачено')
INSERT [dbo].[Разговоры] ([Код_разговора], [Дата], [Город_звонящего], [Город_принимающего], [Продолжительность], [Оплата]) VALUES (11, CAST(N'2021-04-01' AS Date), N'Омск', N'Воронеж', 3, N'Оплачено')
GO
INSERT [dbo].[Тарифы] ([Код_тарифа], [Стоимость], [Описание]) VALUES (1, 20, N'')
INSERT [dbo].[Тарифы] ([Код_тарифа], [Стоимость], [Описание]) VALUES (2, 10, N'')
INSERT [dbo].[Тарифы] ([Код_тарифа], [Стоимость], [Описание]) VALUES (3, 30, N'')
GO
INSERT [dbo].[Телефоны_абонентов] ([Код_абонента], [Номер_телефона], [Дата_установки], [Номер_договора]) VALUES (1, N'(3812)326789', CAST(N'1996-01-01' AS Date), N'2378Ф')
INSERT [dbo].[Телефоны_абонентов] ([Код_абонента], [Номер_телефона], [Дата_установки], [Номер_договора]) VALUES (4, N'(3812)333490', CAST(N'2012-10-09' AS Date), N'3465Ф')
INSERT [dbo].[Телефоны_абонентов] ([Код_абонента], [Номер_телефона], [Дата_установки], [Номер_договора]) VALUES (1, N'(3812)531178', CAST(N'2004-08-04' AS Date), N'4523В')
INSERT [dbo].[Телефоны_абонентов] ([Код_абонента], [Номер_телефона], [Дата_установки], [Номер_договора]) VALUES (4, N'(3812)951211', CAST(N'2012-10-09' AS Date), N'3466Ф')
INSERT [dbo].[Телефоны_абонентов] ([Код_абонента], [Номер_телефона], [Дата_установки], [Номер_договора]) VALUES (3, N'(3812)953412', CAST(N'2013-01-01' AS Date), N'99345Р')
GO
ALTER TABLE [dbo].[Тарифы]  WITH CHECK ADD  CONSTRAINT [FK_Тарифы_Город] FOREIGN KEY([Код_тарифа])
REFERENCES [dbo].[Город] ([Код_города])
GO
ALTER TABLE [dbo].[Тарифы] CHECK CONSTRAINT [FK_Тарифы_Город]
GO
ALTER TABLE [dbo].[Телефоны_абонентов]  WITH CHECK ADD  CONSTRAINT [FK_Телефоны_абонентов_Абоненты] FOREIGN KEY([Код_абонента])
REFERENCES [dbo].[Абоненты] ([Код_абонента])
GO
ALTER TABLE [dbo].[Телефоны_абонентов] CHECK CONSTRAINT [FK_Телефоны_абонентов_Абоненты]
GO
USE [master]
GO
ALTER DATABASE [Абоненты13] SET  READ_WRITE 
GO
