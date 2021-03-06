/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT IF EXISTS [FK_LessonViews_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT IF EXISTS [FK_LessonViews_Lessons]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
ALTER TABLE [dbo].[Lessons] DROP CONSTRAINT IF EXISTS [FK_Lessons_Courses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT IF EXISTS [FK_CourseCompletions_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT IF EXISTS [FK_CourseCompletions_Courses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 2/3/2021 9:21:36 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 2/3/2021 9:21:36 AM ******/
DROP TABLE IF EXISTS [dbo].[LessonViews]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 2/3/2021 9:21:36 AM ******/
DROP TABLE IF EXISTS [dbo].[Lessons]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2/3/2021 9:21:36 AM ******/
DROP TABLE IF EXISTS [dbo].[Courses]
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 2/3/2021 9:21:36 AM ******/
DROP TABLE IF EXISTS [dbo].[CourseCompletions]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/3/2021 9:21:36 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/3/2021 9:21:36 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/3/2021 9:21:36 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/3/2021 9:21:36 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/3/2021 9:21:36 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/3/2021 9:21:36 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/3/2021 9:21:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/3/2021 9:21:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/3/2021 9:21:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/3/2021 9:21:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/3/2021 9:21:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/3/2021 9:21:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 2/3/2021 9:21:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CourseCompletions](
	[CourseCompletionId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[CourseId] [int] NOT NULL,
	[DateCompleted] [date] NOT NULL,
 CONSTRAINT [PK_CourseCompletions] PRIMARY KEY CLUSTERED 
(
	[CourseCompletionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2/3/2021 9:21:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](200) NOT NULL,
	[CourseDescription] [varchar](500) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 2/3/2021 9:21:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lessons](
	[LessonId] [int] IDENTITY(1,1) NOT NULL,
	[LessonTitle] [varchar](200) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Introduction] [varchar](300) NULL,
	[VideoURL] [varchar](250) NULL,
	[PdfFilename] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[LessonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 2/3/2021 9:21:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LessonViews](
	[LessonViewId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[LessonId] [int] NOT NULL,
	[DateViewed] [date] NOT NULL,
 CONSTRAINT [PK_LessonViews] PRIMARY KEY CLUSTERED 
(
	[LessonViewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 2/3/2021 9:21:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202101252026423_InitialCreate', N'LMSProject.UI.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FEB36127E5FA0FF41D053BB48AD5CF61C9C0DEC16A9937483CD0DC749B16F07B4443BEA912855A2D2048BFEB27DD89FB47F618712258B375D6CC5768A031C58E4F09BE170480E87C3FCEF3FFF1DFFF81206D6334E523F2213FB6874685B98B891E793E5C4CEE8E2FB4FF68F3F7CF397F18517BE58BF9474278C0E5A9274623F511A9F3A4EEA3EE110A5A3D07793288D1674E446A183BCC8393E3CFCBB7374E46080B001CBB2C69F3342FD10E71FF0398D888B639AA1E026F27090F272A899E5A8D62D0A711A23174FECEB9BD97D12FD8A5D3A7ABC1A15F4B67516F8086499E160615B889088220A929E3EA6784693882C673114A0E0E135C640B740418A790F4E57E45D3B7378CC3AE3AC1A96506E96D228EC097874C2B5E3C8CDD7D2B15D690FF477017AA6AFACD7B90E27F69587F3A2CF51000A90199E4E8384114FEC9B8AC5591ADF623A2A1B8E0AC8CB04E07E8F92AFA33AE281D5B9DD41654DC7A343F6EFC09A6601CD123C2138A3090A0EACFB6C1EF8EE3FF1EB43F41593C9C9D17C71F2E9C347E49D7CFC1B3EF950EF29F415E8840228024B897102B2E145D57FDB72C4768EDCB06A566B5368056C0926866DDDA0976B4C96F409A6CCF127DBBAF45FB0579670E37A243ECC236844930C3E6FB32040F30057F54E234FF67F03D7E30F1F07E17A8B9EFD653EF4127F983809CCABCF38C86BD3273F2EA69730DE5F38D9651285EC5BB4AFA2F6CB2CCA1297752632923CA06489A928DDD859196F27936650C39B7589BAFFA6CD2455CD5B4BCA3AB4CE4C28596C7B3694F2BE2DDFCE167716C73078B969318D34199C6EBB1A49ED0F2C816A653E475DCD8740B7FECCABE14588FC6080E5B00317F045167E12E2AA973F45607C88F496F91EA529AC06DE3F50FAD4203AFC1C40F41976B3048C74465118BF39B7FBA788E0DB2C9C33DBDF1EAFC186E6E1F7E812B9344A2E086BB531DE75E47E8D327A41BC7344F123754B40F6F9E087DD010611E7CC75719A5E8231636F1A81AB5D025E117A72DC1B8E2D51BB7647A601F243BD3F222DA65F4AD2954FA2A750FC120399CE376912F53A5AFAA49BA825A959D482A255544ED6575406D64D524E691634276895B3A01ACCDBCB476878772F87DD7F7F6FB3CDDBB416D4D438831512FF8C094E6019F3EE11A53821AB11E8B26EECC259C8878F317DF3BD29E7F40B0AB2A159AD351BF24560F8D990C3EEFF6CC8C584E267DF635E49874350490CF09DE8F5E7ABF6392749B6EDE9207473DBCCB7B30698A6CB599A46AE9FCF024DF88B072F44F9C187B3DA2319456FE46808740C0CDD675B1E9440DF6CD9A8EEC8390E30C5D6995B8407A7287591A7AA113AE4F510ACDC513582ADA222A2707F557882A5E3843542EC1094C24CF50955A7854F5C3F4641AB96A4961DB730D6F78A875C738E634C18C3564D7461AE0F8230012A3ED2A0B46968ECD42CAED9100D5EAB69CCDB5CD8D5B82BB189ADD8648BEF6CB04BEEBFBD8961366B6C0BC6D9AC922E0218037ABB30507E56E96A00F2C165DF0C543A31190C94BB545B315051633B30505125EFCE408B236AD7F197CEABFB669EE24179FBDB7AA3BA76609B823EF6CC340BDF13DA50688113D53CCFE7AC12BF50CDE10CE4E4E7B394BBBAB28930F019A662C866E5EF6AFD50A7194436A226C095A1B580F2AB40054899503D842B63798DD2712FA2076C19776B84E56BBF045BB30115BB7E255A23345F9CCAC6D9E9F451F5ACB206C5C83B1D166A381A8390172FB1E31D94628ACBAA8AE9E20BF7F1866B1DE383D1A0A016CFD5A0A4B233836BA934CD762DE91CB23E2ED9465A92DC278396CACE0CAE256EA3ED4AD238053DDC828D54246EE1034DB632D251ED3655DDD82972A578C1D83124558D6F501CFB64594BB2E225D6ACC8B09A7E3FEB9F781416188E9B6AF28F2A692B4E344AD0124BB5C01A24BDF493949E238AE688C579A65EA89069F756C3F25FB2AC6F9FEA2096FB4049CD7EF3E89DEE025FD86D557784A35C421F43E6D3E481748D05E89B5B2CED0D0528D1C4EEA7519085C4EC62995B173778F5F645898A307624F915174AD197E2E88ACAEF3434EAB4186C982A1F66FDA1324398145E7AA075959BBC52334A19A4AAA39802573B1B3A9333D373B8644FB1FF68B522BCCDDCE2E92975005ED413A396E1A080D5EABAA38A4928754CB1A63BA29469528794AA7A4859CF271184AC57AC8567D0A89EA23B073583A48EAED67647D6E492D4A135D56B606B6496EBBAA36AD24DEAC09AEAEED8ABDC137919DDE3DDCB787ED960FB2A0EB99BED5F068CB7591387D9FE6A77F975A05A714F2C7E5BAF80F1F2BDB427E3496F037B2AA21B9BD99301C3BCFA08F7E0E2E2D378796FC6142EB78505BEE972DF8CD7CF6ADFD43694A39E4C5271AF8E7CD2D16ECC8F59ED8F6A94735741625BA51A61737F4D290E478C6034FB2D98063E664B7949708388BFC0292D123AECE3C3A363E955CEFEBC9071D2D40B34C754D3331971CCB6909B459E51E23EA144CD94D8E015C90A5409425F110FBF4CEC7FE7AD4EF37806FB95171F5857E923F17FCBA0E221C9B0F5879AF9394C567D87771C95A07FBC8B0712DD557EF5AF2F45D303EB2E81E9746A1D4A8A5E67F8C56713BDA4299A6E20CDDA8F29DEEF6C135E296851A5D9B2FEA384B94F077990504AF96D885EBEEB2B9AF6D1C146889A870543E10DA242D3C38175B08C8F063CF8A4F9A3817E9DD53F22584734E303029FF407939F0F745F86CA963BDC873447A66D2C49B99E5BD3AF37CAC5DCF5DEA464696F34D1D54CEC1E7083665B6FE6A2BCB32CE6C1B64E4D92F260D8BBB4FB37CF4CDE9764E495D3BEDB1CE46DA61D375C2BFDA9B28DF7203F4E93EFB3FB9CE26DDB9A2906BCE78999FD3287F7CCD8F836BFFBFCE06D1B9B2940BCE7C6D62B0B78CF6C6D57FBE78E2DADF316BAF39C5E353DC97097A38B22B7E5EC16217738FECF233082C2A32C9E5AEA93C49A125C5B18AE48CC4CCDD969326365E2287C158A66B6FDFACA37FCC6CE729A66B6869CCE26DE7CFD6FE4CD699A791B322577916DACCD55D46580B7AC634D4954EF29BB58E8494B327B9BCFDA7831FF9E928907518A307B0CB7CBEF27777810950C39757AE40AAB17C5B077D6FE4623ECDFA9BF5C41B0BFD848B02BEC9A15CD155944E5E62D49549248119A1B4C91075BEA5942FD05722954B30074FE563C0FEAB16B9039F6AEC85D46E38C429771380F84801773029AF8E709D1A2CCE3BB987DA5437401C4F459E0FE8EFC94F98157C97DA9890919209877C1C3BD6C2C290BFB2E5F2BA4DB887404E2EAAB9CA2071CC60180A57764869EF13AB281F95DE325725F5711401348FB40886A1F9FFB6899A030E518ABF6F00936EC852F3FFC1F69E66A3CAA540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'61fcb6d4-596f-4ae1-934c-9402658a4c0c', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'efe1acd5-8984-4c18-98a1-878df6d8818c', N'Manager')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'a0e53e1c-601c-403c-a9a0-edf8ef9cc37e', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1bd78b4e-4804-49e6-b10a-acb0cc384ff6', N'61fcb6d4-596f-4ae1-934c-9402658a4c0c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ce16edbe-be51-4064-9cf0-15178aae8881', N'61fcb6d4-596f-4ae1-934c-9402658a4c0c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b847b841-91cf-4c65-adde-c52c8cf64f85', N'a0e53e1c-601c-403c-a9a0-edf8ef9cc37e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd276af4e-364f-47a7-bc79-02378f9a82cd', N'a0e53e1c-601c-403c-a9a0-edf8ef9cc37e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5ca72c55-a6a7-402f-8ea7-004db7a98a47', N'efe1acd5-8984-4c18-98a1-878df6d8818c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1bd78b4e-4804-49e6-b10a-acb0cc384ff6', N'adminAnt@company.com', 0, N'AK+e/iGTWCZa9Qs9FiM+r1KfM1h4UsX2SsnlV7W+aE1HhkayGM2ttKfkl/d9k8C8Jw==', N'7e982c1d-3e85-40be-ae4c-f49c318e509e', NULL, 0, 0, NULL, 1, 0, N'adminAnt@company.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5ca72c55-a6a7-402f-8ea7-004db7a98a47', N'managerManatee@company.com', 0, N'AD4QyvME1Ja32t7Nzfa+zcryCCaFXBlryzsVdoi2AbnFrOKxgF1VtgchIN7odng7iw==', N'7b4c1545-a5d9-4742-abce-e077c7837003', NULL, 0, 0, NULL, 1, 0, N'managerManatee@company.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'812a12f2-6af4-45c3-b8f3-5a0715a175a9', N'berniceBear2@company.com', 0, N'ACQ6KieQJpazCFkvBQAaGjiGk2b2WfgeqdZ372R3MD8mQe00ejeeISgFquWB6fqrLg==', N'c5417fc2-653b-44c1-bb28-1ebbe013e706', NULL, 0, 0, NULL, 1, 0, N'berniceBear2@company.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b847b841-91cf-4c65-adde-c52c8cf64f85', N'userUnicorn@company.com', 0, N'AMsNWHanGCQmSou1GenlUrwv0NCNkFcTDM8J+nnPXts9RxRUH3mJi612TUbALCBRow==', N'c1a7dc40-c6ff-486a-b5f7-b9761f53ac7e', NULL, 0, 0, NULL, 1, 0, N'userUnicorn@company.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ce16edbe-be51-4064-9cf0-15178aae8881', N'jdavidswift@gmail.com', 0, N'AL1M2oDPnxiyv4JUUjfW8SqsM5kgTEPXqqY8zreOE2aTffYhqfItGwC4QRMVa4Is5w==', N'9b186113-d9f3-449c-a645-35e1c5b1d7bb', NULL, 0, 0, NULL, 1, 0, N'jdavidswift@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd276af4e-364f-47a7-bc79-02378f9a82cd', N'danDinosaur@company.com', 0, N'ANSYkS0C7ZOb/M2L0RyU5cIKytMSgDrei1yzcrD2cnp18Tu2kgWPyAixFjkDHlvyVQ==', N'774e8d99-e007-4c43-9514-e39a63d0d17e', NULL, 0, 0, NULL, 1, 0, N'danDinosaur@company.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e19a33e5-ae16-4e0d-b42d-78433a677bd2', N'berniceBear@company.com', 0, N'AIFT1qEwH5XDejnEaHKfUs5quAXiyuXpsYV7xg6BKhNi7DUXQJriW8MyTnMMq1v7jA==', N'2fb6afeb-71c5-47e0-b522-922adad9fca4', NULL, 0, 0, NULL, 1, 0, N'berniceBear@company.com')
SET IDENTITY_INSERT [dbo].[CourseCompletions] ON 

INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (1, N'b847b841-91cf-4c65-adde-c52c8cf64f85', 1, CAST(N'2021-01-28' AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (2, N'b847b841-91cf-4c65-adde-c52c8cf64f85', 4, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (3, N'b847b841-91cf-4c65-adde-c52c8cf64f85', 7, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (4, N'b847b841-91cf-4c65-adde-c52c8cf64f85', 10, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (5, N'b847b841-91cf-4c65-adde-c52c8cf64f85', 8, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (6, N'd276af4e-364f-47a7-bc79-02378f9a82cd', 8, CAST(N'2021-02-01' AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionId], [UserId], [CourseId], [DateCompleted]) VALUES (7, N'd276af4e-364f-47a7-bc79-02378f9a82cd', 10, CAST(N'2021-02-01' AS Date))
SET IDENTITY_INSERT [dbo].[CourseCompletions] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (1, N'Volcanic Ascension Best Practices', N'When a scientist is exploring a volcano, danger is always afoot. In this course we discuss the best practices to ensure you get home safe.', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (2, N'Labratory Accounting', N'This course will help you budget your labratory equipment and needs.', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (3, N'Wilderness Predators: When to run', N'Help identify what predators you might see on your expeditions.', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (4, N'Geoactivity around the world 2021', N'Stay up to date on tectonic plates, earthquakes and more in the world of geology.', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (5, N'Geoactivity around the world 2014', N'Stay up to date on tectonic plates, earthquakes and geology across the world.', 0)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (6, N'Using Alpacas as beasts of burden', N'Going to a hard to reach mountain area? Well then you''ll need this course on how to best use Alpacas to carry your gear.', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (7, N'Science and Culture', N'This course is for when the in-laws are grilling you about the new science fad they heard about. Stay one step ahead with Science and Culutre.', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (8, N'Humpback Whales: Our friends of the sea', N'This course is general information about Humpback Whales', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (9, N'The Dodo: how we can save the species', N'There are only 2 dodos left in existance, and this course will cover how we plan to save the species.', 0)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (10, N'Schmoozing 101: How to impress the big donors', N'A lot of work in science depends on major donors. In this course we will talk about how to get the checks to keep coming in.', 1)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (1, N'General Gear for the Volcanologist', 1, N'A discussion of the gear that will keep you safe on a volcano.', N'https://www.youtube.com/embed/VNGUdObDoLk', N'0b1c9683-1112-4c40-85ae-03884cb45591.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (2, N'How to Save the Dodo', 9, N'The plan for how we are going to save the Dodo from extinction', NULL, N'NoFile.pdf', 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (3, N'Geoactivity 2014', 5, N'The general information regarding geoactivity in 2014', NULL, N'NoFile.pdf', 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (4, N'Dangerous Volcanos ', 1, N'What volcanos are safe to ascend and study, and which ones are not.', NULL, N'16e56ab8-0657-4ad3-8d43-344490e0c6cc.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (5, N'Where there is smoke...', 1, N'This lesson will cover what to look for to see if a dormant volcano is going to be not dormant soon.', N'https://www.youtube.com/embed/VNGUdObDoLk', N'NoFile.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (6, N'Geoactivity 2021', 4, N'The general information regarding geoactivity in 2021', NULL, N'5c0ffec5-1268-4214-8921-213846756746.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (7, N'Labratory Accounting (1954)', 2, N'The lesson associated with the Labratory Course- don''t spend money on worthless things like smoke detectors.', NULL, N'NoFile.pdf', 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (9, N'Labratory Accounting (2018)', 2, N'The lesson associated with the Labratory Course.', NULL, N'a484ca96-e477-4e2e-87ed-ba4530150776.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (10, N'Wilderness and Predators: North America', 3, N'A guide to carnivours creatures in North America', NULL, N'NoFile.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (11, N'Alpacas 101', 6, N'A basic introduction into using Alpacas as packbeasts.', N'https://www.youtube.com/embed/8aIRMRuJr1E', N'NoFile.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (12, N'Alpacas 201', 6, N'A more in depth review on Alpaca behavior.', NULL, N'7d8c4fe6-0610-4f9b-bc90-eb668732b2d7.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (13, N'Science and Culture 2021', 7, N'Information on how to talk to people about pop science that may be in the news.', NULL, N'cf452fc1-ede2-4931-86a8-69d0947c849f.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (14, N'Humpbacks: the Avengers of the Seven Seas', 8, N'Information about encounters with humpback whales where they tried to warn humans of danger.', N'https://www.youtube.com/embed/U_HUiC1dP00', N'NoFile.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (16, N'Schmoozing: Dress to Impress', 10, N'You don''t want to offput potential donors with poor clothing choices. We''ll take you through everything from field gear that you wear in pictures to the museum gala black suit.', NULL, N'5558e353-3b85-4370-a043-755d98f57175.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (18, N'Wolves and such', 3, N'wolves and such are much and such', N'https://www.youtube.com/embed/YXMo5w9aMNs', N'11287a20-56ea-4dc7-97d8-cca7fd71eb74.pdf', 1)
SET IDENTITY_INSERT [dbo].[Lessons] OFF
SET IDENTITY_INSERT [dbo].[LessonViews] ON 

INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (1, N'b847b841-91cf-4c65-adde-c52c8cf64f85', 1, CAST(N'2021-01-28' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (2, N'b847b841-91cf-4c65-adde-c52c8cf64f85', 4, CAST(N'2021-01-28' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (3, N'b847b841-91cf-4c65-adde-c52c8cf64f85', 5, CAST(N'2021-01-28' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (4, N'b847b841-91cf-4c65-adde-c52c8cf64f85', 6, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (5, N'b847b841-91cf-4c65-adde-c52c8cf64f85', 13, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (6, N'b847b841-91cf-4c65-adde-c52c8cf64f85', 16, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (7, N'b847b841-91cf-4c65-adde-c52c8cf64f85', 18, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (8, N'b847b841-91cf-4c65-adde-c52c8cf64f85', 14, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (9, N'd276af4e-364f-47a7-bc79-02378f9a82cd', 16, CAST(N'2021-02-01' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (13, N'd276af4e-364f-47a7-bc79-02378f9a82cd', 14, CAST(N'2021-02-01' AS Date))
SET IDENTITY_INSERT [dbo].[LessonViews] OFF
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'1bd78b4e-4804-49e6-b10a-acb0cc384ff6', N'Ant', N'Adams')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'5ca72c55-a6a7-402f-8ea7-004db7a98a47', N'Manatee', N'Martin')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'b847b841-91cf-4c65-adde-c52c8cf64f85', N'Unicorn', N'Urhorse')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'ce16edbe-be51-4064-9cf0-15178aae8881', N'John', N'Swift')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'd276af4e-364f-47a7-bc79-02378f9a82cd', N'Dan', N'Dinosaur')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_Lessons] FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lessons] ([LessonId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_Lessons]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
