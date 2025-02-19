USE [master]
GO
/****** Object:  Database [Bombones2024]    Script Date: 20/08/2024 16:08:34 ******/
CREATE DATABASE [Bombones2024]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bombones2024', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Bombones2024.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bombones2024_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Bombones2024_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Bombones2024] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bombones2024].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bombones2024] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bombones2024] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bombones2024] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bombones2024] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bombones2024] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bombones2024] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Bombones2024] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bombones2024] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bombones2024] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bombones2024] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bombones2024] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bombones2024] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bombones2024] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bombones2024] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bombones2024] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bombones2024] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bombones2024] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bombones2024] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bombones2024] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bombones2024] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bombones2024] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bombones2024] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bombones2024] SET RECOVERY FULL 
GO
ALTER DATABASE [Bombones2024] SET  MULTI_USER 
GO
ALTER DATABASE [Bombones2024] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bombones2024] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bombones2024] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bombones2024] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Bombones2024] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bombones2024] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Bombones2024] SET QUERY_STORE = OFF
GO
USE [Bombones2024]
GO
/****** Object:  Table [dbo].[Bombones]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bombones](
	[BombonId] [int] IDENTITY(1,1) NOT NULL,
	[NombreBombon] [nvarchar](120) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
	[TipoDeChocolateId] [int] NOT NULL,
	[TipoDeNuezId] [int] NOT NULL,
	[TipoDeRellenoId] [int] NOT NULL,
	[PrecioCosto] [decimal](18, 2) NOT NULL,
	[PrecioVenta] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[NivelDeReposicion] [int] NOT NULL,
	[Imagen] [nvarchar](max) NULL,
	[FabricaId] [int] NOT NULL,
	[Suspendido] [bit] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Bombones] PRIMARY KEY CLUSTERED 
(
	[BombonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cajas]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cajas](
	[CajaId] [int] IDENTITY(1,1) NOT NULL,
	[NombreCaja] [nvarchar](40) NOT NULL,
	[Descripcion] [nvarchar](256) NULL,
	[PrecioCosto] [decimal](18, 2) NOT NULL,
	[PrecioVenta] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[NivelDeReposicion] [int] NOT NULL,
	[Imagen] [nvarchar](max) NULL,
	[Suspendido] [bit] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Cajas] PRIMARY KEY CLUSTERED 
(
	[CajaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudades]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudades](
	[CiudadId] [int] IDENTITY(1,1) NOT NULL,
	[NombreCiudad] [nvarchar](100) NOT NULL,
	[ProvinciaEstadoId] [int] NOT NULL,
	[PaisId] [int] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Ciudades] PRIMARY KEY CLUSTERED 
(
	[CiudadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [int] IDENTITY(1,1) NOT NULL,
	[Documento] [int] NOT NULL,
	[Apellido] [nvarchar](100) NOT NULL,
	[Nombres] [nvarchar](100) NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientesDirecciones]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientesDirecciones](
	[ClienteId] [int] NOT NULL,
	[DireccionId] [int] NOT NULL,
	[TipoDireccionId] [int] NOT NULL,
 CONSTRAINT [PK_ClientesDirecciones] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC,
	[DireccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientesTelefonos]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientesTelefonos](
	[ClienteId] [int] NOT NULL,
	[TelefonoId] [int] NOT NULL,
	[TipoTelefonoId] [int] NULL,
 CONSTRAINT [PK_ClientesTelefonos_1] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC,
	[TelefonoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompaniasEnvios]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompaniasEnvios](
	[CompaniaEnvioId] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompania] [nvarchar](120) NOT NULL,
 CONSTRAINT [PK_CompaniasEnvios] PRIMARY KEY CLUSTERED 
(
	[CompaniaEnvioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesCajas]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesCajas](
	[DetalleCajaId] [int] IDENTITY(1,1) NOT NULL,
	[CajaId] [int] NOT NULL,
	[BombonId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_DetallesCajas] PRIMARY KEY CLUSTERED 
(
	[DetalleCajaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesVentas]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesVentas](
	[DetalleDeVentaId] [int] IDENTITY(1,1) NOT NULL,
	[VentaId] [int] NOT NULL,
	[BombonId] [int] NULL,
	[CajaId] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_DetallesVentas] PRIMARY KEY CLUSTERED 
(
	[DetalleDeVentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direcciones]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direcciones](
	[DireccionId] [int] IDENTITY(1,1) NOT NULL,
	[Calle] [nvarchar](120) NOT NULL,
	[Altura] [nvarchar](10) NULL,
	[Entre1] [nvarchar](120) NULL,
	[Entre2] [nvarchar](120) NULL,
	[Piso] [int] NULL,
	[Depto] [nchar](10) NULL,
	[PaisId] [int] NOT NULL,
	[ProvinciaEstadoId] [int] NOT NULL,
	[CiudadId] [int] NOT NULL,
	[CodPostal] [nchar](10) NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Direcciones] PRIMARY KEY CLUSTERED 
(
	[DireccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fabricas]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fabricas](
	[FabricaId] [int] IDENTITY(1,1) NOT NULL,
	[NombreFabrica] [nvarchar](50) NOT NULL,
	[Direccion] [nvarchar](100) NOT NULL,
	[PaisId] [int] NOT NULL,
	[ProvinciaEstadoId] [int] NOT NULL,
	[CiudadId] [int] NOT NULL,
 CONSTRAINT [PK_Fabricas] PRIMARY KEY CLUSTERED 
(
	[FabricaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[PaisId] [int] IDENTITY(1,1) NOT NULL,
	[NombrePais] [nvarchar](50) NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[PaisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[PermisoId] [int] IDENTITY(1,1) NOT NULL,
	[NombrePermiso] [nvarchar](50) NOT NULL,
	[Descripción] [nchar](10) NULL,
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[PermisoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProvinciasEstados]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProvinciasEstados](
	[ProvinciaEstadoId] [int] IDENTITY(1,1) NOT NULL,
	[NombreProvinciaEstado] [nvarchar](100) NOT NULL,
	[PaisId] [int] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_ProvinciasEstados] PRIMARY KEY CLUSTERED 
(
	[ProvinciaEstadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RolId] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [nvarchar](50) NOT NULL,
	[Descripción] [nvarchar](256) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefonos]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefonos](
	[TelefonoId] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Telefonos_1] PRIMARY KEY CLUSTERED 
(
	[TelefonoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeChocolates]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeChocolates](
	[TipoDeChocolateId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposDeChocolates] PRIMARY KEY CLUSTERED 
(
	[TipoDeChocolateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeNueces]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeNueces](
	[TipoDeNuezId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposDeNueces] PRIMARY KEY CLUSTERED 
(
	[TipoDeNuezId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeRellenos]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeRellenos](
	[TipoDeRellenoId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposDeRellenos] PRIMARY KEY CLUSTERED 
(
	[TipoDeRellenoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDirecciones]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDirecciones](
	[TipoDireccionId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoDirecciones] PRIMARY KEY CLUSTERED 
(
	[TipoDireccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposTelefonos]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposTelefonos](
	[TipoTelefonoId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](15) NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Telefonos] PRIMARY KEY CLUSTERED 
(
	[TipoTelefonoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [nvarchar](200) NOT NULL,
	[Clave] [nvarchar](20) NOT NULL,
	[RolId] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 20/08/2024 16:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[VentaId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NULL,
	[FechaVenta] [datetime] NOT NULL,
	[Regalo] [bit] NOT NULL,
	[Envio] [bit] NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[Estado] [tinyint] NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[VentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bombones] ON 

INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (1, N'Almendra Ambrosia', N'Avellana clásica con amaretto.', 4, 1, 1, CAST(44.00 AS Decimal(18, 2)), CAST(66.00 AS Decimal(18, 2)), 30, 10, N'D:\Users\Usuario\Desktop\Bombon03.jfif', 1, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (2, N'Manzana Amore', N'Cremoso chocolate con leche diseñado en forma de manzana con hojas de almendro.', 3, 1, 12, CAST(24.00 AS Decimal(18, 2)), CAST(36.00 AS Decimal(18, 2)), 9, 10, N'', 2, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (3, N'Almendra Suprema', N'Almendras enteras inmersas en chocolate oscuro.', 4, 1, 12, CAST(30.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), 2, 10, N'', 3, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (4, N'Extasis Crepuscular', N'Almendra con crema de moca recubierto de chocolate agridulce', 1, 2, 6, CAST(33.00 AS Decimal(18, 2)), CAST(49.50 AS Decimal(18, 2)), 27, 10, N'', 4, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (5, N'Anacardo Suprema', N'Almendra gigante rodeada de chocolate oscuro.', 4, 2, 12, CAST(33.00 AS Decimal(18, 2)), CAST(49.50 AS Decimal(18, 2)), 3, 10, N'D:\Users\Usuario\Desktop\bombonmezcalmarcadeagua.jpg', 5, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (6, N'Avellana Amaretto', N'Avellana clásica y amaretto envueltos en chocolate con leche.', 3, 3, 1, CAST(36.00 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)), 12, 10, N'', 1, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (7, N'Avellana Virgen', N'Las avellanas más suaves cubiertas por un cremoso chocolate con leche.', 3, 3, 5, CAST(26.00 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)), 0, 10, N'', 1, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (8, N'Avellana Moca', N'Avellana clásica y crema de moca suavizados con chocolate con leche.', 3, 3, 6, CAST(33.00 AS Decimal(18, 2)), CAST(49.50 AS Decimal(18, 2)), 4, 10, N'', 2, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (9, N'Avellana Amarga', N'Clásica Avellana cubierta de chocolate Agridulce', 1, 3, 12, CAST(24.00 AS Decimal(18, 2)), CAST(36.00 AS Decimal(18, 2)), 8, 10, N'', 2, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (10, N'Corazón Destrozado', N'Dos mitades de bombón bañadas en chocolate blando con avellanas', 2, 3, 12, CAST(30.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), 19, 10, N'', 3, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (11, N'Avellana Suprema', N'Avellanas enteras inmersas en chocolate oscuro.', 4, 3, 12, CAST(21.00 AS Decimal(18, 2)), CAST(31.50 AS Decimal(18, 2)), 8, 10, N'', 3, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (12, N'Brasileño Supremo', N'Una castaña del Brasil entera bañada en chocolate blanco.', 2, 4, 12, CAST(28.00 AS Decimal(18, 2)), CAST(42.00 AS Decimal(18, 2)), 3, 10, N'', 4, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (13, N'Chocolate Kiwi', N'Castaña del Brasil rodeada de oscuro chocolate, una sección transversal parecida a la del fruto del kiwi.', 4, 4, 12, CAST(29.00 AS Decimal(18, 2)), CAST(43.50 AS Decimal(18, 2)), 30, 10, N'', 4, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (14, N'Macadamia Suprema', N'Macadamia entera rodeada de chocolate con leche.', 3, 5, 12, CAST(40.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), 6, 10, N'', 5, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (15, N'Baya Agridulce', N'Bayas de las Islas Orcas cubiertas con chocolate amargodulce', 1, 6, 2, CAST(25.00 AS Decimal(18, 2)), CAST(37.50 AS Decimal(18, 2)), 14, 10, N'', 5, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (16, N'Baya Dulce', N'Bayas de las islas Orcas endulzadas con cremoso chocolate con leche.', 3, 6, 2, CAST(26.00 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)), 20, 10, N'', 5, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (17, N'Cereza Agridulce', N'Cereza Ana Real cubierto con chocolate Agridulce para conseguir ese toque de realeza.', 1, 6, 3, CAST(26.00 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)), 18, 10, N'', 5, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (18, N'Cereza Dulce', N'Cerezas Royal Anne endulzadas con cremoso chocolate con leche.', 3, 6, 3, CAST(27.00 AS Decimal(18, 2)), CAST(40.50 AS Decimal(18, 2)), 17, 10, N'', 2, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (19, N'Cereza Clásica', N'Cereza entera en chocolate oscuro clásico', 4, 6, 3, CAST(28.00 AS Decimal(18, 2)), CAST(42.00 AS Decimal(18, 2)), 30, 10, N'', 1, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (20, N'Palma Tropical', N'Chocolate con leche en forma de palma tropical rellena con coco.', 3, 6, 4, CAST(23.00 AS Decimal(18, 2)), CAST(34.50 AS Decimal(18, 2)), 24, 10, N'', 2, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (21, N'Corazón Amante', N'Chocolate con leche en forma de corazón con dulce crema de cerezas a modo de relleno..', 3, 6, 5, CAST(25.00 AS Decimal(18, 2)), CAST(37.50 AS Decimal(18, 2)), 21, 10, N'', 3, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (22, N'Corazón Envuelto', N'Chocolate oscuro con un coración de crema de cereza.', 4, 6, 5, CAST(32.00 AS Decimal(18, 2)), CAST(48.00 AS Decimal(18, 2)), 20, 10, N'', 4, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (23, N'Frambuesa Agridulce', N'Fabulosas fresas salvajes cubiertas con chocolate agridulce para darles ese toque alpino.', 1, 6, 7, CAST(23.00 AS Decimal(18, 2)), CAST(34.50 AS Decimal(18, 2)), 13, 10, N'', 5, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (24, N'Frambuesa dulce', N'Fabulosas fresas salvajes endulzadas con un cremoso chocolate con leche', 5, 6, 7, CAST(20.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 30, 10, N'', 1, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (25, N'Delicia Mantequilla Cacahuate', N'Duave y cremosa mantequilla de cacahuete de los más finos cacahuetes del Senegal, envuelta en chocolate con leche.', 3, 6, 8, CAST(21.00 AS Decimal(18, 2)), CAST(31.50 AS Decimal(18, 2)), 2, 10, N'', 2, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (26, N'Mazapán Hoja de roble', N'Mazapán con la legendaria forma de hoja de roble con una cubierta de suave chocolate', 1, 6, 9, CAST(40.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), 28, 10, N'', 3, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (27, N'Golondrina de Mazapán', N'Mazapán con forma de golondrina con alas de chocolate blanco.', 2, 6, 9, CAST(34.00 AS Decimal(18, 2)), CAST(51.00 AS Decimal(18, 2)), 19, 10, N'', 4, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (28, N'Arce de Mazapán', N'Mazapán con forma de hoja de arce con un envoltorio de chocolate con leche.', 3, 6, 9, CAST(37.00 AS Decimal(18, 2)), CAST(55.50 AS Decimal(18, 2)), 26, 10, N'', 5, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (29, N'Maravilla Mazapán', N'Mazapán en forma de almendra con una capa de chocolate con leche ', 3, 6, 9, CAST(33.00 AS Decimal(18, 2)), CAST(49.50 AS Decimal(18, 2)), 25, 10, N'', 5, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (30, N'Mazapán Pinzón', N'Mazapán con pistachos, bañados en chocolate con leche', 3, 6, 9, CAST(32.00 AS Decimal(18, 2)), CAST(48.00 AS Decimal(18, 2)), 13, 10, N'', 4, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (31, N'Mazapán Delicia', N'Delicioso mazapán con chocolate oscuro.', 4, 6, 9, CAST(38.00 AS Decimal(18, 2)), CAST(57.00 AS Decimal(18, 2)), 23, 10, N'', 3, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (32, N'Mermelada Agridulce', N'Mermelada recubierta con chocolate Agridulce para conseguir ese toque británico.', 1, 6, 10, CAST(17.00 AS Decimal(18, 2)), CAST(25.50 AS Decimal(18, 2)), 18, 10, N'', 2, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (33, N'Mermelada Dulce', N'Mermelada hecha con naranjas valencianas endulzada con cremoso chocolate con leche.', 3, 6, 10, CAST(18.00 AS Decimal(18, 2)), CAST(27.00 AS Decimal(18, 2)), 30, 10, N'', 1, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (34, N'Mora Agridulce', N'Moras de las montañas Cascadas cubiertas con chocolate agridulce para darle ese toque alpino.', 1, 6, 11, CAST(25.00 AS Decimal(18, 2)), CAST(37.50 AS Decimal(18, 2)), 5, 10, N'', 1, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (35, N'No me olvides', N'Bayas rellenas de chocolate con leche inolvidables, envueltas en delicados no me olvides.', 3, 6, 11, CAST(19.00 AS Decimal(18, 2)), CAST(28.50 AS Decimal(18, 2)), 26, 10, N'', 2, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (36, N'Calla Lily', N'Elegante chocolate blando esculpido con forma de lirio.', 2, 6, 12, CAST(27.00 AS Decimal(18, 2)), CAST(40.50 AS Decimal(18, 2)), 16, 10, N'', 3, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (37, N'Belleza Americana', N'Riquísimo chocolate oscuro esculpido con la forma de un capullo de rosa Belleza Americana.', 4, 6, 12, CAST(24.00 AS Decimal(18, 2)), CAST(36.00 AS Decimal(18, 2)), 16, 10, N'', 4, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (38, N'Nuez  Moca', N'Dulce y cremosa moca con nueces', 5, 7, 6, CAST(19.00 AS Decimal(18, 2)), CAST(28.50 AS Decimal(18, 2)), 3, 10, N'', 5, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (39, N'Pistacho Moca', N'Dulce y cremosa moca con pistachos', 5, 8, 6, CAST(21.00 AS Decimal(18, 2)), CAST(31.50 AS Decimal(18, 2)), 28, 10, N'', 1, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (40, N'Pistacho Supremo', N'Conjunto de frutos de pistacho rodeados de chocolate con leche.', 3, 8, 12, CAST(30.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), 5, 10, N'', 2, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (43, N'xx', N'', 1, 1, 2, CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 100, 10, N'', 3, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (44, N'Un Bombon Nuevo', N'Joder lo que costo', 4, 3, 1, CAST(1500.00 AS Decimal(18, 2)), CAST(2600.00 AS Decimal(18, 2)), 100, 10, N'', 2, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (45, N'Un Nuevo Bombon', N'', 1, 2, 2, CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 100, 20, N'379d145f-9cfb-4df5-b472-b6458d9de011.jfif', 4, 0)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (46, N'Un Chai', N'', 1, 1, 1, CAST(100.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 100, 20, N'379d145f-9cfb-4df5-b472-b6458d9de0e1.jfif', 3, 1)
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [Descripcion], [TipoDeChocolateId], [TipoDeNuezId], [TipoDeRellenoId], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [FabricaId], [Suspendido]) VALUES (49, N'Otro Bombon X', N'', 1, 1, 1, CAST(120.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 100, 20, NULL, 3, 0)
SET IDENTITY_INSERT [dbo].[Bombones] OFF
GO
SET IDENTITY_INSERT [dbo].[Cajas] ON 

INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (1, N'All Seasons', N'Blueberries, raspberries, and strawberries to enjoy all season, both bitter and sweet.', CAST(14.40 AS Decimal(18, 2)), CAST(28.80 AS Decimal(18, 2)), 70, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (2, N'Alpine Collection', N'Straight from the high Cascades, alpine blueberries and strawberries in our best chocolate.', CAST(20.75 AS Decimal(18, 2)), CAST(41.50 AS Decimal(18, 2)), 38, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (3, N'Autumn Collection', N'Family-size box of Autumn favorites--Marzipan Maple, Oakleaf, Finch, and Swallow.', CAST(42.90 AS Decimal(18, 2)), CAST(85.80 AS Decimal(18, 2)), 20, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (4, N'Bittersweets', N'Our best bitters, in blueberry, cherry, marmalade, raspberry, and strawberry.', CAST(27.70 AS Decimal(18, 2)), CAST(55.40 AS Decimal(18, 2)), 19, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (5, N'Cherry Classics', N'Our finest whole cherries--sweet, bittersweet, and classic.', CAST(16.20 AS Decimal(18, 2)), CAST(32.40 AS Decimal(18, 2)), 50, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (6, N'Fudge Mocha Fantasy', N'A dream collection of our fudge line--our famous mocha centers smothered in fudge.', CAST(39.00 AS Decimal(18, 2)), CAST(78.00 AS Decimal(18, 2)), 39, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (7, N'Heavenly Hazelnuts', N'Our finest hazelnut assortment--Hazelnut Supremes, Hazelnut Cherries, Hazelnut Amaretto, Hazelnut Mocha, and Hazelnut Bitters.', CAST(15.55 AS Decimal(18, 2)), CAST(31.10 AS Decimal(18, 2)), 30, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (8, N'International', N'An international assortment featuring American Beauty, Brazilian Supreme, Chocolate Kiwi, and Tropical Palm.', CAST(33.90 AS Decimal(18, 2)), CAST(67.80 AS Decimal(18, 2)), 49, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (9, N'Island Collection', N'Delicacies that carry you away to the islands--Chocolate Kiwi, Calla Lily, Tropical Palm, and Marzipan Swallow.', CAST(34.80 AS Decimal(18, 2)), CAST(69.60 AS Decimal(18, 2)), 39, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (10, N'Lover''s Hearts', N'Our finest white, milk, and dark chocolate in our Hearts collection--Broken Heart, Lover''s Heart, and Heart on a Sleeve.', CAST(17.40 AS Decimal(18, 2)), CAST(34.80 AS Decimal(18, 2)), 30, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (11, N'Marzipan Marvels', N'An almondy assortment of marvelous marzipan delights.', CAST(32.10 AS Decimal(18, 2)), CAST(64.20 AS Decimal(18, 2)), 50, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (12, N'Northwind Collection', N'For lovers of the outdoors, our exclusive collection--Marzipan Finch, Marzipan Swallow, Forget-Me-Not, American Beauty, Calla Lily, and Candlelight Ecstasy.', CAST(33.20 AS Decimal(18, 2)), CAST(66.40 AS Decimal(18, 2)), 70, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (13, N'Pacific Opulence', N'Our most opulent assortment, Pacific sweets that excel--Calla Lily, Hazelnut Amaretto, Hazelnut Mocha, and Almond Ambrosia.', CAST(21.00 AS Decimal(18, 2)), CAST(42.00 AS Decimal(18, 2)), 50, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (14, N'Peanut Butter Delights', N'Chocolate-covered, soft peanut butter delights that melt everyone''s heart.', CAST(18.90 AS Decimal(18, 2)), CAST(37.80 AS Decimal(18, 2)), 90, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (15, N'Romantic Collection', N'Our classic romantic assortment--Almond Ambrosia, Candlelight Ecstasy, American Beauty, Apple Amore, Forget-Me-Not, Broken Heart, Lover''s Heart, and Heart on a Sleeve.', CAST(34.20 AS Decimal(18, 2)), CAST(68.40 AS Decimal(18, 2)), 70, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (16, N'Supremes', N'A taste for two of our assorted nut Supremes--Hazelnut, Almond, Brazilian, Pistachio, Cashew, and Macadamia.', CAST(18.20 AS Decimal(18, 2)), CAST(36.40 AS Decimal(18, 2)), 40, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (17, N'Sweet Creams', N'Sweet creams for everyone who loves fine cream fillings--mocha, cherry, and peanut butter.', CAST(22.80 AS Decimal(18, 2)), CAST(45.60 AS Decimal(18, 2)), 20, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (18, N'Sweet and Bitter', N'Our best sweet and bitter combination of blueberry, cherry, marmalade, raspberry, and strawberry.', CAST(27.75 AS Decimal(18, 2)), CAST(55.50 AS Decimal(18, 2)), 30, 5, N'', 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (24, N'Caja XXX', N'La caja de siempre', CAST(35.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), 10, 5, NULL, 0)
INSERT [dbo].[Cajas] ([CajaId], [NombreCaja], [Descripcion], [PrecioCosto], [PrecioVenta], [Stock], [NivelDeReposicion], [Imagen], [Suspendido]) VALUES (26, N'xxxx', N'xxxx', CAST(100.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 10, 5, NULL, 0)
SET IDENTITY_INSERT [dbo].[Cajas] OFF
GO
SET IDENTITY_INSERT [dbo].[Ciudades] ON 

INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [ProvinciaEstadoId], [PaisId]) VALUES (1, N'Cancún', 6, 1)
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [ProvinciaEstadoId], [PaisId]) VALUES (2, N'Lobos', 9, 5)
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [ProvinciaEstadoId], [PaisId]) VALUES (3, N'Ciudad Autónoma de Buenos Aires', 1, 5)
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [ProvinciaEstadoId], [PaisId]) VALUES (4, N'Roque Perez', 9, 5)
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [ProvinciaEstadoId], [PaisId]) VALUES (6, N'Monte', 9, 5)
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [ProvinciaEstadoId], [PaisId]) VALUES (17, N'Navarro', 9, 5)
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [ProvinciaEstadoId], [PaisId]) VALUES (33, N'Santiago', 7, 4)
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [ProvinciaEstadoId], [PaisId]) VALUES (34, N'Brasilia', 2, 4)
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [ProvinciaEstadoId], [PaisId]) VALUES (35, N'Nueva York', 8, 3)
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [ProvinciaEstadoId], [PaisId]) VALUES (36, N'Distrito Federal', 5, 1)
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [ProvinciaEstadoId], [PaisId]) VALUES (39, N'Australian City in Camberra', 18, 11)
INSERT [dbo].[Ciudades] ([CiudadId], [NombreCiudad], [ProvinciaEstadoId], [PaisId]) VALUES (41, N'Córdoba', 20, 24)
SET IDENTITY_INSERT [dbo].[Ciudades] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (1, 58264391, N'Bravo', N'Julián')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (2, 79420836, N'Gimenez', N'Pablo')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (3, 20371985, N'Calvo', N'Juan')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (4, 41872096, N'Fernandez', N'Romina')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (5, 90531748, N'Marinelli', N'Sofia')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (6, 78642109, N'Muller', N'Mariano')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (7, 63917482, N'Gutierrez', N'Sofía')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (8, 36250791, N'O''Donelly', N'Mariana')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (9, 82914703, N'Lopez', N'Marcos')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (10, 45036129, N'Fioravanti', N'Susana')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (11, 17492038, N'Alcantara', N'Joaquin')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (12, 81364529, N'Fernandez', N'Julian')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (13, 29078463, N'Rodriguez', N'Marcela')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (14, 39526870, N'Perez', N'Luis')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (15, 64783125, N'Fioravanti', N'Pablo')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (16, 52861407, N'Veronelli', N'Silvia')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (17, 16298470, N'Sanders', N'Joaquin')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (18, 87013924, N'Williner', N'Monica')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (19, 49365780, N'Valente', N'Juan')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (20, 90517463, N'Albor', N'Silvia')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (21, 21863450, N'Leopold', N'Daniel')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (22, 57463891, N'Harold', N'Carlos')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (23, 80942756, N'Jonhson', N'Romina')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (24, 41672593, N'Muller', N'Federico')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (25, 98573124, N'Antar', N'Juana')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (26, 27098365, N'Colanini', N'Patricia')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (27, 81423670, N'Hermann', N'Pedro')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (28, 59276304, N'Berloc', N'Cristian')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (29, 63978521, N'Martinez', N'Andrea')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (30, 84361729, N'Neiman', N'Alberto')
INSERT [dbo].[Clientes] ([ClienteId], [Documento], [Apellido], [Nombres]) VALUES (37, 15151515, N'Doe', N'John')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (1, 1, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (2, 2, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (3, 3, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (4, 4, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (5, 5, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (6, 6, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (7, 7, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (8, 8, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (9, 9, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (10, 10, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (11, 11, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (12, 12, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (13, 13, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (14, 14, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (15, 15, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (16, 16, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (17, 17, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (18, 18, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (19, 19, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (20, 20, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (21, 21, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (22, 22, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (23, 23, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (24, 24, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (25, 25, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (26, 26, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (27, 27, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (28, 28, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (29, 29, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (30, 30, 1)
INSERT [dbo].[ClientesDirecciones] ([ClienteId], [DireccionId], [TipoDireccionId]) VALUES (37, 34, 1)
GO
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (1, 1, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (2, 2, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (3, 3, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (4, 4, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (5, 5, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (6, 6, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (7, 7, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (8, 8, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (9, 9, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (10, 10, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (11, 11, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (12, 12, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (13, 13, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (14, 14, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (15, 15, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (16, 16, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (17, 17, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (18, 18, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (19, 19, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (20, 20, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (21, 21, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (22, 22, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (23, 23, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (24, 24, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (25, 25, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (26, 26, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (27, 27, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (28, 28, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (29, 29, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (30, 30, 1)
INSERT [dbo].[ClientesTelefonos] ([ClienteId], [TelefonoId], [TipoTelefonoId]) VALUES (37, 31, 1)
GO
SET IDENTITY_INSERT [dbo].[CompaniasEnvios] ON 

INSERT [dbo].[CompaniasEnvios] ([CompaniaEnvioId], [NombreCompania]) VALUES (3, N'Cosmos Delivery')
INSERT [dbo].[CompaniasEnvios] ([CompaniaEnvioId], [NombreCompania]) VALUES (2, N'El Veloz')
INSERT [dbo].[CompaniasEnvios] ([CompaniaEnvioId], [NombreCompania]) VALUES (1, N'Speedy Express')
SET IDENTITY_INSERT [dbo].[CompaniasEnvios] OFF
GO
SET IDENTITY_INSERT [dbo].[DetallesCajas] ON 

INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (88, 1, 2, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (89, 1, 4, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (90, 1, 5, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (91, 1, 20, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (92, 1, 28, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (93, 1, 31, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (94, 2, 2, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (95, 2, 4, 5)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (96, 2, 20, 5)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (97, 2, 31, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (98, 3, 3, 6)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (99, 3, 24, 6)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (100, 3, 27, 6)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (101, 3, 38, 6)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (102, 4, 2, 5)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (103, 4, 4, 5)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (104, 4, 5, 5)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (105, 4, 6, 5)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (106, 4, 7, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (107, 5, 7, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (108, 5, 14, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (109, 5, 30, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (110, 6, 18, 9)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (111, 6, 19, 9)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (115, 7, 8, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (116, 7, 13, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (117, 7, 33, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (118, 7, 34, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (119, 7, 35, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (120, 8, 15, 6)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (121, 8, 16, 6)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (122, 8, 24, 6)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (124, 9, 15, 6)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (125, 9, 27, 6)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (126, 9, 34, 6)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (127, 9, 39, 6)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (128, 10, 10, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (129, 10, 25, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (130, 10, 40, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (131, 11, 3, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (132, 11, 17, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (133, 11, 24, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (134, 11, 27, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (135, 11, 35, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (136, 11, 38, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (137, 12, 1, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (138, 12, 16, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (139, 12, 24, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (140, 12, 29, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (141, 12, 38, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (142, 12, 39, 4)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (143, 13, 12, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (144, 13, 36, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (145, 13, 37, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (146, 13, 39, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (147, 14, 23, 18)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (148, 15, 1, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (149, 15, 10, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (150, 15, 12, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (151, 15, 16, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (152, 15, 25, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (153, 15, 26, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (154, 15, 29, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (155, 15, 40, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (156, 16, 9, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (157, 16, 11, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (158, 16, 13, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (159, 16, 21, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (160, 16, 22, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (162, 17, 1, 6)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (163, 17, 23, 6)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (164, 17, 25, 6)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (165, 18, 2, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (166, 18, 4, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (167, 18, 5, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (168, 18, 6, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (169, 18, 7, 3)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (170, 18, 20, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (171, 18, 28, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (172, 18, 30, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (173, 18, 31, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (174, 18, 32, 2)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (177, 24, 16, 10)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (178, 24, 21, 10)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (179, 24, 23, 10)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (180, 26, 3, 10)
INSERT [dbo].[DetallesCajas] ([DetalleCajaId], [CajaId], [BombonId], [Cantidad]) VALUES (181, 26, 15, 10)
SET IDENTITY_INSERT [dbo].[DetallesCajas] OFF
GO
SET IDENTITY_INSERT [dbo].[DetallesVentas] ON 

INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340262, 1, 15, NULL, 3, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340263, 2, 31, NULL, 3, CAST(57.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340264, 3, 37, NULL, 4, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340265, 3, 3, NULL, 1, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340266, 4, 3, NULL, 4, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340267, 4, 5, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340268, 5, 39, NULL, 4, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340269, 5, 1, NULL, 3, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340270, 6, 7, NULL, 2, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340271, 6, 15, NULL, 2, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340272, 7, 9, NULL, 1, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340273, 7, 3, NULL, 2, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340274, 8, 36, NULL, 3, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340275, 8, 6, NULL, 1, CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340276, 9, 24, NULL, 1, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340277, 9, 11, NULL, 2, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340278, 9, 32, NULL, 1, CAST(25.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340279, 10, 4, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340280, 10, 10, NULL, 4, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340281, 10, 39, NULL, 4, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340282, 11, 17, NULL, 1, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340283, 11, 3, NULL, 2, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340284, 11, 22, NULL, 2, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340285, 12, 19, NULL, 4, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340286, 12, 27, NULL, 4, CAST(51.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340287, 12, 26, NULL, 1, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340288, 13, 22, NULL, 2, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340289, 13, 4, NULL, 4, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340290, 13, 7, NULL, 1, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340291, 14, 24, NULL, 2, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340292, 14, 1, NULL, 1, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340293, 14, 23, NULL, 1, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340294, 15, 39, NULL, 4, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340295, 15, 12, NULL, 2, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340296, 16, 5, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340297, 16, 2, NULL, 3, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340298, 17, 3, NULL, 1, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340299, 17, 2, NULL, 1, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340300, 18, 20, NULL, 3, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340301, 18, 37, NULL, 4, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340302, 19, 17, NULL, 4, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340303, 19, 16, NULL, 3, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340304, 20, 10, NULL, 3, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340305, 20, 12, NULL, 3, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340306, 21, 14, NULL, 1, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340307, 21, 12, NULL, 4, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340308, 22, 11, NULL, 1, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340309, 23, 15, NULL, 3, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340310, 24, 39, NULL, 2, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340311, 25, 23, NULL, 4, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340312, 26, 26, NULL, 2, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340313, 27, 19, NULL, 2, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340314, 28, 21, NULL, 3, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340315, 29, 26, NULL, 3, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340316, 30, 27, NULL, 3, CAST(51.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340317, 31, 38, NULL, 1, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340318, 32, 33, NULL, 1, CAST(27.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340319, 33, 8, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340320, 34, 38, NULL, 4, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340321, 35, 7, NULL, 4, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340322, 36, 1, NULL, 4, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340323, 36, 1, NULL, 5, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340324, 37, NULL, 1, 1, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340325, 38, NULL, 1, 3, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340326, 38, NULL, 1, 4, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340327, 36, 2, NULL, 10, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340328, 37, 7, 1, 8, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340329, 38, NULL, 1, 10, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340330, 39, NULL, 3, 8, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340331, 40, NULL, 1, 9, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340332, 41, NULL, 10, 4, CAST(34.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340333, 42, 12, NULL, 8, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340334, 43, NULL, 1, 2, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340335, 44, 14, 1, 9, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340336, 45, 15, NULL, 8, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340337, 46, 16, 1, 9, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340338, 47, NULL, 1, 2, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340339, 48, NULL, 3, 6, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340340, 49, NULL, 4, 7, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340341, 50, NULL, 2, 4, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340342, 51, NULL, 1, 9, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340343, 52, 22, 1, 6, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340344, 53, 23, NULL, 2, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340345, 54, 24, 1, 8, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340346, 55, 15, NULL, 5, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340347, 56, NULL, 1, 10, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340348, 57, 27, NULL, 6, CAST(51.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340349, 58, NULL, 1, 3, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340350, 59, NULL, 1, 1, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340351, 60, 30, 1, 5, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340352, 61, 31, 1, 3, CAST(57.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340353, 62, 32, NULL, 5, CAST(25.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340354, 63, 33, 1, 4, CAST(27.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340355, 64, 34, NULL, 7, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340356, 65, 35, 1, 7, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340357, 66, 1, NULL, 10, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340358, 67, 37, 1, 6, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340359, 68, 38, NULL, 3, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340360, 69, 39, NULL, 10, CAST(31.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340361, 70, 29, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340362, 71, NULL, 12, 3, CAST(66.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340363, 72, NULL, 10, 2, CAST(34.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340364, 73, 45, NULL, 6, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340365, 74, NULL, 1, 1, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340366, 75, 49, 11, 6, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340367, 76, 1, NULL, 8, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340368, 77, 2, NULL, 1, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340369, 78, 3, NULL, 10, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340370, 79, 17, NULL, 9, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340371, 80, NULL, 2, 4, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340372, 81, 6, NULL, 6, CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340373, 82, 7, NULL, 4, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340374, 83, 8, 2, 5, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340375, 84, 9, 2, 7, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340376, 85, 29, NULL, 4, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340377, 86, NULL, 2, 5, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340378, 87, NULL, 2, 8, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340379, 88, 29, NULL, 5, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340380, 89, 14, 2, 10, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340381, 90, 29, NULL, 3, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340382, 91, 16, NULL, 8, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340383, 92, NULL, 10, 8, CAST(34.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340384, 93, NULL, 11, 10, CAST(64.20 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340385, 94, NULL, 12, 1, CAST(66.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340386, 95, NULL, 13, 4, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340387, 96, NULL, 14, 9, CAST(37.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340388, 97, NULL, 2, 10, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340389, 98, NULL, 1, 3, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340390, 99, NULL, 2, 7, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340391, 100, NULL, 2, 10, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340392, 101, NULL, 5, 2, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340393, 102, 27, NULL, 2, CAST(51.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340394, 103, NULL, 3, 10, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340395, 104, 29, NULL, 5, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340396, 105, NULL, 2, 7, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340397, 106, NULL, 2, 1, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340398, 107, 32, NULL, 4, CAST(25.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340399, 108, 10, NULL, 4, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340400, 109, 34, NULL, 9, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340401, 110, NULL, 2, 9, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340402, 111, 36, NULL, 3, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340403, 112, 37, NULL, 7, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340404, 113, 38, NULL, 8, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340405, 114, 11, NULL, 2, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340406, 115, NULL, 2, 4, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340407, 116, NULL, 2, 1, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340408, 117, 44, NULL, 8, CAST(2600.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340409, 118, NULL, 2, 2, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340410, 119, 46, NULL, 8, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340411, 120, 49, NULL, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340412, 121, NULL, 3, 4, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340413, 122, NULL, 3, 4, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340414, 123, 17, NULL, 7, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340415, 124, 4, NULL, 4, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340416, 125, 5, NULL, 3, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340417, 126, NULL, 3, 7, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340418, 127, NULL, 3, 10, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340419, 128, 8, NULL, 8, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340420, 129, NULL, 3, 8, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340421, 130, 23, NULL, 8, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340422, 131, NULL, 3, 4, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340423, 132, 21, NULL, 2, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340424, 133, NULL, 3, 7, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340425, 134, 22, NULL, 5, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340426, 135, 15, 3, 10, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340427, 136, 16, NULL, 5, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340428, 137, 17, NULL, 7, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340429, 138, 18, NULL, 4, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340430, 139, NULL, 12, 3, CAST(66.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340431, 140, NULL, 3, 9, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340432, 141, NULL, 3, 10, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340433, 142, NULL, 11, 2, CAST(64.20 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340434, 143, NULL, 3, 6, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340435, 144, 1, NULL, 3, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340436, 145, 2, NULL, 7, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340437, 146, 26, NULL, 2, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340438, 147, 3, NULL, 8, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340439, 148, 28, NULL, 10, CAST(55.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340440, 149, NULL, 3, 5, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340441, 150, 4, NULL, 1, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340442, 151, 31, NULL, 5, CAST(57.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340443, 152, NULL, 3, 7, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340444, 153, 33, NULL, 5, CAST(27.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340445, 154, 34, 3, 9, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340446, 155, 35, 3, 3, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340447, 156, 36, NULL, 9, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340448, 157, NULL, 3, 6, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340449, 158, 5, NULL, 9, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340450, 159, NULL, 3, 3, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340451, 160, NULL, 3, 10, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340452, 161, NULL, 13, 7, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340453, 162, 44, NULL, 1, CAST(2600.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340454, 163, 45, NULL, 9, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340455, 164, 17, NULL, 2, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340456, 165, 49, NULL, 6, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340457, 166, 1, 4, 10, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340458, 167, 2, NULL, 6, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340459, 168, NULL, 4, 6, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340460, 169, 30, NULL, 5, CAST(48.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340461, 170, 21, NULL, 4, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340462, 171, NULL, 4, 7, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340463, 172, 7, NULL, 2, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340464, 173, 8, NULL, 7, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340465, 174, NULL, 4, 5, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340466, 175, 10, NULL, 2, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340467, 176, NULL, 4, 9, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340468, 177, 12, NULL, 6, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340469, 178, 13, NULL, 10, CAST(43.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340470, 179, 14, NULL, 6, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340471, 180, 15, NULL, 10, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340472, 181, 16, NULL, 3, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340473, 182, 17, NULL, 7, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340474, 183, 18, NULL, 4, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340475, 184, NULL, 4, 5, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340476, 185, 20, NULL, 2, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340477, 186, 21, NULL, 2, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340478, 187, 29, NULL, 3, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340479, 188, 23, NULL, 7, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340480, 189, 29, NULL, 6, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340481, 190, NULL, 4, 8, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340482, 191, 26, NULL, 5, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340483, 192, NULL, 4, 5, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340484, 193, 5, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340485, 194, 29, NULL, 4, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340486, 195, 30, NULL, 3, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340487, 196, NULL, 4, 2, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340488, 197, NULL, 12, 4, CAST(66.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340489, 198, 33, NULL, 10, CAST(27.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340490, 199, NULL, 12, 3, CAST(66.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340491, 200, 35, NULL, 2, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340492, 201, 36, NULL, 3, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340493, 202, NULL, 14, 2, CAST(37.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340494, 203, 38, NULL, 7, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340495, 204, NULL, 4, 10, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340496, 205, 40, NULL, 4, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340497, 206, NULL, 4, 6, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340498, 207, 44, NULL, 6, CAST(2600.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340499, 208, 45, NULL, 6, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340500, 209, NULL, 4, 2, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340501, 210, NULL, 4, 6, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340502, 211, 1, NULL, 7, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340503, 212, NULL, 1, 8, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340504, 213, 3, NULL, 8, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340505, 214, 4, NULL, 5, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340506, 215, NULL, 5, 5, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340507, 216, NULL, 5, 10, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340508, 217, 7, NULL, 1, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340509, 218, 8, NULL, 9, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340510, 219, NULL, 5, 9, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340511, 220, 10, NULL, 3, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340512, 221, 11, 5, 6, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340513, 222, 12, NULL, 6, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340514, 223, 13, NULL, 4, CAST(43.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340515, 224, 14, 5, 3, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340516, 225, 15, NULL, 9, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340517, 226, NULL, 12, 10, CAST(66.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340518, 227, NULL, 5, 5, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340519, 228, 18, NULL, 9, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340520, 229, 19, NULL, 6, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340521, 230, NULL, 5, 9, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340522, 231, 21, 5, 9, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340523, 232, NULL, 5, 5, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340524, 233, 23, NULL, 9, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340525, 234, 24, NULL, 2, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340526, 235, 25, NULL, 6, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340527, 236, 26, NULL, 5, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340528, 237, NULL, 11, 5, CAST(64.20 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340529, 238, NULL, 5, 4, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340530, 239, 29, NULL, 1, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340531, 240, NULL, 5, 6, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340532, 241, NULL, 10, 8, CAST(34.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340533, 242, 32, NULL, 1, CAST(25.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340534, 243, NULL, 9, 6, CAST(69.60 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340535, 244, NULL, 8, 1, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340536, 245, 35, NULL, 9, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340537, 246, 36, NULL, 1, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340538, 247, NULL, 6, 8, CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340539, 248, NULL, 5, 4, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340540, 249, NULL, 5, 4, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340541, 250, NULL, 5, 1, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340542, 251, NULL, 5, 7, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340543, 252, NULL, 5, 10, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340544, 253, 45, NULL, 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340545, 254, NULL, 5, 7, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340546, 255, 49, NULL, 10, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340547, 256, NULL, 6, 10, CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340548, 257, NULL, 6, 4, CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340549, 258, 3, NULL, 1, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340550, 259, 4, NULL, 5, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340551, 260, NULL, 4, 4, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340552, 261, NULL, 5, 6, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340553, 262, 7, NULL, 4, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340554, 263, NULL, 8, 4, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340555, 264, 9, NULL, 2, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340556, 265, NULL, 6, 7, CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340557, 266, NULL, 11, 10, CAST(64.20 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340558, 267, 12, NULL, 5, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340559, 268, 13, NULL, 6, CAST(43.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340560, 269, 14, NULL, 4, CAST(60.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340561, 270, 15, NULL, 2, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340562, 271, 12, NULL, 8, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340563, 272, 17, NULL, 3, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340564, 273, NULL, 6, 10, CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340565, 274, NULL, 7, 3, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340566, 275, NULL, 9, 2, CAST(69.60 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340567, 276, 21, NULL, 5, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340568, 277, 22, 6, 3, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340569, 278, NULL, 6, 10, CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340570, 279, 24, NULL, 3, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340571, 280, 25, 6, 5, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340572, 281, 26, 6, 7, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340573, 282, NULL, 6, 10, CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340574, 283, 29, NULL, 5, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340575, 284, 29, 6, 3, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340576, 285, 30, NULL, 3, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340577, 286, 31, NULL, 1, CAST(57.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340578, 287, 32, NULL, 8, CAST(25.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340579, 288, NULL, 6, 4, CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340580, 289, 34, NULL, 9, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340581, 290, 35, NULL, 6, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340582, 291, 36, NULL, 8, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340583, 292, 37, NULL, 8, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340584, 293, 38, NULL, 2, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340585, 294, 1, NULL, 10, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340586, 295, 2, NULL, 3, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340587, 296, NULL, 6, 9, CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340588, 297, 44, NULL, 7, CAST(2600.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340589, 298, 45, NULL, 6, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340590, 299, NULL, 6, 7, CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340591, 300, NULL, 6, 1, CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340592, 301, NULL, 7, 6, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340593, 302, 23, NULL, 7, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340594, 303, 22, NULL, 1, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340595, 304, 4, NULL, 3, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340596, 305, 5, NULL, 8, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340597, 306, NULL, 7, 2, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340598, 307, NULL, 7, 2, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340599, 308, 21, NULL, 9, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340600, 309, NULL, 7, 9, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340601, 310, 10, NULL, 9, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340602, 311, 11, NULL, 5, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340603, 312, 12, NULL, 5, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340604, 313, NULL, 7, 9, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340605, 314, NULL, 7, 5, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340606, 315, NULL, 7, 1, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340607, 316, 11, NULL, 6, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340608, 317, 17, NULL, 10, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340609, 318, NULL, 7, 4, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340610, 319, NULL, 7, 3, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340611, 320, NULL, 7, 8, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340612, 321, 21, NULL, 5, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340613, 322, 22, NULL, 1, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340614, 323, 23, NULL, 5, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340615, 324, 24, NULL, 9, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340616, 325, 25, NULL, 9, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340617, 326, NULL, 7, 1, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340618, 327, 29, NULL, 1, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340619, 328, 28, NULL, 10, CAST(55.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340620, 329, 29, NULL, 9, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340621, 330, NULL, 8, 2, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340622, 331, NULL, 9, 7, CAST(69.60 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340623, 332, NULL, 7, 1, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340624, 333, 33, NULL, 9, CAST(27.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340625, 334, NULL, 1, 6, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340626, 335, NULL, 2, 3, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340627, 336, 36, NULL, 2, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340628, 337, 37, NULL, 10, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340629, 338, NULL, 7, 2, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340630, 339, 39, NULL, 9, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340631, 340, 40, NULL, 3, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340632, 341, 43, NULL, 3, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340633, 342, 44, NULL, 9, CAST(2600.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340634, 343, 45, NULL, 7, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340635, 344, 29, NULL, 5, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340636, 345, 49, NULL, 6, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340637, 346, 1, NULL, 6, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340638, 347, 2, NULL, 8, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340639, 348, NULL, 8, 8, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340640, 349, 1, NULL, 9, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340641, 350, NULL, 8, 9, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340642, 351, NULL, 8, 3, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340643, 352, NULL, 8, 7, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340644, 353, 11, NULL, 2, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340645, 354, 12, NULL, 4, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340646, 355, 10, NULL, 5, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340647, 356, NULL, 8, 3, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340648, 357, NULL, 8, 10, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340649, 358, NULL, 8, 8, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340650, 359, NULL, 11, 3, CAST(64.20 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340651, 360, NULL, 11, 9, CAST(64.20 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340652, 361, 16, NULL, 3, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340653, 362, 29, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340654, 363, 18, NULL, 3, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340655, 364, 19, NULL, 8, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340656, 365, NULL, 7, 9, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340657, 366, NULL, 8, 5, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340658, 367, 22, NULL, 6, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340659, 368, 23, NULL, 4, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340660, 369, 24, NULL, 4, CAST(30.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340661, 370, NULL, 8, 7, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340662, 371, 26, NULL, 9, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340663, 372, NULL, 8, 7, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340664, 373, 28, 8, 8, CAST(55.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340665, 374, NULL, 1, 1, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340666, 375, NULL, 2, 3, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340667, 376, 31, 8, 3, CAST(57.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340668, 377, NULL, 8, 1, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340669, 378, NULL, 8, 3, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340670, 379, 34, NULL, 9, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340671, 380, NULL, 8, 9, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340672, 381, 36, NULL, 8, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340673, 382, 37, NULL, 6, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340674, 383, 38, NULL, 4, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340675, 384, NULL, 8, 9, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340676, 385, 40, 8, 5, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340677, 386, NULL, 2, 1, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340678, 387, 44, NULL, 3, CAST(2600.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340679, 388, NULL, 4, 7, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340680, 389, 46, NULL, 2, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340681, 390, NULL, 8, 3, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340682, 391, 1, NULL, 2, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340683, 392, 2, NULL, 6, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340684, 393, NULL, 9, 10, CAST(69.60 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340685, 394, 4, NULL, 3, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340686, 395, 5, NULL, 1, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340687, 396, NULL, 9, 10, CAST(69.60 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340688, 397, 7, NULL, 6, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340689, 398, 8, NULL, 10, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340690, 399, NULL, 11, 1, CAST(64.20 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340691, 400, NULL, 2, 10, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340692, 401, 11, NULL, 5, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340693, 402, NULL, 9, 10, CAST(69.60 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340694, 403, NULL, 1, 3, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340695, 404, NULL, 5, 5, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340696, 405, 15, NULL, 4, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340697, 406, NULL, 8, 7, CAST(67.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340702, 411, NULL, 9, 5, CAST(69.60 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340703, 412, NULL, 7, 9, CAST(31.10 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340704, 413, NULL, 9, 1, CAST(69.60 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340705, 414, NULL, 9, 8, CAST(69.60 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340706, 415, NULL, 4, 10, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340707, 416, NULL, 9, 10, CAST(69.60 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340708, 417, 27, NULL, 10, CAST(51.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340991, 36, 15, 3, 10, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340992, 37, 16, NULL, 5, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340993, 38, 17, NULL, 7, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340994, 39, 18, NULL, 4, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340995, 40, NULL, 12, 3, CAST(66.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340996, 41, NULL, 3, 9, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340997, 42, NULL, 3, 10, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340998, 43, NULL, 11, 2, CAST(64.20 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (340999, 44, NULL, 3, 6, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341000, 45, 1, NULL, 3, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341001, 46, 2, NULL, 7, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341002, 47, 26, NULL, 2, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341003, 48, 3, NULL, 8, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341004, 49, 28, NULL, 10, CAST(55.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341005, 50, NULL, 3, 5, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341006, 51, 4, NULL, 1, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341007, 52, 31, NULL, 5, CAST(57.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341008, 53, NULL, 3, 7, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341009, 54, 33, NULL, 5, CAST(27.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341010, 55, 34, 3, 9, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341011, 56, 35, 3, 3, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341012, 57, 36, NULL, 9, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341013, 58, NULL, 3, 6, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341014, 59, 15, NULL, 3, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341015, 60, 31, NULL, 3, CAST(57.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341016, 61, 37, NULL, 4, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341017, 62, 3, NULL, 1, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341018, 63, 3, NULL, 4, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341019, 64, 5, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341020, 65, 39, NULL, 4, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341021, 66, 1, NULL, 3, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341022, 67, 7, NULL, 2, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341023, 68, 15, NULL, 2, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341024, 69, 9, NULL, 1, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341025, 70, 3, NULL, 2, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341026, 71, 36, NULL, 3, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341027, 72, 6, NULL, 1, CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341028, 73, 24, NULL, 1, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341029, 74, 11, NULL, 2, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341030, 75, 32, NULL, 1, CAST(25.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341031, 76, 4, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341032, 77, 10, NULL, 4, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341033, 78, 39, NULL, 4, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341034, 79, 17, NULL, 1, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341035, 80, 3, NULL, 2, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341036, 81, 22, NULL, 2, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341037, 82, 19, NULL, 4, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341038, 83, 27, NULL, 4, CAST(51.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341039, 84, 26, NULL, 1, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341040, 85, 22, NULL, 2, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341041, 86, 4, NULL, 4, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341042, 87, 7, NULL, 1, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341043, 88, 24, NULL, 2, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341044, 89, 1, NULL, 1, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341045, 90, 23, NULL, 1, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341046, 91, 39, NULL, 4, CAST(31.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341047, 92, 12, NULL, 2, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341048, 93, 5, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341049, 94, 2, NULL, 3, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341050, 95, 3, NULL, 1, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341051, 96, 2, NULL, 1, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341052, 97, 20, NULL, 3, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341053, 98, 37, NULL, 4, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341054, 99, 17, NULL, 4, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341055, 100, 16, NULL, 3, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341056, 101, 10, NULL, 3, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341057, 102, 12, NULL, 3, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341058, 103, 14, NULL, 1, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341059, 104, 12, NULL, 4, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341060, 105, 11, NULL, 1, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341061, 106, 15, NULL, 3, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341062, 107, 39, NULL, 2, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341063, 108, 23, NULL, 4, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341064, 109, 26, NULL, 2, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341065, 110, 19, NULL, 2, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341066, 111, 21, NULL, 3, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341067, 112, 26, NULL, 3, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341068, 113, 27, NULL, 3, CAST(51.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341069, 114, 38, NULL, 1, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341070, 115, 33, NULL, 1, CAST(27.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341071, 116, 8, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341072, 117, 38, NULL, 4, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341073, 118, 7, NULL, 4, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341074, 119, 1, NULL, 4, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341075, 120, 1, NULL, 5, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341076, 121, NULL, 1, 1, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341077, 122, NULL, 1, 3, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341078, 123, NULL, 1, 4, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341079, 124, 2, NULL, 10, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341080, 125, 7, 1, 8, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341081, 126, NULL, 1, 10, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341082, 127, NULL, 3, 8, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341083, 128, NULL, 1, 9, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341084, 129, NULL, 10, 4, CAST(34.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341085, 130, 12, NULL, 8, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341086, 131, NULL, 1, 2, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341087, 132, 14, 1, 9, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341088, 133, 15, NULL, 8, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341089, 134, 16, 1, 9, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341090, 135, NULL, 1, 2, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341091, 136, NULL, 3, 6, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341092, 137, NULL, 4, 7, CAST(55.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341093, 138, NULL, 2, 4, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341094, 139, NULL, 1, 9, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341095, 140, 22, 1, 6, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341096, 141, 23, NULL, 2, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341097, 142, 24, 1, 8, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341098, 143, 15, NULL, 5, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341099, 144, NULL, 1, 10, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341100, 145, 27, NULL, 6, CAST(51.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341101, 146, NULL, 1, 3, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341102, 147, NULL, 1, 1, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341103, 148, 30, 1, 5, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341104, 149, 31, 1, 3, CAST(57.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341105, 150, 32, NULL, 5, CAST(25.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341106, 151, 33, 1, 4, CAST(27.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341107, 152, 34, NULL, 7, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341108, 153, 35, 1, 7, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341109, 154, 1, NULL, 10, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341110, 155, 37, 1, 6, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341111, 156, 38, NULL, 3, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341112, 157, 39, NULL, 10, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341113, 158, 29, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341114, 159, NULL, 12, 3, CAST(66.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341115, 160, NULL, 10, 2, CAST(34.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341116, 161, 45, NULL, 6, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341117, 162, NULL, 1, 1, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341118, 163, 49, 11, 6, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341119, 164, 1, NULL, 8, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341120, 165, 2, NULL, 1, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341121, 166, 3, NULL, 10, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341122, 167, 17, NULL, 9, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341123, 168, NULL, 2, 4, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341124, 169, 6, NULL, 6, CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341125, 170, 7, NULL, 4, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341126, 171, 8, 2, 5, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341127, 172, 9, 2, 7, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341128, 173, 29, NULL, 4, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341129, 174, NULL, 2, 5, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341130, 175, NULL, 2, 8, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341131, 176, 29, NULL, 5, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341132, 177, 14, 2, 10, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341133, 178, 29, NULL, 3, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341134, 179, 16, NULL, 8, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341135, 180, NULL, 10, 8, CAST(34.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341136, 181, NULL, 11, 10, CAST(64.20 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341137, 182, NULL, 12, 1, CAST(66.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341138, 183, NULL, 13, 4, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341139, 184, NULL, 14, 9, CAST(37.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341140, 185, NULL, 2, 10, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341141, 186, NULL, 1, 3, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341142, 187, NULL, 2, 7, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341143, 188, NULL, 2, 10, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341144, 189, NULL, 5, 2, CAST(32.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341145, 190, 27, NULL, 2, CAST(51.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341146, 191, NULL, 3, 10, CAST(85.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341147, 192, 29, NULL, 5, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341148, 193, NULL, 2, 7, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341149, 194, NULL, 2, 1, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341150, 195, 32, NULL, 4, CAST(25.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341151, 196, 10, NULL, 4, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341152, 197, 34, NULL, 9, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341153, 198, NULL, 2, 9, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341154, 199, 36, NULL, 3, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341155, 200, 37, NULL, 7, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341156, 201, 38, NULL, 8, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341157, 202, 11, NULL, 2, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341158, 203, NULL, 2, 4, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341159, 204, NULL, 2, 1, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341160, 205, 44, NULL, 8, CAST(2600.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341161, 206, NULL, 2, 2, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341162, 207, 46, NULL, 8, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341163, 208, 49, NULL, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341164, 209, NULL, 3, 4, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341165, 210, NULL, 3, 4, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341166, 211, 17, NULL, 7, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341167, 212, 4, NULL, 4, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341168, 213, 5, NULL, 3, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341169, 214, NULL, 3, 7, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341170, 215, NULL, 3, 10, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341171, 216, 8, NULL, 8, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341172, 217, NULL, 3, 8, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341173, 218, 23, NULL, 8, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341174, 219, NULL, 3, 4, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341175, 220, 21, NULL, 2, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341176, 221, NULL, 3, 7, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341177, 222, 22, NULL, 5, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341178, 223, 15, 3, 10, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341179, 224, 16, NULL, 5, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341180, 225, 17, NULL, 7, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341181, 226, 18, NULL, 4, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341182, 227, NULL, 12, 3, CAST(66.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341183, 228, NULL, 3, 9, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341184, 229, NULL, 3, 10, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341185, 230, NULL, 11, 2, CAST(64.20 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341186, 231, NULL, 3, 6, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341187, 232, 1, NULL, 3, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341188, 233, 2, NULL, 7, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341189, 234, 26, NULL, 2, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341190, 235, 3, NULL, 8, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341191, 236, 28, NULL, 10, CAST(55.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341192, 237, NULL, 3, 5, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341193, 238, 4, NULL, 1, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341194, 239, 31, NULL, 5, CAST(57.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341195, 240, NULL, 3, 7, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341196, 241, 33, NULL, 5, CAST(27.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341197, 242, 34, 3, 9, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341198, 243, 35, 3, 3, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341199, 244, 36, NULL, 9, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341200, 245, NULL, 3, 6, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341201, 246, 15, NULL, 3, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341202, 247, 31, NULL, 3, CAST(57.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341203, 248, 37, NULL, 4, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341204, 249, 3, NULL, 1, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341205, 250, 3, NULL, 4, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341206, 251, 5, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341207, 252, 39, NULL, 4, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341208, 253, 1, NULL, 3, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341209, 254, 7, NULL, 2, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341210, 255, 15, NULL, 2, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341211, 256, 9, NULL, 1, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341212, 257, 3, NULL, 2, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341213, 258, 36, NULL, 3, CAST(40.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341214, 259, 6, NULL, 1, CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341215, 260, 24, NULL, 1, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341216, 261, 11, NULL, 2, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341217, 262, 32, NULL, 1, CAST(25.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341218, 263, 4, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341219, 264, 10, NULL, 4, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341220, 265, 39, NULL, 4, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341221, 266, 17, NULL, 1, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341222, 267, 3, NULL, 2, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341223, 268, 22, NULL, 2, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341224, 269, 19, NULL, 4, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341225, 270, 27, NULL, 4, CAST(51.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341226, 271, 26, NULL, 1, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341227, 272, 22, NULL, 2, CAST(48.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341228, 273, 4, NULL, 4, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341229, 274, 7, NULL, 1, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341230, 275, 24, NULL, 2, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341231, 276, 1, NULL, 1, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341232, 277, 23, NULL, 1, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341233, 278, 39, NULL, 4, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341234, 279, 12, NULL, 2, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341235, 280, 5, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341236, 281, 2, NULL, 3, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341237, 282, 3, NULL, 1, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341238, 283, 2, NULL, 1, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341239, 284, 20, NULL, 3, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341240, 285, 37, NULL, 4, CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341241, 286, 17, NULL, 4, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341242, 287, 16, NULL, 3, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341243, 288, 10, NULL, 3, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341244, 289, 12, NULL, 3, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341245, 290, 14, NULL, 1, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341246, 291, 12, NULL, 4, CAST(42.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341247, 292, 11, NULL, 1, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341248, 293, 15, NULL, 3, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341249, 294, 39, NULL, 2, CAST(31.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341250, 295, 23, NULL, 4, CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341251, 296, 26, NULL, 2, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341252, 297, 19, NULL, 2, CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341253, 298, 21, NULL, 3, CAST(37.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341254, 299, 26, NULL, 3, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341255, 300, 27, NULL, 3, CAST(51.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341256, 301, 38, NULL, 1, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341257, 302, 33, NULL, 1, CAST(27.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341258, 303, 8, NULL, 2, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341259, 304, 38, NULL, 4, CAST(28.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341260, 305, 7, NULL, 4, CAST(39.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341261, 306, 1, NULL, 4, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341267, 1, 1, NULL, 1, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341268, 1, NULL, 1, 1, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341269, 1, 1, NULL, 1, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341276, 435, 1, NULL, 1, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341277, 436, 1, NULL, 2, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341278, 436, NULL, 3, 2, CAST(85.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341279, 437, 4, NULL, 5, CAST(49.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341280, 437, NULL, 1, 1, CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341281, 438, 1, NULL, 1, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341282, 439, 6, NULL, 1, CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341283, 439, NULL, 35, 1, CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341284, 440, NULL, 17, 1, CAST(45.60 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341285, 440, NULL, 18, 1, CAST(55.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341290, 445, NULL, 18, 1, CAST(55.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341291, 446, NULL, 18, 1, CAST(55.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341292, 446, NULL, 16, 2, CAST(36.40 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341293, 447, NULL, 2, 1, CAST(41.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341294, 448, 1, NULL, 1, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesVentas] ([DetalleDeVentaId], [VentaId], [BombonId], [CajaId], [Cantidad], [Precio]) VALUES (341295, 448, NULL, 2, 1, CAST(41.50 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[DetallesVentas] OFF
GO
SET IDENTITY_INSERT [dbo].[Direcciones] ON 

INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (1, N'San Blas', N'540', NULL, NULL, NULL, NULL, 5, 1, 3, N'1520      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (2, N'Nogoya', N'1240', NULL, NULL, NULL, NULL, 5, 9, 4, N'7245      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (3, N'Cuenca', N'2300', NULL, NULL, NULL, NULL, 5, 1, 3, N'1520      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (4, N'San Juan', N'1530', NULL, NULL, NULL, NULL, 5, 9, 6, N'7220      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (5, N'Av.alvarez Jonte', N'1200', NULL, NULL, NULL, NULL, 5, 1, 3, N'1520      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (6, N'Pareja', N'1005', NULL, NULL, NULL, NULL, 5, 9, 6, N'7220      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (7, N'Av. Nazca', N'1909', NULL, NULL, NULL, NULL, 5, 1, 3, N'1520      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (8, N'Carlos Calvo', N'845', NULL, NULL, NULL, NULL, 5, 9, 4, N'7245      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (9, N'Moreno ', N'1324', NULL, NULL, NULL, NULL, 5, 1, 3, N'1600      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (10, N'Callao', N'906', NULL, NULL, NULL, NULL, 5, 1, 3, N'1700      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (11, N'Paraguay ', N'1800', NULL, NULL, NULL, NULL, 5, 9, 2, N'7240      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (12, N'Paraguay ', N'2300', NULL, NULL, NULL, NULL, 5, 9, 4, N'7245      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (13, N'Córdoba ', N'908', NULL, NULL, NULL, NULL, 5, 1, 3, N'1725      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (14, N'Sarmiento ', N'1560', NULL, NULL, NULL, NULL, 5, 9, 2, N'7240      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (15, N'Bme. Mitre ', N'1600', NULL, NULL, NULL, NULL, 5, 9, 17, N'6605      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (16, N'Rivadavia ', N'1329', NULL, NULL, NULL, NULL, 5, 1, 3, N'1650      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (17, N'Arenales ', N'1890', NULL, NULL, NULL, NULL, 5, 1, 3, N'1450      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (18, N'Berutti ', N'2300', NULL, NULL, NULL, NULL, 5, 1, 3, N'1450      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (19, N'Sta. Fe ', N'2400', NULL, NULL, NULL, NULL, 5, 9, 17, N'6605      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (20, N'Bulnes ', N'1200', NULL, NULL, NULL, NULL, 5, 1, 3, N'1425      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (21, N'Charcas ', N'2890', NULL, NULL, NULL, NULL, 5, 9, 6, N'7220      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (22, N'Mansilla ', N'2670', NULL, NULL, NULL, NULL, 5, 9, 2, N'7240      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (23, N'Paraguay ', N'1900', NULL, NULL, NULL, NULL, 5, 1, 3, N'1450      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (24, N'Sta. Fe ', N'1870', NULL, NULL, NULL, NULL, 5, 9, 17, N'6605      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (25, N'Arenales ', N'2300', NULL, NULL, NULL, NULL, 5, 9, 4, N'7245      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (26, N'Vidt ', N'2100', NULL, NULL, NULL, NULL, 5, 9, 2, N'7240      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (27, N'Berutti', N'2120', NULL, NULL, NULL, NULL, 5, 1, 3, N'1455      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (28, N'Arenales', N'2340', NULL, NULL, NULL, NULL, 5, 1, 3, N'1455      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (29, N'Charcas ', N'2680', NULL, NULL, NULL, NULL, 5, 9, 6, N'7220      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (30, N'Callao ', N'1200', NULL, NULL, NULL, NULL, 5, 1, 3, N'1800      ')
INSERT [dbo].[Direcciones] ([DireccionId], [Calle], [Altura], [Entre1], [Entre2], [Piso], [Depto], [PaisId], [ProvinciaEstadoId], [CiudadId], [CodPostal]) VALUES (34, N'xxx', N'100', N'', N'', NULL, N'          ', 5, 9, 2, N'7240      ')
SET IDENTITY_INSERT [dbo].[Direcciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Fabricas] ON 

INSERT [dbo].[Fabricas] ([FabricaId], [NombreFabrica], [Direccion], [PaisId], [ProvinciaEstadoId], [CiudadId]) VALUES (1, N'Dulxes', N'Sao Pablo 1234', 4, 2, 34)
INSERT [dbo].[Fabricas] ([FabricaId], [NombreFabrica], [Direccion], [PaisId], [ProvinciaEstadoId], [CiudadId]) VALUES (2, N'Cacao Azteca', N'Paseo La Plaza 1400', 1, 5, 36)
INSERT [dbo].[Fabricas] ([FabricaId], [NombreFabrica], [Direccion], [PaisId], [ProvinciaEstadoId], [CiudadId]) VALUES (3, N'Bombones Deluxe', N'Constitución 1230', 5, 1, 3)
INSERT [dbo].[Fabricas] ([FabricaId], [NombreFabrica], [Direccion], [PaisId], [ProvinciaEstadoId], [CiudadId]) VALUES (4, N'Chocolate Inc', N'1240 Hannover Str.', 3, 8, 35)
INSERT [dbo].[Fabricas] ([FabricaId], [NombreFabrica], [Direccion], [PaisId], [ProvinciaEstadoId], [CiudadId]) VALUES (5, N'Bombones Suizos', N'Carabineros 234', 4, 7, 33)
INSERT [dbo].[Fabricas] ([FabricaId], [NombreFabrica], [Direccion], [PaisId], [ProvinciaEstadoId], [CiudadId]) VALUES (9, N'BomboneX', N'Pato de Cañada 23', 5, 1, 3)
INSERT [dbo].[Fabricas] ([FabricaId], [NombreFabrica], [Direccion], [PaisId], [ProvinciaEstadoId], [CiudadId]) VALUES (10, N'Kofler Inc.', N'Los pozos ciegos 120', 5, 9, 2)
INSERT [dbo].[Fabricas] ([FabricaId], [NombreFabrica], [Direccion], [PaisId], [ProvinciaEstadoId], [CiudadId]) VALUES (11, N'Xokolates', N'Teotihuakan 1560', 1, 5, 36)
SET IDENTITY_INSERT [dbo].[Fabricas] OFF
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 

INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (27, N'Alaska')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (25, N'Albania')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (13, N'Alemania')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (5, N'Argentina')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (11, N'Australia')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (18, N'Belgica')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (2, N'Brasil')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (4, N'Chile')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (28, N'Colombia')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (17, N'Dinamarca')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (10, N'Escosia')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (24, N'España')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (3, N'Estados Unidos')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (15, N'Finlandia')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (20, N'Francia')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (30, N'Guatemala')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (22, N'Indonesia')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (8, N'Inglaterra')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (9, N'Irlanda')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (31, N'Islandia')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (23, N'Islas Feroe')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (29, N'Marruecos')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (1, N'México')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (14, N'Noruega')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (12, N'Nueva Zelandia')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (19, N'Países Bajos')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (32, N'Perú')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (16, N'Suecia')
INSERT [dbo].[Paises] ([PaisId], [NombrePais]) VALUES (7, N'Uruguay')
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
SET IDENTITY_INSERT [dbo].[ProvinciasEstados] ON 

INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (14, N'Arkansas', 3)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (26, N'Barcelona', 24)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (4, N'Brasilia', 2)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (22, N'Brujas', 18)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (9, N'Buenos Aires', 5)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (18, N'Camberra', 11)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (1, N'Ciudad Autónoma de Buenos Aires', 5)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (25, N'Copenaghe', 17)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (2, N'Córdoba', 5)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (19, N'Córdoba', 24)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (27, N'Cork', 9)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (21, N'Florianopolis', 2)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (10, N'Guadalajara', 1)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (5, N'Mexico D.F.', 1)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (8, N'Nueva York', 3)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (23, N'Oslo', 14)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (24, N'Oxford', 8)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (6, N'Quintana Roo', 1)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (3, N'San Pablo', 2)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (7, N'Santiago de Chile', 4)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (11, N'Texas', 3)
INSERT [dbo].[ProvinciasEstados] ([ProvinciaEstadoId], [NombreProvinciaEstado], [PaisId]) VALUES (20, N'Toledo', 24)
SET IDENTITY_INSERT [dbo].[ProvinciasEstados] OFF
GO
SET IDENTITY_INSERT [dbo].[Telefonos] ON 

INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (31, N'422230')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (9, N'4326-1214')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (8, N'4383-2040')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (4, N'4383-7890')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (7, N'4576-1024')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (2, N'4583-5678')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (1, N'4585-3040')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (5, N'4585-6060')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (3, N'4588-9060')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (6, N'4600-4050')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (10, N'4800-4076')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (11, N'4812-2345')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (12, N'4812-8970')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (13, N'4813-1090')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (19, N'4821-1230')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (18, N'4821-5609')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (17, N'4821-9078')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (25, N'4821-9087')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (29, N'4823-1235')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (21, N'4824-1230')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (24, N'4826-0011')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (20, N'4826-1230')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (30, N'4826-9005')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (26, N'4829-0220')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (27, N'4829-0909')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (28, N'4829-1234')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (14, N'4954-5060')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (23, N'4962-9009')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (22, N'821-4567')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (16, N'953-6578')
INSERT [dbo].[Telefonos] ([TelefonoId], [Numero]) VALUES (15, N'954-7890')
SET IDENTITY_INSERT [dbo].[Telefonos] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDeChocolates] ON 

INSERT [dbo].[TiposDeChocolates] ([TipoDeChocolateId], [Descripcion]) VALUES (1, N'Agridulce')
INSERT [dbo].[TiposDeChocolates] ([TipoDeChocolateId], [Descripcion]) VALUES (2, N'Blanco')
INSERT [dbo].[TiposDeChocolates] ([TipoDeChocolateId], [Descripcion]) VALUES (3, N'Leche')
INSERT [dbo].[TiposDeChocolates] ([TipoDeChocolateId], [Descripcion]) VALUES (4, N'Oscuro')
INSERT [dbo].[TiposDeChocolates] ([TipoDeChocolateId], [Descripcion]) VALUES (5, N'Puro')
SET IDENTITY_INSERT [dbo].[TiposDeChocolates] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDeNueces] ON 

INSERT [dbo].[TiposDeNueces] ([TipoDeNuezId], [Descripcion]) VALUES (1, N'Almendra')
INSERT [dbo].[TiposDeNueces] ([TipoDeNuezId], [Descripcion]) VALUES (2, N'Anacardo')
INSERT [dbo].[TiposDeNueces] ([TipoDeNuezId], [Descripcion]) VALUES (3, N'Avellana')
INSERT [dbo].[TiposDeNueces] ([TipoDeNuezId], [Descripcion]) VALUES (4, N'Castaña del Brasil')
INSERT [dbo].[TiposDeNueces] ([TipoDeNuezId], [Descripcion]) VALUES (5, N'Macadamia')
INSERT [dbo].[TiposDeNueces] ([TipoDeNuezId], [Descripcion]) VALUES (6, N'Ninguna')
INSERT [dbo].[TiposDeNueces] ([TipoDeNuezId], [Descripcion]) VALUES (7, N'Nuez')
INSERT [dbo].[TiposDeNueces] ([TipoDeNuezId], [Descripcion]) VALUES (8, N'Pistacho')
INSERT [dbo].[TiposDeNueces] ([TipoDeNuezId], [Descripcion]) VALUES (14, N'afdasf')
SET IDENTITY_INSERT [dbo].[TiposDeNueces] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDeRellenos] ON 

INSERT [dbo].[TiposDeRellenos] ([TipoDeRellenoId], [Descripcion]) VALUES (1, N'Amaretto')
INSERT [dbo].[TiposDeRellenos] ([TipoDeRellenoId], [Descripcion]) VALUES (2, N'Baya')
INSERT [dbo].[TiposDeRellenos] ([TipoDeRellenoId], [Descripcion]) VALUES (3, N'Cereza entera')
INSERT [dbo].[TiposDeRellenos] ([TipoDeRellenoId], [Descripcion]) VALUES (4, N'Coco')
INSERT [dbo].[TiposDeRellenos] ([TipoDeRellenoId], [Descripcion]) VALUES (5, N'Crema de cereza')
INSERT [dbo].[TiposDeRellenos] ([TipoDeRellenoId], [Descripcion]) VALUES (6, N'Crema de Moca')
INSERT [dbo].[TiposDeRellenos] ([TipoDeRellenoId], [Descripcion]) VALUES (7, N'Fresa')
INSERT [dbo].[TiposDeRellenos] ([TipoDeRellenoId], [Descripcion]) VALUES (8, N'Mantequilla cacahuate')
INSERT [dbo].[TiposDeRellenos] ([TipoDeRellenoId], [Descripcion]) VALUES (9, N'Mazapán')
INSERT [dbo].[TiposDeRellenos] ([TipoDeRellenoId], [Descripcion]) VALUES (10, N'Mermelada')
INSERT [dbo].[TiposDeRellenos] ([TipoDeRellenoId], [Descripcion]) VALUES (11, N'Mora')
INSERT [dbo].[TiposDeRellenos] ([TipoDeRellenoId], [Descripcion]) VALUES (12, N'Ninguno')
SET IDENTITY_INSERT [dbo].[TiposDeRellenos] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDirecciones] ON 

INSERT [dbo].[TiposDirecciones] ([TipoDireccionId], [Descripcion]) VALUES (3, N'Envío')
INSERT [dbo].[TiposDirecciones] ([TipoDireccionId], [Descripcion]) VALUES (2, N'Laboral')
INSERT [dbo].[TiposDirecciones] ([TipoDireccionId], [Descripcion]) VALUES (1, N'Residencial')
SET IDENTITY_INSERT [dbo].[TiposDirecciones] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposTelefonos] ON 

INSERT [dbo].[TiposTelefonos] ([TipoTelefonoId], [Descripcion]) VALUES (2, N'Laboral')
INSERT [dbo].[TiposTelefonos] ([TipoTelefonoId], [Descripcion]) VALUES (1, N'Particular')
SET IDENTITY_INSERT [dbo].[TiposTelefonos] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 

INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (1, 1, CAST(N'2019-01-02T00:00:00.000' AS DateTime), 1, NULL, CAST(273.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (2, 2, CAST(N'2019-01-02T00:00:00.000' AS DateTime), 1, NULL, CAST(171.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (3, 3, CAST(N'2019-01-02T00:00:00.000' AS DateTime), 1, NULL, CAST(189.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (4, 4, CAST(N'2019-01-04T00:00:00.000' AS DateTime), 1, NULL, CAST(279.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (5, 5, CAST(N'2019-01-06T00:00:00.000' AS DateTime), 1, NULL, CAST(324.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (6, 8, CAST(N'2019-01-07T00:00:00.000' AS DateTime), 1, NULL, CAST(153.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (7, 10, CAST(N'2019-01-09T00:00:00.000' AS DateTime), 0, NULL, CAST(126.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (8, 11, CAST(N'2019-01-10T00:00:00.000' AS DateTime), 0, NULL, CAST(175.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (9, 12, CAST(N'2019-01-12T00:00:00.000' AS DateTime), 0, NULL, CAST(118.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (10, 13, CAST(N'2019-01-15T00:00:00.000' AS DateTime), 1, NULL, CAST(405.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (11, 14, CAST(N'2019-01-17T00:00:00.000' AS DateTime), 1, NULL, CAST(225.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (12, 15, CAST(N'2019-01-18T00:00:00.000' AS DateTime), 1, NULL, CAST(432.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (13, 16, CAST(N'2019-01-18T00:00:00.000' AS DateTime), 1, NULL, CAST(333.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (14, 18, CAST(N'2019-01-21T00:00:00.000' AS DateTime), 1, NULL, CAST(160.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (15, 19, CAST(N'2019-01-21T00:00:00.000' AS DateTime), 1, NULL, CAST(210.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (16, 21, CAST(N'2019-01-23T00:00:00.000' AS DateTime), 0, NULL, CAST(207.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (17, 22, CAST(N'2019-01-24T00:00:00.000' AS DateTime), 0, NULL, CAST(81.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (18, 24, CAST(N'2019-01-26T00:00:00.000' AS DateTime), 0, NULL, CAST(247.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (19, 25, CAST(N'2019-01-28T00:00:00.000' AS DateTime), 0, NULL, CAST(273.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (20, 26, CAST(N'2019-02-01T00:00:00.000' AS DateTime), 1, NULL, CAST(261.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (21, 27, CAST(N'2019-02-05T00:00:00.000' AS DateTime), 1, NULL, CAST(228.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (22, 28, CAST(N'2019-02-05T00:00:00.000' AS DateTime), 1, NULL, CAST(31.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (23, 29, CAST(N'2019-02-07T00:00:00.000' AS DateTime), 1, NULL, CAST(112.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (24, 30, CAST(N'2019-02-08T00:00:00.000' AS DateTime), 1, NULL, CAST(63.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (25, 1, CAST(N'2019-02-09T00:00:00.000' AS DateTime), 1, NULL, CAST(138.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (26, 2, CAST(N'2019-02-10T00:00:00.000' AS DateTime), 0, NULL, CAST(120.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (27, 3, CAST(N'2019-02-10T00:00:00.000' AS DateTime), 0, NULL, CAST(84.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (28, 4, CAST(N'2019-02-12T00:00:00.000' AS DateTime), 0, NULL, CAST(112.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (29, 5, CAST(N'2019-02-12T00:00:00.000' AS DateTime), 0, NULL, CAST(180.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (30, 6, CAST(N'2019-02-14T00:00:00.000' AS DateTime), 1, NULL, CAST(153.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (31, 7, CAST(N'2019-02-14T00:00:00.000' AS DateTime), 1, NULL, CAST(28.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (32, 8, CAST(N'2019-02-14T00:00:00.000' AS DateTime), 1, NULL, CAST(27.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (33, 9, CAST(N'2019-02-16T00:00:00.000' AS DateTime), 1, NULL, CAST(99.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (34, 10, CAST(N'2019-02-16T00:00:00.000' AS DateTime), 1, NULL, CAST(114.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (35, 11, CAST(N'2019-02-17T00:00:00.000' AS DateTime), 1, NULL, CAST(156.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (36, 12, CAST(N'2019-02-21T00:00:00.000' AS DateTime), 0, NULL, CAST(1329.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (37, 13, CAST(N'2019-02-22T00:00:00.000' AS DateTime), 0, NULL, CAST(535.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (38, 14, CAST(N'2019-02-22T00:00:00.000' AS DateTime), 0, NULL, CAST(762.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (39, 15, CAST(N'2019-02-27T00:00:00.000' AS DateTime), 0, NULL, CAST(848.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (40, 16, CAST(N'2019-03-01T00:00:00.000' AS DateTime), 1, NULL, CAST(458.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (41, 17, CAST(N'2019-03-02T00:00:00.000' AS DateTime), 1, NULL, CAST(911.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (42, 18, CAST(N'2019-03-03T00:00:00.000' AS DateTime), 1, NULL, CAST(1194.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (43, 19, CAST(N'2019-03-05T00:00:00.000' AS DateTime), 1, NULL, CAST(186.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (44, 20, CAST(N'2019-03-08T00:00:00.000' AS DateTime), 1, NULL, CAST(1054.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (45, 21, CAST(N'2019-03-08T00:00:00.000' AS DateTime), 1, NULL, CAST(498.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (46, 22, CAST(N'2019-03-10T00:00:00.000' AS DateTime), 0, NULL, CAST(603.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (47, 23, CAST(N'2019-03-12T00:00:00.000' AS DateTime), 0, NULL, CAST(177.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (48, 24, CAST(N'2019-03-14T00:00:00.000' AS DateTime), 0, NULL, CAST(874.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (49, 25, CAST(N'2019-03-16T00:00:00.000' AS DateTime), 1, NULL, CAST(942.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (50, 26, CAST(N'2019-03-19T00:00:00.000' AS DateTime), 1, NULL, CAST(595.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (51, 27, CAST(N'2019-03-19T00:00:00.000' AS DateTime), 1, NULL, CAST(308.70 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (52, 28, CAST(N'2019-03-21T00:00:00.000' AS DateTime), 1, NULL, CAST(573.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (53, 29, CAST(N'2019-03-22T00:00:00.000' AS DateTime), 1, NULL, CAST(669.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (54, 30, CAST(N'2019-03-24T00:00:00.000' AS DateTime), 1, NULL, CAST(375.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (55, 6, CAST(N'2019-03-25T00:00:00.000' AS DateTime), 0, NULL, CAST(525.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (56, 5, CAST(N'2019-03-26T00:00:00.000' AS DateTime), 0, NULL, CAST(373.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (57, 4, CAST(N'2019-03-28T00:00:00.000' AS DateTime), 0, NULL, CAST(670.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (58, 3, CAST(N'2019-03-29T00:00:00.000' AS DateTime), 0, NULL, CAST(601.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (59, 2, CAST(N'2019-03-30T00:00:00.000' AS DateTime), 1, NULL, CAST(141.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (60, 8, CAST(N'2019-03-30T00:00:00.000' AS DateTime), 1, NULL, CAST(411.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (61, 9, CAST(N'2019-04-01T00:00:00.000' AS DateTime), 1, NULL, CAST(315.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (62, 11, CAST(N'2019-04-01T00:00:00.000' AS DateTime), 1, NULL, CAST(172.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (63, 14, CAST(N'2019-04-02T00:00:00.000' AS DateTime), 1, NULL, CAST(288.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (64, 15, CAST(N'2019-04-03T00:00:00.000' AS DateTime), 1, NULL, CAST(361.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (65, 1, CAST(N'2019-04-05T00:00:00.000' AS DateTime), 0, NULL, CAST(325.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (66, 2, CAST(N'2019-04-07T00:00:00.000' AS DateTime), 0, NULL, CAST(858.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (67, 3, CAST(N'2019-04-10T00:00:00.000' AS DateTime), 0, NULL, CAST(294.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (68, 4, CAST(N'2019-04-11T00:00:00.000' AS DateTime), 0, NULL, CAST(160.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (69, 5, CAST(N'2019-04-12T00:00:00.000' AS DateTime), 1, NULL, CAST(351.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (70, 8, CAST(N'2019-04-14T00:00:00.000' AS DateTime), 1, NULL, CAST(189.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (71, 10, CAST(N'2019-04-15T00:00:00.000' AS DateTime), 1, NULL, CAST(320.70 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (72, 11, CAST(N'2019-04-15T00:00:00.000' AS DateTime), 1, NULL, CAST(123.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (73, 12, CAST(N'2019-04-17T00:00:00.000' AS DateTime), 1, NULL, CAST(1830.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (74, 13, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 1, NULL, CAST(91.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (75, 14, CAST(N'2019-04-21T00:00:00.000' AS DateTime), 0, NULL, CAST(1225.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (76, 15, CAST(N'2019-04-23T00:00:00.000' AS DateTime), 0, NULL, CAST(627.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (77, 16, CAST(N'2019-04-26T00:00:00.000' AS DateTime), 0, NULL, CAST(216.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (78, 18, CAST(N'2019-04-26T00:00:00.000' AS DateTime), 0, NULL, CAST(576.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (79, 19, CAST(N'2019-04-26T00:00:00.000' AS DateTime), 1, NULL, CAST(390.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (80, 21, CAST(N'2019-04-28T00:00:00.000' AS DateTime), 1, NULL, CAST(256.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (81, 22, CAST(N'2019-04-28T00:00:00.000' AS DateTime), 1, NULL, CAST(420.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (82, 24, CAST(N'2019-04-28T00:00:00.000' AS DateTime), 1, NULL, CAST(324.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (83, 25, CAST(N'2019-04-29T00:00:00.000' AS DateTime), 1, NULL, CAST(451.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (84, 26, CAST(N'2019-04-29T00:00:00.000' AS DateTime), 1, NULL, CAST(312.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (85, 27, CAST(N'2019-04-30T00:00:00.000' AS DateTime), 0, NULL, CAST(294.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (86, 28, CAST(N'2019-04-30T00:00:00.000' AS DateTime), 0, NULL, CAST(405.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (87, 29, CAST(N'2019-04-30T00:00:00.000' AS DateTime), 0, NULL, CAST(371.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (88, 30, CAST(N'2019-04-30T00:00:00.000' AS DateTime), 0, NULL, CAST(307.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (89, 22, CAST(N'2019-05-01T00:00:00.000' AS DateTime), 1, NULL, CAST(666.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (90, 23, CAST(N'2019-05-01T00:00:00.000' AS DateTime), 1, NULL, CAST(183.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (91, 24, CAST(N'2019-05-01T00:00:00.000' AS DateTime), 1, NULL, CAST(438.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (92, 25, CAST(N'2019-05-02T00:00:00.000' AS DateTime), 1, NULL, CAST(362.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (93, 26, CAST(N'2019-05-02T00:00:00.000' AS DateTime), 1, NULL, CAST(741.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (94, 27, CAST(N'2019-05-02T00:00:00.000' AS DateTime), 1, NULL, CAST(174.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (95, 28, CAST(N'2019-05-03T00:00:00.000' AS DateTime), 0, NULL, CAST(213.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (96, 29, CAST(N'2019-05-03T00:00:00.000' AS DateTime), 0, NULL, CAST(376.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (97, 30, CAST(N'2019-05-03T00:00:00.000' AS DateTime), 0, NULL, CAST(518.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (98, 21, CAST(N'2019-05-03T00:00:00.000' AS DateTime), 0, NULL, CAST(230.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (99, 22, CAST(N'2019-05-04T00:00:00.000' AS DateTime), 1, NULL, CAST(446.50 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (100, 23, CAST(N'2019-05-04T00:00:00.000' AS DateTime), 1, NULL, CAST(532.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (101, 25, CAST(N'2019-05-04T00:00:00.000' AS DateTime), 1, NULL, CAST(199.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (102, 1, CAST(N'2019-05-04T00:00:00.000' AS DateTime), 1, NULL, CAST(228.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (103, 2, CAST(N'2019-05-04T00:00:00.000' AS DateTime), 1, NULL, CAST(918.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (104, 3, CAST(N'2019-05-05T00:00:00.000' AS DateTime), 1, NULL, CAST(415.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (105, 30, CAST(N'2019-05-05T00:00:00.000' AS DateTime), 0, NULL, CAST(322.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (106, 3, CAST(N'2019-05-05T00:00:00.000' AS DateTime), 0, NULL, CAST(154.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (107, 4, CAST(N'2019-05-05T00:00:00.000' AS DateTime), 0, NULL, CAST(165.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (108, 5, CAST(N'2019-05-06T00:00:00.000' AS DateTime), 0, NULL, CAST(318.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (109, 6, CAST(N'2019-05-08T00:00:00.000' AS DateTime), 1, NULL, CAST(457.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (110, 7, CAST(N'2019-05-08T00:00:00.000' AS DateTime), 1, NULL, CAST(457.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (111, 8, CAST(N'2019-05-08T00:00:00.000' AS DateTime), 1, NULL, CAST(234.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (112, 11, CAST(N'2019-05-09T00:00:00.000' AS DateTime), 1, NULL, CAST(432.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (113, 12, CAST(N'2019-05-09T00:00:00.000' AS DateTime), 1, NULL, CAST(381.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (114, 16, CAST(N'2019-05-09T00:00:00.000' AS DateTime), 1, NULL, CAST(91.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (115, 17, CAST(N'2019-05-09T00:00:00.000' AS DateTime), 0, NULL, CAST(193.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (116, 20, CAST(N'2019-05-10T00:00:00.000' AS DateTime), 0, NULL, CAST(140.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (117, 22, CAST(N'2019-05-10T00:00:00.000' AS DateTime), 0, NULL, CAST(20914.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (118, 23, CAST(N'2019-05-10T00:00:00.000' AS DateTime), 0, NULL, CAST(239.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (119, 21, CAST(N'2019-05-10T00:00:00.000' AS DateTime), 1, NULL, CAST(1864.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (120, 11, CAST(N'2019-05-10T00:00:00.000' AS DateTime), 1, NULL, CAST(530.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (121, 12, CAST(N'2019-05-11T00:00:00.000' AS DateTime), 1, NULL, CAST(372.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (122, 14, CAST(N'2019-05-11T00:00:00.000' AS DateTime), 1, NULL, CAST(429.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (123, 15, CAST(N'2019-05-11T00:00:00.000' AS DateTime), 1, NULL, CAST(388.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (124, 22, CAST(N'2019-05-11T00:00:00.000' AS DateTime), 1, NULL, CAST(558.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (125, 23, CAST(N'2019-05-12T00:00:00.000' AS DateTime), 0, NULL, CAST(460.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (126, 2, CAST(N'2019-05-12T00:00:00.000' AS DateTime), 0, NULL, CAST(888.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (127, 4, CAST(N'2019-05-12T00:00:00.000' AS DateTime), 0, NULL, CAST(1544.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (128, 5, CAST(N'2019-05-12T00:00:00.000' AS DateTime), 0, NULL, CAST(655.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (129, 1, CAST(N'2019-05-13T00:00:00.000' AS DateTime), 1, NULL, CAST(825.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (130, 2, CAST(N'2019-05-13T00:00:00.000' AS DateTime), 1, NULL, CAST(612.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (131, 3, CAST(N'2019-05-13T00:00:00.000' AS DateTime), 1, NULL, CAST(400.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (132, 4, CAST(N'2019-05-14T00:00:00.000' AS DateTime), 1, NULL, CAST(615.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (133, 5, CAST(N'2019-05-14T00:00:00.000' AS DateTime), 1, NULL, CAST(900.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (134, 8, CAST(N'2019-05-16T00:00:00.000' AS DateTime), 0, NULL, CAST(591.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (135, 10, CAST(N'2019-05-16T00:00:00.000' AS DateTime), 0, NULL, CAST(432.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (136, 11, CAST(N'2019-05-16T00:00:00.000' AS DateTime), 0, NULL, CAST(709.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (137, 12, CAST(N'2019-05-16T00:00:00.000' AS DateTime), 0, NULL, CAST(660.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (138, 13, CAST(N'2019-05-16T00:00:00.000' AS DateTime), 1, NULL, CAST(328.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (139, 14, CAST(N'1995-05-17T00:00:00.000' AS DateTime), 1, NULL, CAST(458.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (140, 15, CAST(N'2019-05-17T00:00:00.000' AS DateTime), 1, NULL, CAST(1060.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (141, 16, CAST(N'2019-05-17T00:00:00.000' AS DateTime), 1, NULL, CAST(927.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (142, 18, CAST(N'2019-05-17T00:00:00.000' AS DateTime), 1, NULL, CAST(368.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (143, 19, CAST(N'2019-05-17T00:00:00.000' AS DateTime), 1, NULL, CAST(702.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (144, 21, CAST(N'2019-05-18T00:00:00.000' AS DateTime), 0, NULL, CAST(486.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (145, 22, CAST(N'2019-05-18T00:00:00.000' AS DateTime), 0, NULL, CAST(558.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (146, 24, CAST(N'2019-05-19T00:00:00.000' AS DateTime), 0, NULL, CAST(206.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (147, 25, CAST(N'2019-05-19T00:00:00.000' AS DateTime), 0, NULL, CAST(388.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (148, 26, CAST(N'2019-05-20T00:00:00.000' AS DateTime), 1, NULL, CAST(795.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (149, 27, CAST(N'2019-05-20T00:00:00.000' AS DateTime), 1, NULL, CAST(600.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (150, 28, CAST(N'2019-05-20T00:00:00.000' AS DateTime), 1, NULL, CAST(177.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (151, 29, CAST(N'2019-05-21T00:00:00.000' AS DateTime), 1, NULL, CAST(393.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (152, 30, CAST(N'2019-05-21T00:00:00.000' AS DateTime), 1, NULL, CAST(863.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (153, 5, CAST(N'2019-05-24T00:00:00.000' AS DateTime), 1, NULL, CAST(334.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (154, 6, CAST(N'2019-05-24T00:00:00.000' AS DateTime), 0, NULL, CAST(997.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (155, 8, CAST(N'2019-05-24T00:00:00.000' AS DateTime), 0, NULL, CAST(301.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (156, 9, CAST(N'2019-05-25T00:00:00.000' AS DateTime), 0, NULL, CAST(450.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (157, 10, CAST(N'2019-05-25T00:00:00.000' AS DateTime), 0, NULL, CAST(829.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (158, 12, CAST(N'2019-05-25T00:00:00.000' AS DateTime), 1, NULL, CAST(544.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (159, 14, CAST(N'2019-05-26T00:00:00.000' AS DateTime), 1, NULL, CAST(456.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (160, 15, CAST(N'2019-05-26T00:00:00.000' AS DateTime), 1, NULL, CAST(927.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (161, 17, CAST(N'2019-05-26T00:00:00.000' AS DateTime), 1, NULL, CAST(2094.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (162, 8, CAST(N'2019-05-27T00:00:00.000' AS DateTime), 1, NULL, CAST(2628.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (163, 9, CAST(N'2019-05-27T00:00:00.000' AS DateTime), 1, NULL, CAST(3900.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (164, 10, CAST(N'2019-05-27T00:00:00.000' AS DateTime), 0, NULL, CAST(606.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (165, 19, CAST(N'2019-05-28T00:00:00.000' AS DateTime), 0, NULL, CAST(1236.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (166, 18, CAST(N'2019-05-30T00:00:00.000' AS DateTime), 0, NULL, CAST(1110.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (167, 17, CAST(N'2019-05-30T00:00:00.000' AS DateTime), 0, NULL, CAST(567.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (168, 18, CAST(N'2019-05-30T00:00:00.000' AS DateTime), 1, NULL, CAST(498.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (169, 19, CAST(N'2019-05-30T00:00:00.000' AS DateTime), 1, NULL, CAST(564.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (170, 11, CAST(N'2019-05-30T00:00:00.000' AS DateTime), 1, NULL, CAST(306.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (171, 1, CAST(N'2019-06-01T00:00:00.000' AS DateTime), 1, NULL, CAST(635.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (172, 2, CAST(N'2019-06-01T00:00:00.000' AS DateTime), 1, NULL, CAST(330.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (173, 2, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 1, NULL, CAST(544.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (174, 3, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 0, NULL, CAST(484.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (175, 4, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 0, NULL, CAST(422.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (176, 5, CAST(N'2019-06-03T00:00:00.000' AS DateTime), 0, NULL, CAST(746.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (177, 6, CAST(N'2019-06-03T00:00:00.000' AS DateTime), 0, NULL, CAST(852.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (178, 7, CAST(N'2019-06-04T00:00:00.000' AS DateTime), 1, NULL, CAST(583.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (179, 8, CAST(N'2019-06-04T00:00:00.000' AS DateTime), 1, NULL, CAST(672.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (180, 9, CAST(N'2019-06-04T00:00:00.000' AS DateTime), 1, NULL, CAST(653.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (181, 8, CAST(N'2019-06-05T00:00:00.000' AS DateTime), 1, NULL, CAST(759.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (182, 6, CAST(N'2019-06-05T00:00:00.000' AS DateTime), 1, NULL, CAST(339.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (183, 4, CAST(N'2019-06-05T00:00:00.000' AS DateTime), 1, NULL, CAST(330.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (184, 2, CAST(N'2019-06-07T00:00:00.000' AS DateTime), 0, NULL, CAST(617.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (185, 1, CAST(N'2019-06-07T00:00:00.000' AS DateTime), 0, NULL, CAST(484.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (186, 11, CAST(N'2019-06-07T00:00:00.000' AS DateTime), 0, NULL, CAST(161.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (187, 12, CAST(N'2019-06-08T00:00:00.000' AS DateTime), 0, NULL, CAST(439.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (188, 14, CAST(N'2019-06-08T00:00:00.000' AS DateTime), 1, NULL, CAST(656.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (189, 2, CAST(N'2019-06-08T00:00:00.000' AS DateTime), 1, NULL, CAST(361.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (190, 3, CAST(N'2019-06-08T00:00:00.000' AS DateTime), 1, NULL, CAST(545.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (191, 4, CAST(N'2019-06-09T00:00:00.000' AS DateTime), 1, NULL, CAST(1158.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (192, 5, CAST(N'2019-06-09T00:00:00.000' AS DateTime), 1, NULL, CAST(524.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (193, 14, CAST(N'2019-06-09T00:00:00.000' AS DateTime), 1, NULL, CAST(389.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (194, 15, CAST(N'2019-06-09T00:00:00.000' AS DateTime), 0, NULL, CAST(239.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (195, 13, CAST(N'2019-06-10T00:00:00.000' AS DateTime), 0, NULL, CAST(246.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (196, 18, CAST(N'2019-06-10T00:00:00.000' AS DateTime), 0, NULL, CAST(290.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (197, 10, CAST(N'2019-06-10T00:00:00.000' AS DateTime), 0, NULL, CAST(603.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (198, 27, CAST(N'2019-06-10T00:00:00.000' AS DateTime), 1, NULL, CAST(643.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (199, 28, CAST(N'2019-06-11T00:00:00.000' AS DateTime), 1, NULL, CAST(320.70 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (200, 29, CAST(N'2019-06-11T00:00:00.000' AS DateTime), 1, NULL, CAST(309.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (201, 8, CAST(N'2019-06-11T00:00:00.000' AS DateTime), 1, NULL, CAST(349.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (202, 8, CAST(N'2019-06-12T00:00:00.000' AS DateTime), 1, NULL, CAST(138.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (203, 13, CAST(N'2019-06-15T00:00:00.000' AS DateTime), 1, NULL, CAST(365.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (204, 14, CAST(N'2019-06-15T00:00:00.000' AS DateTime), 0, NULL, CAST(595.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (205, 20, CAST(N'2019-06-15T00:00:00.000' AS DateTime), 0, NULL, CAST(20980.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (206, 21, CAST(N'2019-06-17T00:00:00.000' AS DateTime), 0, NULL, CAST(415.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (207, 26, CAST(N'2019-06-20T00:00:00.000' AS DateTime), 0, NULL, CAST(17200.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (208, 27, CAST(N'2019-06-21T00:00:00.000' AS DateTime), 1, NULL, CAST(2000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (209, 23, CAST(N'2019-06-23T00:00:00.000' AS DateTime), 1, NULL, CAST(454.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (210, 25, CAST(N'2019-06-25T00:00:00.000' AS DateTime), 1, NULL, CAST(675.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (211, 3, CAST(N'2019-06-27T00:00:00.000' AS DateTime), 1, NULL, CAST(735.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (212, 4, CAST(N'2019-06-28T00:00:00.000' AS DateTime), 1, NULL, CAST(428.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (213, 1, CAST(N'2019-06-29T00:00:00.000' AS DateTime), 1, NULL, CAST(508.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (214, 2, CAST(N'2019-07-01T00:00:00.000' AS DateTime), 0, NULL, CAST(848.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (215, 3, CAST(N'2019-07-03T00:00:00.000' AS DateTime), 0, NULL, CAST(1020.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (216, 4, CAST(N'2019-07-03T00:00:00.000' AS DateTime), 0, NULL, CAST(720.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (217, 5, CAST(N'2019-07-03T00:00:00.000' AS DateTime), 0, NULL, CAST(725.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (218, 8, CAST(N'2019-07-05T00:00:00.000' AS DateTime), 1, NULL, CAST(721.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (219, 10, CAST(N'2019-07-05T00:00:00.000' AS DateTime), 1, NULL, CAST(634.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (220, 11, CAST(N'2019-07-06T00:00:00.000' AS DateTime), 1, NULL, CAST(210.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (221, 12, CAST(N'2019-07-06T00:00:00.000' AS DateTime), 1, NULL, CAST(789.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (222, 13, CAST(N'2019-07-08T00:00:00.000' AS DateTime), 1, NULL, CAST(492.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (223, 14, CAST(N'2019-07-08T00:00:00.000' AS DateTime), 1, NULL, CAST(549.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (224, 15, CAST(N'2019-07-08T00:00:00.000' AS DateTime), 0, NULL, CAST(375.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (225, 16, CAST(N'2019-07-09T00:00:00.000' AS DateTime), 0, NULL, CAST(610.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (226, 18, CAST(N'2019-07-09T00:00:00.000' AS DateTime), 0, NULL, CAST(826.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (227, 19, CAST(N'2019-07-10T00:00:00.000' AS DateTime), 0, NULL, CAST(361.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (228, 21, CAST(N'2019-07-10T00:00:00.000' AS DateTime), 1, NULL, CAST(1136.70 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (229, 22, CAST(N'2019-07-10T00:00:00.000' AS DateTime), 1, NULL, CAST(1110.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (230, 24, CAST(N'2019-07-11T00:00:00.000' AS DateTime), 1, NULL, CAST(420.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (231, 25, CAST(N'2019-07-11T00:00:00.000' AS DateTime), 1, NULL, CAST(852.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (232, 26, CAST(N'2019-07-11T00:00:00.000' AS DateTime), 1, NULL, CAST(360.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (233, 27, CAST(N'2019-07-12T00:00:00.000' AS DateTime), 1, NULL, CAST(562.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (234, 28, CAST(N'2019-07-12T00:00:00.000' AS DateTime), 0, NULL, CAST(180.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (235, 29, CAST(N'2019-07-12T00:00:00.000' AS DateTime), 0, NULL, CAST(549.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (236, 30, CAST(N'2019-07-13T00:00:00.000' AS DateTime), 0, NULL, CAST(855.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (237, 1, CAST(N'2019-07-13T00:00:00.000' AS DateTime), 0, NULL, CAST(750.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (238, 2, CAST(N'2019-07-13T00:00:00.000' AS DateTime), 1, NULL, CAST(179.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (239, 3, CAST(N'2019-07-15T00:00:00.000' AS DateTime), 1, NULL, CAST(334.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (240, 4, CAST(N'2019-07-15T00:00:00.000' AS DateTime), 1, NULL, CAST(795.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (241, 5, CAST(N'2019-07-15T00:00:00.000' AS DateTime), 1, NULL, CAST(413.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (242, 8, CAST(N'2019-07-15T00:00:00.000' AS DateTime), 1, NULL, CAST(363.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (243, 10, CAST(N'2019-07-16T00:00:00.000' AS DateTime), 1, NULL, CAST(503.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (244, 11, CAST(N'2019-07-16T00:00:00.000' AS DateTime), 0, NULL, CAST(432.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (245, 12, CAST(N'2019-07-16T00:00:00.000' AS DateTime), 0, NULL, CAST(771.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (246, 13, CAST(N'2019-07-16T00:00:00.000' AS DateTime), 0, NULL, CAST(153.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (247, 14, CAST(N'2019-07-17T00:00:00.000' AS DateTime), 0, NULL, CAST(795.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (248, 15, CAST(N'2019-07-17T00:00:00.000' AS DateTime), 1, NULL, CAST(273.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (249, 16, CAST(N'2019-07-17T00:00:00.000' AS DateTime), 1, NULL, CAST(174.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (250, 18, CAST(N'2019-07-18T00:00:00.000' AS DateTime), 1, NULL, CAST(212.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (251, 19, CAST(N'2019-07-18T00:00:00.000' AS DateTime), 1, NULL, CAST(325.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (252, 21, CAST(N'2019-07-18T00:00:00.000' AS DateTime), 1, NULL, CAST(450.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (253, 22, CAST(N'2019-07-18T00:00:00.000' AS DateTime), 1, NULL, CAST(798.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (254, 24, CAST(N'2019-07-19T00:00:00.000' AS DateTime), 0, NULL, CAST(304.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (255, 25, CAST(N'2019-07-19T00:00:00.000' AS DateTime), 0, NULL, CAST(2075.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (256, 26, CAST(N'2019-07-19T00:00:00.000' AS DateTime), 0, NULL, CAST(816.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (257, 27, CAST(N'2019-07-19T00:00:00.000' AS DateTime), 0, NULL, CAST(402.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (258, 28, CAST(N'2019-07-19T00:00:00.000' AS DateTime), 1, NULL, CAST(166.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (259, 29, CAST(N'2019-07-20T00:00:00.000' AS DateTime), 1, NULL, CAST(301.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (260, 30, CAST(N'2019-07-20T00:00:00.000' AS DateTime), 1, NULL, CAST(251.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (261, 3, CAST(N'2019-07-22T00:00:00.000' AS DateTime), 1, NULL, CAST(257.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (262, 6, CAST(N'2019-07-22T00:00:00.000' AS DateTime), 1, NULL, CAST(181.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (263, 9, CAST(N'2019-07-22T00:00:00.000' AS DateTime), 1, NULL, CAST(370.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (264, 12, CAST(N'2019-07-22T00:00:00.000' AS DateTime), 0, NULL, CAST(252.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (265, 15, CAST(N'2019-07-24T00:00:00.000' AS DateTime), 0, NULL, CAST(672.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (266, 18, CAST(N'2019-07-24T00:00:00.000' AS DateTime), 0, NULL, CAST(681.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (267, 23, CAST(N'2019-07-25T00:00:00.000' AS DateTime), 0, NULL, CAST(300.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (268, 24, CAST(N'2019-07-25T00:00:00.000' AS DateTime), 1, NULL, CAST(357.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (269, 27, CAST(N'2019-07-25T00:00:00.000' AS DateTime), 1, NULL, CAST(408.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (270, 30, CAST(N'2019-07-26T00:00:00.000' AS DateTime), 1, NULL, CAST(279.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (271, 3, CAST(N'2019-07-26T00:00:00.000' AS DateTime), 1, NULL, CAST(396.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (272, 6, CAST(N'2019-07-26T00:00:00.000' AS DateTime), 1, NULL, CAST(213.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (273, 11, CAST(N'2019-07-27T00:00:00.000' AS DateTime), 1, NULL, CAST(978.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (274, 14, CAST(N'2019-07-27T00:00:00.000' AS DateTime), 0, NULL, CAST(132.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (275, 17, CAST(N'2019-07-29T00:00:00.000' AS DateTime), 0, NULL, CAST(199.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (276, 20, CAST(N'2019-07-29T00:00:00.000' AS DateTime), 0, NULL, CAST(253.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (277, 24, CAST(N'2019-07-29T00:00:00.000' AS DateTime), 0, NULL, CAST(178.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (278, 27, CAST(N'2019-07-30T00:00:00.000' AS DateTime), 1, NULL, CAST(906.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (279, 29, CAST(N'2019-07-30T00:00:00.000' AS DateTime), 1, NULL, CAST(174.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (280, 29, CAST(N'2019-07-31T00:00:00.000' AS DateTime), 1, NULL, CAST(256.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (281, 22, CAST(N'2019-07-31T00:00:00.000' AS DateTime), 1, NULL, CAST(528.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (282, 1, CAST(N'2019-08-01T00:00:00.000' AS DateTime), 1, NULL, CAST(825.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (283, 2, CAST(N'2019-08-01T00:00:00.000' AS DateTime), 1, NULL, CAST(283.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (284, 5, CAST(N'2019-08-01T00:00:00.000' AS DateTime), 0, NULL, CAST(252.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (285, 6, CAST(N'2019-08-02T00:00:00.000' AS DateTime), 0, NULL, CAST(288.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (286, 10, CAST(N'2019-08-02T00:00:00.000' AS DateTime), 0, NULL, CAST(213.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (287, 11, CAST(N'2019-08-02T00:00:00.000' AS DateTime), 0, NULL, CAST(321.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (288, 17, CAST(N'2019-08-02T00:00:00.000' AS DateTime), 1, NULL, CAST(447.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (289, 18, CAST(N'2019-08-02T00:00:00.000' AS DateTime), 1, NULL, CAST(463.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (290, 23, CAST(N'2019-08-03T00:00:00.000' AS DateTime), 0, NULL, CAST(231.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (291, 24, CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1, NULL, CAST(492.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (292, 29, CAST(N'2019-08-05T00:00:00.000' AS DateTime), 1, NULL, CAST(319.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (293, 30, CAST(N'2019-08-05T00:00:00.000' AS DateTime), 1, NULL, CAST(169.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (294, 27, CAST(N'2019-08-08T00:00:00.000' AS DateTime), 0, NULL, CAST(723.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (295, 1, CAST(N'2019-08-08T00:00:00.000' AS DateTime), 0, NULL, CAST(246.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (296, 6, CAST(N'2019-08-09T00:00:00.000' AS DateTime), 0, NULL, CAST(822.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (297, 7, CAST(N'2019-08-11T00:00:00.000' AS DateTime), 0, NULL, CAST(18284.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (298, 9, CAST(N'2019-08-11T00:00:00.000' AS DateTime), 1, NULL, CAST(1912.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (299, 8, CAST(N'2019-08-14T00:00:00.000' AS DateTime), 1, NULL, CAST(726.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (300, 5, CAST(N'2019-08-15T00:00:00.000' AS DateTime), 1, NULL, CAST(231.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (301, 1, CAST(N'2019-08-15T00:00:00.000' AS DateTime), 1, NULL, CAST(215.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (302, 2, CAST(N'2019-08-17T00:00:00.000' AS DateTime), 1, NULL, CAST(268.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (303, 3, CAST(N'2019-08-18T00:00:00.000' AS DateTime), 1, NULL, CAST(147.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (304, 4, CAST(N'2019-08-19T00:00:00.000' AS DateTime), 0, NULL, CAST(262.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (305, 5, CAST(N'2019-08-20T00:00:00.000' AS DateTime), 0, NULL, CAST(552.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (306, 8, CAST(N'2019-08-20T00:00:00.000' AS DateTime), 0, NULL, CAST(326.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (307, 10, CAST(N'2019-08-21T00:00:00.000' AS DateTime), 0, NULL, CAST(62.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (308, 11, CAST(N'2019-08-22T00:00:00.000' AS DateTime), 1, NULL, CAST(337.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (309, 12, CAST(N'2019-08-23T00:00:00.000' AS DateTime), 1, NULL, CAST(279.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (310, 13, CAST(N'2019-08-24T00:00:00.000' AS DateTime), 1, NULL, CAST(405.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (311, 14, CAST(N'2019-08-26T00:00:00.000' AS DateTime), 1, NULL, CAST(157.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (312, 15, CAST(N'2019-08-28T00:00:00.000' AS DateTime), 1, NULL, CAST(210.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (313, 16, CAST(N'2019-08-30T00:00:00.000' AS DateTime), 1, NULL, CAST(279.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (314, 18, CAST(N'2019-09-02T00:00:00.000' AS DateTime), 0, NULL, CAST(155.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (315, 19, CAST(N'2019-09-04T00:00:00.000' AS DateTime), 0, NULL, CAST(31.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (316, 21, CAST(N'2019-09-06T00:00:00.000' AS DateTime), 0, NULL, CAST(189.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (317, 22, CAST(N'2019-09-07T00:00:00.000' AS DateTime), 0, NULL, CAST(390.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (318, 24, CAST(N'2019-09-07T00:00:00.000' AS DateTime), 1, NULL, CAST(124.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (319, 25, CAST(N'2019-09-09T00:00:00.000' AS DateTime), 1, NULL, CAST(93.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (320, 26, CAST(N'2019-09-11T00:00:00.000' AS DateTime), 1, NULL, CAST(248.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (321, 27, CAST(N'2019-09-11T00:00:00.000' AS DateTime), 1, NULL, CAST(187.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (322, 28, CAST(N'2019-09-14T00:00:00.000' AS DateTime), 1, NULL, CAST(48.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (323, 29, CAST(N'2019-09-14T00:00:00.000' AS DateTime), 1, NULL, CAST(172.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (324, 30, CAST(N'2019-09-17T00:00:00.000' AS DateTime), 0, NULL, CAST(270.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (325, 4, CAST(N'2019-09-20T00:00:00.000' AS DateTime), 0, NULL, CAST(283.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (326, 5, CAST(N'2019-09-21T00:00:00.000' AS DateTime), 0, NULL, CAST(31.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (327, 10, CAST(N'2019-09-22T00:00:00.000' AS DateTime), 0, NULL, CAST(49.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (328, 11, CAST(N'2019-09-25T00:00:00.000' AS DateTime), 1, NULL, CAST(555.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (329, 16, CAST(N'2019-09-30T00:00:00.000' AS DateTime), 1, NULL, CAST(445.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (330, 17, CAST(N'2019-09-30T00:00:00.000' AS DateTime), 1, NULL, CAST(135.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (331, 22, CAST(N'2019-10-01T00:00:00.000' AS DateTime), 1, NULL, CAST(487.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (332, 23, CAST(N'2019-10-01T00:00:00.000' AS DateTime), 1, NULL, CAST(31.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (333, 28, CAST(N'2019-10-03T00:00:00.000' AS DateTime), 1, NULL, CAST(243.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (334, 29, CAST(N'2019-10-03T00:00:00.000' AS DateTime), 0, NULL, CAST(172.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (335, 4, CAST(N'2019-10-04T00:00:00.000' AS DateTime), 0, NULL, CAST(124.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (336, 5, CAST(N'2019-10-05T00:00:00.000' AS DateTime), 0, NULL, CAST(81.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (337, 12, CAST(N'2019-10-08T00:00:00.000' AS DateTime), 0, NULL, CAST(360.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (338, 13, CAST(N'2019-10-12T00:00:00.000' AS DateTime), 1, NULL, CAST(62.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (339, 18, CAST(N'2019-10-12T00:00:00.000' AS DateTime), 1, NULL, CAST(283.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (340, 19, CAST(N'2019-10-13T00:00:00.000' AS DateTime), 1, NULL, CAST(135.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (341, 25, CAST(N'2019-10-15T00:00:00.000' AS DateTime), 1, NULL, CAST(6.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (342, 26, CAST(N'2019-10-15T00:00:00.000' AS DateTime), 1, NULL, CAST(23400.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (343, 30, CAST(N'2019-10-15T00:00:00.000' AS DateTime), 1, NULL, CAST(2100.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (344, 30, CAST(N'2019-10-16T00:00:00.000' AS DateTime), 0, NULL, CAST(247.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (345, 23, CAST(N'2019-10-18T00:00:00.000' AS DateTime), 0, NULL, CAST(1200.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (346, 21, CAST(N'2019-10-21T00:00:00.000' AS DateTime), 0, NULL, CAST(396.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (347, 3, CAST(N'2019-10-22T00:00:00.000' AS DateTime), 1, NULL, CAST(288.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (348, 4, CAST(N'2019-10-22T00:00:00.000' AS DateTime), 1, NULL, CAST(542.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (349, 7, CAST(N'2019-10-24T00:00:00.000' AS DateTime), 1, NULL, CAST(594.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (350, 9, CAST(N'2019-10-26T00:00:00.000' AS DateTime), 1, NULL, CAST(610.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (351, 12, CAST(N'2019-10-27T00:00:00.000' AS DateTime), 1, NULL, CAST(203.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (352, 16, CAST(N'2019-10-29T00:00:00.000' AS DateTime), 1, NULL, CAST(474.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (353, 19, CAST(N'2019-10-29T00:00:00.000' AS DateTime), 0, NULL, CAST(63.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (354, 22, CAST(N'2019-10-29T00:00:00.000' AS DateTime), 0, NULL, CAST(168.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (355, 25, CAST(N'2019-10-29T00:00:00.000' AS DateTime), 0, NULL, CAST(225.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (356, 28, CAST(N'2019-10-29T00:00:00.000' AS DateTime), 0, NULL, CAST(203.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (357, 22, CAST(N'2019-10-30T00:00:00.000' AS DateTime), 1, NULL, CAST(678.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (358, 26, CAST(N'2019-11-01T00:00:00.000' AS DateTime), 1, NULL, CAST(542.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (359, 2, CAST(N'2019-11-01T00:00:00.000' AS DateTime), 1, NULL, CAST(192.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (360, 5, CAST(N'2019-11-04T00:00:00.000' AS DateTime), 1, NULL, CAST(577.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (361, 8, CAST(N'2019-11-05T00:00:00.000' AS DateTime), 1, NULL, CAST(117.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (362, 9, CAST(N'2019-11-05T00:00:00.000' AS DateTime), 1, NULL, CAST(99.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (363, 7, CAST(N'2019-11-06T00:00:00.000' AS DateTime), 0, NULL, CAST(121.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (364, 6, CAST(N'2019-11-08T00:00:00.000' AS DateTime), 0, NULL, CAST(336.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (365, 1, CAST(N'2019-11-09T00:00:00.000' AS DateTime), 0, NULL, CAST(279.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (366, 2, CAST(N'2019-11-09T00:00:00.000' AS DateTime), 0, NULL, CAST(339.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (367, 3, CAST(N'2019-11-10T00:00:00.000' AS DateTime), 1, NULL, CAST(288.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (368, 4, CAST(N'2019-11-14T00:00:00.000' AS DateTime), 1, NULL, CAST(138.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (369, 5, CAST(N'2019-11-14T00:00:00.000' AS DateTime), 1, NULL, CAST(120.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (370, 8, CAST(N'2019-11-17T00:00:00.000' AS DateTime), 1, NULL, CAST(474.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (371, 10, CAST(N'2019-11-19T00:00:00.000' AS DateTime), 1, NULL, CAST(540.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (372, 11, CAST(N'2019-11-22T00:00:00.000' AS DateTime), 1, NULL, CAST(474.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (373, 12, CAST(N'2019-11-25T00:00:00.000' AS DateTime), 0, NULL, CAST(444.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (374, 13, CAST(N'2019-11-28T00:00:00.000' AS DateTime), 0, NULL, CAST(28.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (375, 14, CAST(N'2019-11-28T00:00:00.000' AS DateTime), 0, NULL, CAST(124.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (376, 15, CAST(N'2019-11-28T00:00:00.000' AS DateTime), 0, NULL, CAST(171.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (377, 16, CAST(N'2019-11-30T00:00:00.000' AS DateTime), 1, NULL, CAST(67.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (378, 18, CAST(N'2019-11-30T00:00:00.000' AS DateTime), 1, NULL, CAST(203.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (379, 19, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 1, NULL, CAST(337.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (380, 21, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 1, NULL, CAST(610.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (381, 22, CAST(N'2019-12-04T00:00:00.000' AS DateTime), 1, NULL, CAST(324.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (382, 24, CAST(N'2019-12-07T00:00:00.000' AS DateTime), 1, NULL, CAST(216.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (383, 25, CAST(N'2019-12-07T00:00:00.000' AS DateTime), 0, NULL, CAST(114.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (384, 26, CAST(N'2019-12-08T00:00:00.000' AS DateTime), 0, NULL, CAST(610.20 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (385, 27, CAST(N'2019-12-09T00:00:00.000' AS DateTime), 0, NULL, CAST(225.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (386, 28, CAST(N'2019-12-09T00:00:00.000' AS DateTime), 0, NULL, CAST(41.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (387, 29, CAST(N'2019-12-09T00:00:00.000' AS DateTime), 1, NULL, CAST(7800.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (388, 30, CAST(N'2019-12-09T00:00:00.000' AS DateTime), 1, NULL, CAST(387.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (389, 1, CAST(N'2019-12-10T00:00:00.000' AS DateTime), 1, NULL, CAST(400.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (390, 7, CAST(N'2019-12-11T00:00:00.000' AS DateTime), 1, NULL, CAST(203.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (391, 8, CAST(N'2019-12-11T00:00:00.000' AS DateTime), 1, NULL, CAST(132.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (392, 13, CAST(N'2019-12-12T00:00:00.000' AS DateTime), 1, NULL, CAST(216.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (393, 14, CAST(N'2019-12-12T00:00:00.000' AS DateTime), 0, NULL, CAST(696.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (394, 19, CAST(N'2019-12-12T00:00:00.000' AS DateTime), 0, NULL, CAST(148.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (395, 20, CAST(N'2019-12-12T00:00:00.000' AS DateTime), 0, NULL, CAST(49.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (396, 25, CAST(N'2019-12-14T00:00:00.000' AS DateTime), 0, NULL, CAST(696.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (397, 26, CAST(N'2019-12-14T00:00:00.000' AS DateTime), 1, NULL, CAST(234.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (398, 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), 1, NULL, CAST(495.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (399, 2, CAST(N'2019-12-16T00:00:00.000' AS DateTime), 1, NULL, CAST(64.20 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (400, 7, CAST(N'2019-12-18T00:00:00.000' AS DateTime), 1, NULL, CAST(415.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (401, 8, CAST(N'2019-12-19T00:00:00.000' AS DateTime), 1, NULL, CAST(157.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (402, 15, CAST(N'2019-12-20T00:00:00.000' AS DateTime), 1, NULL, CAST(696.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (403, 15, CAST(N'2019-12-21T00:00:00.000' AS DateTime), 0, NULL, CAST(86.40 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (404, 21, CAST(N'2019-12-21T00:00:00.000' AS DateTime), 0, NULL, CAST(162.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (405, 22, CAST(N'2019-12-22T00:00:00.000' AS DateTime), 0, NULL, CAST(150.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (406, 28, CAST(N'2019-12-23T00:00:00.000' AS DateTime), 0, NULL, CAST(474.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (411, 23, CAST(N'2021-11-03T00:00:00.000' AS DateTime), 0, NULL, CAST(348.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (412, 24, CAST(N'2021-11-03T00:00:00.000' AS DateTime), 0, NULL, CAST(279.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (413, 3, CAST(N'2021-11-03T00:00:00.000' AS DateTime), 0, NULL, CAST(69.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (414, 10, CAST(N'2021-11-03T00:00:00.000' AS DateTime), 0, NULL, CAST(556.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (415, 15, CAST(N'2021-11-03T00:00:00.000' AS DateTime), 0, NULL, CAST(554.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (416, 2, CAST(N'2021-11-03T00:00:00.000' AS DateTime), 0, NULL, CAST(696.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (417, 9, CAST(N'2021-11-03T00:00:00.000' AS DateTime), 0, NULL, CAST(510.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (435, NULL, CAST(N'2024-05-30T00:00:00.000' AS DateTime), 0, NULL, CAST(66.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (436, NULL, CAST(N'2024-05-30T00:00:00.000' AS DateTime), 0, NULL, CAST(303.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (437, 26, CAST(N'2024-05-30T00:00:00.000' AS DateTime), 0, NULL, CAST(276.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (438, NULL, CAST(N'2024-06-06T00:00:00.000' AS DateTime), 0, NULL, CAST(66.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (439, 4, CAST(N'2024-06-06T00:00:00.000' AS DateTime), 0, NULL, CAST(2054.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (440, NULL, CAST(N'2024-06-06T00:00:00.000' AS DateTime), 0, NULL, CAST(101.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (445, NULL, CAST(N'2024-06-06T00:00:00.000' AS DateTime), 0, NULL, CAST(55.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (446, 3, CAST(N'2024-06-06T00:00:00.000' AS DateTime), 0, NULL, CAST(128.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (447, NULL, CAST(N'2024-06-06T00:00:00.000' AS DateTime), 0, NULL, CAST(41.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Ventas] ([VentaId], [ClienteId], [FechaVenta], [Regalo], [Envio], [Total], [Estado]) VALUES (448, 15, CAST(N'2024-06-06T00:00:00.000' AS DateTime), 0, NULL, CAST(107.50 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Bombones_NombreBombon]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Bombones_NombreBombon] ON [dbo].[Bombones]
(
	[NombreBombon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Clientes_Documento]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Clientes_Documento] ON [dbo].[Clientes]
(
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientesDirecciones_ClienteId_DireccionId]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClientesDirecciones_ClienteId_DireccionId] ON [dbo].[ClientesDirecciones]
(
	[ClienteId] ASC,
	[DireccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientesTelefonos_ClienteId_TelefonoId]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClientesTelefonos_ClienteId_TelefonoId] ON [dbo].[ClientesTelefonos]
(
	[ClienteId] ASC,
	[TelefonoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CompaniasEnvios]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CompaniasEnvios] ON [dbo].[CompaniasEnvios]
(
	[NombreCompania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Direcciones_Complete]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Direcciones_Complete] ON [dbo].[Direcciones]
(
	[Calle] ASC,
	[Altura] ASC,
	[Entre1] ASC,
	[Entre2] ASC,
	[PaisId] ASC,
	[ProvinciaEstadoId] ASC,
	[CiudadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Fabricas]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Fabricas] ON [dbo].[Fabricas]
(
	[NombreFabrica] ASC,
	[PaisId] ASC,
	[ProvinciaEstadoId] ASC,
	[CiudadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NombrePais]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_NombrePais] ON [dbo].[Paises]
(
	[NombrePais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Permisos_NombrePermiso]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Permisos_NombrePermiso] ON [dbo].[Permisos]
(
	[NombrePermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProvinciasEstados_NombreProvinciaEstado_PaisId]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProvinciasEstados_NombreProvinciaEstado_PaisId] ON [dbo].[ProvinciasEstados]
(
	[NombreProvinciaEstado] ASC,
	[PaisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Roles_NombreRol]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles_NombreRol] ON [dbo].[Roles]
(
	[NombreRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Telefonos_Numero]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Telefonos_Numero] ON [dbo].[Telefonos]
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TiposDeRellenos]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TiposDeRellenos] ON [dbo].[TiposDeRellenos]
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TipoDirecciones_Descripcion]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TipoDirecciones_Descripcion] ON [dbo].[TiposDirecciones]
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Telefonos]    Script Date: 20/08/2024 16:08:34 ******/
CREATE NONCLUSTERED INDEX [IX_Telefonos] ON [dbo].[TiposTelefonos]
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Usuarios_NombreUsuario]    Script Date: 20/08/2024 16:08:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Usuarios_NombreUsuario] ON [dbo].[Usuarios]
(
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bombones]  WITH CHECK ADD  CONSTRAINT [FK_Bombones_Fabricas] FOREIGN KEY([FabricaId])
REFERENCES [dbo].[Fabricas] ([FabricaId])
GO
ALTER TABLE [dbo].[Bombones] CHECK CONSTRAINT [FK_Bombones_Fabricas]
GO
ALTER TABLE [dbo].[Bombones]  WITH CHECK ADD  CONSTRAINT [FK_Bombones_TiposDeChocolates] FOREIGN KEY([TipoDeChocolateId])
REFERENCES [dbo].[TiposDeChocolates] ([TipoDeChocolateId])
GO
ALTER TABLE [dbo].[Bombones] CHECK CONSTRAINT [FK_Bombones_TiposDeChocolates]
GO
ALTER TABLE [dbo].[Bombones]  WITH CHECK ADD  CONSTRAINT [FK_Bombones_TiposDeNueces] FOREIGN KEY([TipoDeNuezId])
REFERENCES [dbo].[TiposDeNueces] ([TipoDeNuezId])
GO
ALTER TABLE [dbo].[Bombones] CHECK CONSTRAINT [FK_Bombones_TiposDeNueces]
GO
ALTER TABLE [dbo].[Bombones]  WITH CHECK ADD  CONSTRAINT [FK_Bombones_TiposDeRellenos] FOREIGN KEY([TipoDeRellenoId])
REFERENCES [dbo].[TiposDeRellenos] ([TipoDeRellenoId])
GO
ALTER TABLE [dbo].[Bombones] CHECK CONSTRAINT [FK_Bombones_TiposDeRellenos]
GO
ALTER TABLE [dbo].[ClientesDirecciones]  WITH CHECK ADD  CONSTRAINT [FK_ClientesDirecciones_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
ALTER TABLE [dbo].[ClientesDirecciones] CHECK CONSTRAINT [FK_ClientesDirecciones_Clientes]
GO
ALTER TABLE [dbo].[ClientesDirecciones]  WITH CHECK ADD  CONSTRAINT [FK_ClientesDirecciones_Direcciones] FOREIGN KEY([DireccionId])
REFERENCES [dbo].[Direcciones] ([DireccionId])
GO
ALTER TABLE [dbo].[ClientesDirecciones] CHECK CONSTRAINT [FK_ClientesDirecciones_Direcciones]
GO
ALTER TABLE [dbo].[ClientesDirecciones]  WITH CHECK ADD  CONSTRAINT [FK_ClientesDirecciones_TipoDirecciones] FOREIGN KEY([TipoDireccionId])
REFERENCES [dbo].[TiposDirecciones] ([TipoDireccionId])
GO
ALTER TABLE [dbo].[ClientesDirecciones] CHECK CONSTRAINT [FK_ClientesDirecciones_TipoDirecciones]
GO
ALTER TABLE [dbo].[ClientesTelefonos]  WITH CHECK ADD  CONSTRAINT [FK_ClientesTelefonos_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
ALTER TABLE [dbo].[ClientesTelefonos] CHECK CONSTRAINT [FK_ClientesTelefonos_Clientes]
GO
ALTER TABLE [dbo].[ClientesTelefonos]  WITH CHECK ADD  CONSTRAINT [FK_ClientesTelefonos_Telefonos] FOREIGN KEY([TelefonoId])
REFERENCES [dbo].[Telefonos] ([TelefonoId])
GO
ALTER TABLE [dbo].[ClientesTelefonos] CHECK CONSTRAINT [FK_ClientesTelefonos_Telefonos]
GO
ALTER TABLE [dbo].[DetallesCajas]  WITH CHECK ADD  CONSTRAINT [FK_DetallesCajas_Bombones] FOREIGN KEY([BombonId])
REFERENCES [dbo].[Bombones] ([BombonId])
GO
ALTER TABLE [dbo].[DetallesCajas] CHECK CONSTRAINT [FK_DetallesCajas_Bombones]
GO
ALTER TABLE [dbo].[DetallesCajas]  WITH CHECK ADD  CONSTRAINT [FK_DetallesCajas_Cajas] FOREIGN KEY([CajaId])
REFERENCES [dbo].[Cajas] ([CajaId])
GO
ALTER TABLE [dbo].[DetallesCajas] CHECK CONSTRAINT [FK_DetallesCajas_Cajas]
GO
ALTER TABLE [dbo].[Direcciones]  WITH CHECK ADD  CONSTRAINT [FK_Direcciones_Ciudades] FOREIGN KEY([CiudadId])
REFERENCES [dbo].[Ciudades] ([CiudadId])
GO
ALTER TABLE [dbo].[Direcciones] CHECK CONSTRAINT [FK_Direcciones_Ciudades]
GO
ALTER TABLE [dbo].[Direcciones]  WITH CHECK ADD  CONSTRAINT [FK_Direcciones_Paises] FOREIGN KEY([PaisId])
REFERENCES [dbo].[Paises] ([PaisId])
GO
ALTER TABLE [dbo].[Direcciones] CHECK CONSTRAINT [FK_Direcciones_Paises]
GO
ALTER TABLE [dbo].[Direcciones]  WITH CHECK ADD  CONSTRAINT [FK_Direcciones_ProvinciasEstados] FOREIGN KEY([ProvinciaEstadoId])
REFERENCES [dbo].[ProvinciasEstados] ([ProvinciaEstadoId])
GO
ALTER TABLE [dbo].[Direcciones] CHECK CONSTRAINT [FK_Direcciones_ProvinciasEstados]
GO
ALTER TABLE [dbo].[Fabricas]  WITH CHECK ADD  CONSTRAINT [FK_Fabricas_Ciudades] FOREIGN KEY([CiudadId])
REFERENCES [dbo].[Ciudades] ([CiudadId])
GO
ALTER TABLE [dbo].[Fabricas] CHECK CONSTRAINT [FK_Fabricas_Ciudades]
GO
ALTER TABLE [dbo].[Fabricas]  WITH CHECK ADD  CONSTRAINT [FK_Fabricas_Paises] FOREIGN KEY([PaisId])
REFERENCES [dbo].[Paises] ([PaisId])
GO
ALTER TABLE [dbo].[Fabricas] CHECK CONSTRAINT [FK_Fabricas_Paises]
GO
ALTER TABLE [dbo].[Fabricas]  WITH CHECK ADD  CONSTRAINT [FK_Fabricas_ProvinciasEstados] FOREIGN KEY([ProvinciaEstadoId])
REFERENCES [dbo].[ProvinciasEstados] ([ProvinciaEstadoId])
GO
ALTER TABLE [dbo].[Fabricas] CHECK CONSTRAINT [FK_Fabricas_ProvinciasEstados]
GO
USE [master]
GO
ALTER DATABASE [Bombones2024] SET  READ_WRITE 
GO
