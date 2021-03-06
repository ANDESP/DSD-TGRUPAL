USE MASTER
GO

CREATE DATABASE [DBProduccion]
GO

USE [DBProduccion]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 10/07/2016 12:56:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articulo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[TipoExistencia] [char](1) NULL,
	[Activo] [bit] NULL,
	[StockActual] [decimal](12, 2) NULL,
	[IdFormulaProduccion] [int] NULL,
 CONSTRAINT [XPKArticulo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArticuloFormulaProduccion]    Script Date: 10/07/2016 12:56:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticuloFormulaProduccion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [decimal](12, 2) NULL,
	[IdArticulo] [int] NULL,
	[IdFormulaProduccion] [int] NULL,
 CONSTRAINT [XPKArticuloFormulaProduccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movimiento]    Script Date: 10/07/2016 12:56:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movimiento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[FechaRegistro] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
	[TipoMovimiento] [char](1) NULL,
	[IdAlmacen] [int] NULL,
	[IdOrdenTrabajo] [int] NULL,
 CONSTRAINT [XPKMovimiento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MovimientoDetalle]    Script Date: 10/07/2016 12:56:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoDetalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [decimal](12, 2) NULL,
	[IdMovimiento] [int] NULL,
	[IdArticulo] [int] NULL,
 CONSTRAINT [XPKMovimientoDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrdenTrabajo]    Script Date: 10/07/2016 12:56:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenTrabajo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[FechaRegistro] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
	[Activo] [bit] NULL,
	[IdEstado] [int] NULL,
 CONSTRAINT [XPKOrdenTrabajo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrdenTrabajoDetalle]    Script Date: 10/07/2016 12:56:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenTrabajoDetalle](
	[IdOrdenTrabajo] [int] NOT NULL,
	[Cantidad] [decimal](12, 2) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdArticulo] [int] NULL,
 CONSTRAINT [XPKOrdenTrabajoDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parametro]    Script Date: 10/07/2016 12:56:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parametro](
	[Id] [int] NOT NULL,
	[Descripcion] [varchar](30) NULL,
 CONSTRAINT [XPKParametro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ParametroDetalle]    Script Date: 10/07/2016 12:56:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParametroDetalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](30) NULL,
	[IdPadre] [int] NULL,
 CONSTRAINT [XPKParametroDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Articulo] ON 

GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (1, N'SOFA 3CPO ANGIE               ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 7)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (2, N'SOFA 2CPO ANGIE               ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 8)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (3, N'SOFA 1CPO ANGIE               ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 9)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (4, N'SILLON RECLINABLE SANTOS      ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 10)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (5, N'SILLON RECLINABLE NORMAL(Y)   ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 11)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (6, N'SOFA 3CPO ESPAÑOL (Y)         ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 12)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (7, N'SOFA 2CPO ESPAÑOL (Y)         ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 13)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (8, N'SOFA 1CPO ESPAÑOL (Y)         ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 14)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (9, N'SOFA 3CPO ATENAS AMERICANO    ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 15)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (10, N'SOFA 2CPO ATENAS AMERICANO    ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 16)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (11, N'SOFA 1CPO ATENAS AMERICANO    ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 17)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (12, N'SOFA 3CPO MONICA (Y)          ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 18)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (13, N'SOFA 2CPO MONICA (Y)          ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 19)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (14, N'SOFA 1CPO MONICA (Y)          ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 20)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (15, N'SOFA 3CPO ISABEL              ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 21)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (16, N'SOFA 2CPO ISABEL              ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 22)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (17, N'SOFA 1CPO ISABEL              ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 23)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (18, N'SOFA 3CPO LUCY                ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 24)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (19, N'SOFA 2CPO LUCY                ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 25)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (20, N'SOFA 1CPO LUCY                ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 26)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (21, N'SOFA 3CPO SALOME              ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 27)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (22, N'SOFA 2CPO SALOME              ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 28)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (23, N'SOFA 1CPO SALOME              ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 29)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (24, N'SOFA 3CPO RISOLI(Y)           ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 30)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (25, N'SOFA 2CPO RISOLI(Y)           ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 31)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (26, N'SOFA 1CPO RISOLI(Y)           ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 32)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (27, N'SOFA 3CPO SHEIKA              ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 33)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (28, N'SOFA 2CPO SHEIKA              ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 34)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (29, N'SOFA 1CPO SHEIKA              ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 35)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (30, N'SOFA 3CPO FILADELFIA          ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 36)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (31, N'SOFA 2CPO FILADELFIA          ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 37)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (32, N'SOFA 1CPO FILADELFIA          ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 38)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (33, N'SOFA 3CPO KASSANDRA           ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 39)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (34, N'SOFA 2CPO KASSANDRA           ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 40)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (35, N'SOFA 1CPO KASSANDRA           ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 41)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (36, N'CAS SOFA 3CPO ELEGANTA        ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 42)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (37, N'CAS SOFA 2CPO ELEGANTA        ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 43)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (38, N'CAS SOFA 1CPO ELEGANTA        ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 44)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (39, N'CAS SECC 3CPO ELEGANTA        ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 45)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (40, N'CAS SECC 2CPO ELEGANTA        ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 46)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (41, N'CAS ESQUINERO ELEGANTA        ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 47)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (42, N'CAS SOFA 3CPO MONICA (Y)      ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 48)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (43, N'CAS SOFA 2CPO MONICA (Y)      ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 49)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (44, N'CAS SOFA 1CPO MONICA (Y)      ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 50)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (45, N'CAS SECC 3CPO MONICA          ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 51)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (46, N'CAS SECC 2CPO MONICA          ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 52)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (47, N'CAS ESQUINERO MONICA          ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 53)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (48, N'CAS SOFA 3CPO RISOLI          ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 54)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (49, N'CAS SOFA 2CPO RISOLI          ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 55)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (50, N'CAS SOFA 1CPO RISOLI          ', N'T', 1, CAST(0.00 AS Decimal(12, 2)), 56)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (51, N'JEBE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (52, N'MANGA CRISTAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (53, N'LIJA TELA ESMERIL 60', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (54, N'LIJA TELA ESMERIL 80', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (55, N'LIJA TELA ESMERIL 100', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (56, N'LIJA AL AGUA GR 120', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (57, N'LIJA AL AGUA GR 150', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (58, N'LIJA AL AGUA GR.180', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (59, N'LIJA AL AGUA GR.240', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (60, N'GRAPAS B-16', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (61, N'GRAPAS 13MM 80/10', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (62, N'THINER ACRILICO X 55 GL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (63, N'AGUARRAS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (64, N'ESTOPEROL 15-3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (65, N'GRECA MARRON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (66, N'CEMENTO IMPERIAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (67, N'DULL SEALER', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (68, N'DISOLVENTE DULL SEALER', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (69, N'DD/B5', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (70, N'PITA DE YUTE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (71, N'TOMACORRIENTE AEREO TRIPLY', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (72, N'TIRADOR TORNEADA DE BRONCE QUEMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (73, N'MANGA CRISTAL 64"X1', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (74, N'DICROICO GRANDE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (75, N'DICROICO 1/4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (76, N'INTERRUPTOR AEREO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (77, N'LIJA BANDA 120 PARA VIDRIO ( 2 3/4" X 32 3/4")', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (78, N'CHUPON MEDIANO 30 MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (79, N'SOPORTE TRANSPARENTE STANDARD', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (80, N'ESMERIL EN POLVO AZUL 60', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (81, N'SILICONA P/ VIDRIO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (82, N'3300100037-dd                                     ', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (83, N'LACA A LA PIROXILINA BLANCO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (84, N'LACA A LA PIROXILINA AMARILLO THONNER', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (85, N'LACA A LA PIROXILINA AMARILLO OCRE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (86, N'LACA A LA PIROXILINA NEGRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (87, N'LACA A LA PIROXILINA GUINDA THONNER', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (88, N'LACA A LA PIROXILINA ROJO BERMELLON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (89, N'LACA A LA PIROXILINA GOLD THONNER', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (90, N'POLYESTER PARAFINICO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (91, N'GRAPAS 80/12 TAPICERIA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (92, N'CINTA MASKING 1X55', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (93, N'CINTA MASKING 3/4X55', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (94, N'CORREDERA METALICA 12', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (95, N'CORREDERA METALICA 14', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (96, N'CORREDERA METALICA 18', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (97, N'CORREDERA METALICA 16', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (98, N'BISAGRA INTERIOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (99, N'BISAGRA DE PUNTO 5.5CM.', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (100, N'CRISTAL INCOLORO 15MM 2.14X100', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (101, N'PRESERVANTE PARA MADERA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (102, N'SODA CAUSTICA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (103, N'NOGALINA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (104, N'BROCA DIAMANTADA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (105, N'CABLE MELLIZO  2 X 18', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (106, N'SOGUILLA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (107, N'ENCHUFE PLANO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (108, N'FOCO DICROICO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (109, N'PITA RAFIA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (110, N'GRAPAS INDUSTRIALES 23/45 TAPICERIA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (111, N'FAJA A-53', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (112, N'LACA CRISTAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (113, N'SACOS POLIPROPILENO ROLLOS TELA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (114, N'CARPINFLEX (TEKNO  COLA)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (115, N'GRAPAS SENCO 3/8', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (116, N'BASE A LA PIROXILINA BLANCA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (117, N'CRISTAL GRIS HUMO 10MM 2200X3600', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (118, N'CRISTAL GRIS HUMO 10MM 2500X3600', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (119, N'GRAPAS INDUSTRIALES 15 3/4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (120, N'TEKNODUR BRILLANTE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (121, N'ESPEJO MIREX 3MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (122, N'CIERRE 5 NAYLON  X 200MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (123, N'CINTA ENGOMADA 1" (NO USAR)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (124, N'3300100080                                        ', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (125, N'PEGOL TAPICERO X 55 GLNS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (126, N'CRISTAL INCOLORO 6MM 1830. X 2440', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (127, N'ESMALTE SINTETICO NEGRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (128, N'TIRAFON 1/4 X 1"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (129, N'ARANDELA 1/4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (130, N'TORNILLO SPACK 3.5 X 20 3/4"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (131, N'TORNILLO SPACK 3.5 X 40 1 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (132, N'ARANDELA 5/16', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (133, N'TORNILLO SPACK 3.5 X 50  2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (134, N'TORNILLO SPACK 3.5 X 25 1"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (135, N'LIJA PAPEL 60', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (136, N'(NO USAR) LIJA PAPEL 40', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (137, N'BISAGRA CAPUCHINA 2 1/2 X 1 1/2 NO USAR POR FAVOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (138, N'MASILLA PLASTICA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (139, N'GRAPAS NEUMATICAS 8910 10MM TAPICERIA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (140, N'GRAPAS 21/80', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (141, N'TALCO AMERICANO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (142, N'CIERRE DE VARIOS COLORES (MTS)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (143, N'CINTA AISLANTE 3M', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (144, N'ANILINA ROJO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (145, N'OCRE IMPORTADO ROJO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (146, N'LIJA BANDA 60 (6 X 2.85 CMT)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (147, N'SILICONA P/ESPEJO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (148, N'OLEO MATE NEGRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (149, N'TACHUELA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (150, N'OCRE IMPORTADO AMARILLO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (151, N'PEGAMENTO AFRICANO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (152, N'LACA PIROXILINA BASE GRIS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (153, N'DISOLVENTE DD', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (154, N'OLEO MATE AMARILLO MEDIO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (155, N'OCRE IMPORTADO NEGRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (156, N'PULIDOR FINO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (157, N'PULIDOR GRUESO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (158, N'FOCO DICROICO 220V', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (159, N'LACQUER', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (160, N'BISAGRA B-6N NEGRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (161, N'PERNO 2 1/2 X 1/4 + TUERCA 1/4 - CAMAS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (162, N'CLAVO 2" C/C', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (163, N'PERNO 2 1/2 X 5/16 + TUERCA 5/16 TALLADOS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (164, N'TIRAFON 1/4 X 3"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (165, N'TIRAFON 1/4 X 2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (166, N'TACHUELA 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (167, N'VENCECOLA PROFESIONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (168, N'CLAVO 2 1/2  C/C', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (169, N'LIJA PAPEL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (170, N'OLEO MATE AMARILLO OCRE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (171, N'CLAVO 1 C/C', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (172, N'ANILINA VERDE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (173, N'PERNO 1 1/2X 5/16 C/C', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (174, N'PERNO 2 X 1/4 C/C', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (175, N'PERNO 2X 1/2 C/C', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (176, N'ANILINA AL AGUA AMARILLO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (177, N'BISAGRA CAPUCHINA 2 X 1 1/4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (178, N'ZIG ZAG  MARRON (sapito)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (179, N'PERNO 5/16 X 2 1/2 HEXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (180, N'COLA FULLER X 20 KL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (181, N'TIRADOR LAGRIMA DE COCODRILO T-72', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (182, N'BLANQUEADOR PARA MADERA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (183, N'TORNILLO 12 X 3/4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (184, N'CLAVO 1" S/C', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (185, N'LAMINA ENCHAPE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (186, N'PERNO 1/4 X 2 1/2 HEXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (187, N'LIJA BANDA 80 (6 X 2.85 CMT)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (188, N'BISAGRA LATERAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (189, N'BISAGRA EXTERIOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (190, N'ESMALTE SINTETICO ROJO BERMELLON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (191, N'ESMALTE SINTETICO AMARILLO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (192, N'PERNO 1/4 X 2"  HEXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (193, N'PERNO 3/8 X 2 1/2 HEXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (194, N'PERNO 5/16 X 1 1/2 HEXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (195, N'GRECA NEGRA X 20 MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (196, N'GRECA BLANCA X 20 MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (197, N'GRECA GUINDA X 20 MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (198, N'BROCA PUXADORES E DOBRADICAS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (199, N'BROCA RABO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (200, N'FRESA HM SERRILHADA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (201, N'BROCAS PASSANTEZ', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (202, N'BROCA ÑAO PASSANTES', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (203, N'ESCAREADOR LONGO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (204, N'BROCAS EN ACO RAPIDO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (205, N'BROCAS P/ PUXADORES DOBRADICAS 871-030MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (206, N'ESCAREADOR CON DEGRAU', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (207, N'CABECOTAS PORTA FACAS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (208, N'MANGA CRISTAL 80 X 1', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (209, N'LACA A LA PIROXILINA ROJO OXIDO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (210, N'HILO BLANCO 9', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (211, N'CHUPON CHICO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (212, N'LAPIZ PARA VIDRIO MARKING', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (213, N'TIRADOR INDO MEDIANO QUEMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (214, N'TIRADOR BRONCE  EXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (215, N'TIRADOR CON ANILLO QUEMADO 9.5CM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (216, N'CRISTAL INCOLORO 2MM 1700X2200', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (217, N'LACA A LA PIROXILINA  AMARILLO LIMON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (218, N'CHINCHETA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (219, N'HUACHAS 1/4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (220, N'TUERCA 1/4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (221, N'POLVO APRESTO CMC TEXTIL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (222, N'MANGA CRISTAL 50 X 1.8 DISUEÑOS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (223, N'GRAPAS 14/50 TAPICERIA 3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (224, N'BASE ZINCROMATO INDUSTRIAL VERDE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (225, N'ESMALTE SINTETICO BLANCO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (226, N'ESMALTE SINTETICO ALUMINIO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (227, N'ESMALTE SINTETICO GRIS OSCURO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (228, N'ESMALTE AMARILLO LIMON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (229, N'ESMALTE SINTETICO AMARILLO MEDIO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (230, N'SACOS DE  ROLLO DE TELA TEJIDA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (231, N'(NO USAR) SOPORTE TRANSPARENTE - UÑAS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (232, N'LIJA AL AGUA GR 600', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (233, N'BISAGRA CANGREJO P/VIDRIO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (234, N'CINTA ENGOMADA ENCHAPE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (235, N'CRISTAL INCOLORO 4MM 1.80X2.5', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (236, N'CRISTAL INCOLORO 10MM 1.45X1.45', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (237, N'CRISTAL GRIS HUMO 10MM 2.500X3.600', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (238, N'PERILLA TALLADA MEDIANA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (239, N'PERILLA COPITA PLATEADA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (240, N'PERILLA EXAGONAL BRONCE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (241, N'TIRADOR TALLADO TIPO ARGOLLA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (242, N'TIRADOR 1/2 LUNA DORADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (243, N'ESTOBOL 5/32 X 1"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (244, N'TORNILLO SPACK 4 X 20 3/4"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (245, N'TORNILLO SPACK 4 X 40', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (246, N'TORNILLO SPACK 4 X 50', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (247, N'TORNILLO SPACK 6 X 100', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (248, N'ESTOBOL 5/32 X 1 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (249, N'PERNO DE 1/4 X 2 1/2 HILO CORRIDO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (250, N'PERNO DE 5/16 X 2 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (251, N'TUERCA DE 5/16 HEXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (252, N'ARANDELA DE 3/8', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (253, N'TIRAFON 1/4 X 2 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (254, N'TIRAFON 1/4 X 1 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (255, N'TIRAFON 5/16 X 2 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (256, N'TIRAFON 5/16 X 2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (257, N'FAJA PULIDORA 150-180 VIDRIERIA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (258, N'ARTEMELL  COLA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (259, N'CRISTAL INCOLORO 8MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (260, N'CRISTAL BRONCE 10mm  2140X3210', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (261, N'TARUGOS DE MADERA ESTRIADA 8X30MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (262, N'MANGA CRISTAL 45º X 3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (263, N'MANGA CRISTAL 60 X 1', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (264, N'SOGUILLA *', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (265, N'HILOS  BLANCO DE 9', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (266, N'HILOS NEGRO 9..', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (267, N'COJIN DE CHINCHETAS 15- 3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (268, N'NOVO CUERO HUESO 68', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (269, N'GALON PEGAMENTO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (270, N'CLAVILLO F-20', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (271, N'CLAVILLO F25', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (272, N'CLAVILLO F35', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (273, N'TORNILLO GOTA DE SEBO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (274, N'HILO NEGRO 30', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (275, N'HILO BLANCO 20/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (276, N'HILO N" 30 COLCHONES', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (277, N'MANGA CRISTAL DISUEÑO X 1.5', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (278, N'OLEO MATE VERDE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (279, N'LIJA BANDA 220', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (280, N'TEROPER COLA SINTETICA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (281, N'CLAVO 3" CON CABEZA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (282, N'CLAVO 1 1/2 CON CABEZA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (283, N'CLAVO 2 SIN CABEZA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (284, N'CLAVO 2 1/2 SIN CABEZA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (285, N'CLAVO 3 SIN CABEZA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (286, N'CORREDERA METALICA 22', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (287, N'LACA SELLADORA DUCOLAC', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (288, N'LIJA BANDA 40  (6 X 2.85 CMT)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (289, N'TELA TEGIDA 1.30 X 2.00 BLANCO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (290, N'ROLLO TILO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (291, N'CINTA MASKING SUPER P/ USO  1X 55 (NO USAR )', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (292, N'CINTA MASKING SUPER P/ USO 3/4 X 55 (NO USAR)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (293, N'POLISEDA BTE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (294, N'BARNIZ D/D A5', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (295, N'ROLLO 2 X18 ( 100 MTS)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (296, N'CORNER SIMPLE MARON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (297, N'CORNER DOBLE MARON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (298, N'GOMETAS TRANSPARENTES', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (299, N'VENIL ARENADO  0,28 X 1,40', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (300, N'PERNO COCHE 1/4 X 3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (301, N'TIRAFON 1/4 X 4"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (302, N'STOBOL 1/4 X 2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (303, N'TORNILLO SPACK 6 X 40', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (304, N'TORNILLO SPACK 5 X 60 2 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (305, N'NAPA SILICONADA  "A"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (306, N'CLAVILLO F 30', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (307, N'CLAVILLO F 15', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (308, N'IMAN', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (309, N'CLAVILLO F50', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (310, N'PERNO 1/4 X 3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (311, N'AUTOROSCANTE 10 X 1 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (312, N'AUTOROSCANTE 8 X 2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (313, N'PERNO MEDIANO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (314, N'TUBO RED 7/8* MATE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (315, N'BRIDA ALUMINIO 7/8*', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (316, N'TIRADOR TIPO ANILLO 3/ 8 X 9 .5', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (317, N'(NO USAR) LIJA AL AGUA GR.180', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (318, N'(NO USAR) LIJA TELA ESMERIL ASA 60L 9 " X 11', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (319, N'BANDAS ASALOX 120 X 2 3/ 4" X 32 3/4"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (320, N'DICROICO 220', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (321, N'MANGUERA AUTOMOTRIZ 3/4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (322, N'TOPE ADHESIVO CRISTAL 8MMX3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (323, N'TOPE ADHESIVO 03', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (324, N'PEGAMENTO MULTIUSO 50/1', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (325, N'GRAPAS  NEUMATICA 80/10 FASTENING SYSTEM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (326, N'GRAPA NEUMATICA  17/ 80 SN', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (327, N'LIJA PAPEL (MADERA) Nª 80', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (328, N'HILO BLANCO 20/30', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (329, N'HILO BLANCO NRO 9 **', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (330, N'CRISTAL INCOLORO 10MM 2500 X3600', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (331, N'TIRAFON 1/4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (332, N'(NO USAR) TIRAFON 1/4 X 3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (333, N'TORNILLO SPAC K 4 X 60', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (334, N'TORNILLO SPACK 5 X 50 2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (335, N'TORNILLO SPACK 3.5 X 40', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (336, N'TORNILLO BRONCEADOS PARA MADERA 5/8 X 4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (337, N'HILO ZAPATERO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (338, N'KEROSENE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (339, N'MDF 18MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (340, N'TAPACANTO PVC 22 MM CEREZO CANPLAST', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (341, N'AMECOL (COLA 1900)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (342, N'PERNO COCHE 1/4 X 2 "', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (343, N'PERNO COCHE 1/4 X 2 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (344, N'CLAVO 2 X 13 C/ C X 30 KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (345, N'TORNILLO SPACK 3.5 X 20', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (346, N'TORNILLO SPACK 3.5 X 16 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (347, N'TORNILLO SPACK 3.5 X 12', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (348, N'TORNILLO SPACK 3  X 12', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (349, N'TORNILLO SPACK 3 X 20', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (350, N'TUBO RED 5/8* MATE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (351, N'POLEA 9 X 2 X 1/3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (352, N'POLEA 5 X 2 5/3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (353, N'PRISIONEROS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (354, N'FRESA RUTIARONA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (355, N'POLIPROPILENO 1.37 X 2.00 MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (356, N'CINTA SELLADORA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (357, N'TUBO RECTO 2 " X 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (358, N'TUBO OVALADO X 2.40 MTS CROMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (359, N'COLITA PARA DICROICO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (360, N'STOBOL 1/4 X 3"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (361, N'BISAGRA CAPUCHINA 2 1/2 X 21/2 DORADA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (362, N'TUERCAS 3/8 HEXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (363, N'TORNILLO SPACK 4 X 60', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (364, N'TORNILLO AUTOROSCANTE 12 X 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (365, N'FORMULA 1', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (366, N'JALADOR BRONCE EXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (367, N'PERILLA BRONCE SOL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (368, N'JALADOR BRONCE QUEMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (369, N'LACA A LA PIROXILINA VERDE THONER', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (370, N'ESMALTE SINTETICO AZUL TONNER', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (371, N'LACA A LA PIROXILINA ROJO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (372, N'SELLADORA  CATALIZADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (373, N'PERNO COCHE 1/4 X 4"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (374, N'PERILLA COMPA QUEMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (375, N'OJALILLO COLOR ESMALTE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (376, N'OJALILLO  #28', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (377, N'OJALILLO   B.1', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (378, N'OJALILLO #24', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (379, N'REGATONES', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (380, N'MINIFIX', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (381, N'ANGULOS 1 1/2 X 1 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (382, N'TOPE AUTOADESIVO Nº4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (383, N'TOPE AUTOADESIVO Nº 8', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (384, N'DD/A5', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (385, N'BANDA CLASICO 2 1/2 NAT MATE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (386, N'ROLLOS DE POLIPROPILENO 1.40 X 2.00 MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (387, N'TIRADOR CURVO LORO GRANDE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (388, N'BANDAS 2 PLZ MARFIL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (389, N'PINTURAS ANYZA TEKNO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (390, N'CRISTAL BRONCE 6MM 2140X 3210MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (391, N'CLAVILLO F40', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (392, N'LIJA TELA ESMERIL 40', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (393, N'DESLIZADOR NEGRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (394, N'CORREDERA RODAGGIO 400 NEGRO 16"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (395, N'ANILINA NEGRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (396, N'CERROJO REDONDO DOBLE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (397, N'CHAPA  VERONI EMPASTADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (398, N'ROLLOS DE POLIPROPILENO 2.00 X 2.00 MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (399, N'TIRADOR RECTO BRONCE QUEMADO MODELO ANILLO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (400, N'ARRANCADOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (401, N'ESMALTE SINTETICO ALUMINIO *', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (402, N'CRISTAL CURVO 6MM 20*X 38*', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (403, N'BISEL FORMA 3MM A 6MM ESP 0.5X0.95', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (404, N'TORNILLO AUTOROSCANTE 12 X 1 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (405, N'PEGAMENTO AMAZONAS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (406, N'TORILLO AUTOROSCANTE 3.5 X 16', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (407, N'BISAGRA CANGREJO LATERAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (408, N'TORNILLO AUTOROSCANTE 3.5 X 15 X 1000', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (409, N'CLAVILLO 2 X 14 SIN CABEZA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (410, N'CLAVO 1/2 S/C', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (411, N'STOBE 2 1/2 X 5/32', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (412, N'TORNILLO  AUTOROSCANTE 6 X 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (413, N'TOPE ADHESIVO CLARO Nª 09', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (414, N'UÑA METAL PLATEADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (415, N'JALADOR ARCO METAL PLATEADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (416, N'JALADOR TALLADO METAL T-51 96MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (417, N'JALADOR ARCO DORADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (418, N'POLIPROPILENO 1.30 X 200 MUEBLES', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (419, N'CLAVO 3/4 S/C', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (420, N'ANTICORROSIVO GRIS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (421, N'ANTICORROSIVO NEGRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (422, N'JALADOR BRONCE CON ARITO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (423, N'PERILLA BRONCE MANZANA (2)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (424, N'PERILLA TORNEADA COPA DORADA (1)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (425, N'JALADOR BRONCE DORADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (426, N'DESLIZADOR MARRON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (427, N'PERILLA CAÑA METAL PLATEADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (428, N'LIJA AL AGUA GR 220', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (429, N'CORNEFIX', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (430, N'TAPITA TORNILLO ALMENDRA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (431, N'LIJA BANDA 100  0.23 1/2 X 2.20 MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (432, N'PERILLA TORNEADA DE BRONCE (11)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (433, N'PEGOL ENCHAPE EXTRA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (434, N'GRECA CREMA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (435, N'TAPITA TORNILLO BLANCO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (436, N'PASACABLE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (437, N'PERILLA LAGRIMA  BRONCE QUEMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (438, N'PERILLA BOLON DORADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (439, N'PERILLA CORCHO DORADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (440, N'TAPITA TORNILLO CEDRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (441, N'CLAVO 1/2 CON CABEZA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (442, N'ESPEJO MIREX INCOLORO 2MM 1448 X 2184MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (443, N'POLIPROPILENO 1.40 X 200 MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (444, N'ESPEJO MIREX 2MM  1700 X 2200', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (445, N'APLICAS MATIZ', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (446, N'APLICAS MONICA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (447, N'APLICAS ELEGANTA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (448, N'APLICAS LUCY', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (449, N'APLICAS KASSANDRA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (450, N'APLICAS RISOLI', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (451, N'APLICAS ISABEL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (452, N'APLICAS MARRIOT', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (453, N'CRISTAL 10MM SATINADO 2.13 X 3.66', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (454, N'LIJA PAPEL 40', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (455, N'(NO USAR) GRAPA B  14/50   2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (456, N'CRISTAL INCOLORO 10MM. 2134 X 3300', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (457, N'CRISTAL INCOLORO 3MM  1803 X 2489', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (458, N'CLAVO 3/4" CON CABEZA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (459, N'CLAVO 1 1/2 SIN CABEZA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (460, N'GRAPA B 14/38   1 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (461, N'GRAPA B - 06 (1)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (462, N'APLICAS LETICIA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (463, N'PERNO 5/16 X 1 HEXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (464, N'PERNO 5/16 X 2 HEXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (465, N'PERNO 3/8 X 1 HEXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (466, N'PERNO 3/8 X 1 1/2 HEXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (467, N'PERNO 3/8 X 2 HEXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (468, N'ESTOBOL 5/32 X 2 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (469, N'ESTOBOL 5/32 X 2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (470, N'ESTOBOL 5/32 X 3"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (471, N'GRAPA B-14/50 2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (472, N'ARANDELA M 12', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (473, N'PERNO 1/2 X  5/16 HEXAGONAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (474, N'TORNILLO SPACK 3.5 X 16 1 1/4"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (475, N'CORDON NEGRO DELGADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (476, N'HILO 20/3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (477, N'JALADOR KENI PLATEADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (478, N'JALADOR SAMBA PLATEADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (479, N'JALADOR PLATA PLATEADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (480, N'JALADOR BRONCE C/ PUNTA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (481, N'PERILLA BRONCE QUEMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (482, N'PERILLA BRONCE FLOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (483, N'RAIZ (CHOPO)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (484, N'PEGAMENTO MULTIUSO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (485, N'TORNILLO AUTORROSCANTE 3.5 X 15', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (486, N'DICROICO 325V', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (487, N'ENCHUFE PLANO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (488, N'CIERRE NYLON  X  200  YRD', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (489, N'(NO USAR) PANQUEQUE 110 GRM  X  1.50  X  35MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (490, N'JALADORES # 19', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (491, N'JALADORES # 18', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (492, N'JALADORES # 14', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (493, N'PERILLA BRONCE MANZANA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (494, N'TORNILLO AUTOROSCANTE 12 X 3/4"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (495, N'TORNILLO AUTORROSCANTE 12 X 1"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (496, N'APLICAS LEGRAND', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (497, N'APLICAS CHAVELLY', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (498, N'GRECA DORADA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (499, N'CATALIZADOR (MEK PEROXIDO) X KLG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (500, N'PERILLA UÑA PLATEADA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (501, N'PANQUEQUE 110GRM X 140', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (502, N'JALADOR BRONCE MANZANA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (503, N'CRISTAL BRONCE 10MM 2140X 3300MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (504, N'CRISTAL INCOLORO 10MM. 2140 X 3600', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (505, N'TORNILLO SPACK 3.5 X 30', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (506, N'STOVE BOLTS 3/16 X 2 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (507, N'chincheta 15 - 3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (508, N'TACHUELA N', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (509, N'CRISTAL INCOLORO 6MM 1.800 X 2.500', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (510, N'JALADOR COLINA 96 MM ORO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (511, N'JALADOR DENVER 128 MM CROMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (512, N'JALADOR ATLANTA 96MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (513, N'JALADOR IMPORTADO ATLANTA 128MM BRILLO S/B', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (514, N'JALADOR PARTENON 96MM BRILLO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (515, N'JALADOR IMPORTADO PARTENON 160MM ARGENTO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (516, N'JALADOR ASPEN 96MM BRILLO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (517, N'JALADOR IMPORTADO ASPEN 160MM BRILLO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (518, N'JALADOR ATLANTA 96MM S/B', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (519, N'JALADOR ATLANTA 96MM ORO S/B', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (520, N'JALADOR ATLANTA 96MM ORO C/B', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (521, N'PATAS IMPORTADAS MEDITERRANEO CROMO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (522, N'RESPIRO CROMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (523, N'RESPIRO CAOBA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (524, N'RESPIRO CEREZA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (525, N'RESPIRO MARRON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (526, N'TAPA HUECOS 8MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (527, N'ZAPATA 15 X 15 CAOBA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (528, N'ZAPATA 15 X 15 CEREZA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (529, N'ZAPATA 15 X 15 MARRON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (530, N'ZAPATA 15 X 15 MARFIL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (531, N'TAPA PARA MINI FIX ESP 6MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (532, N'TAPA PARA MINI FIX ESP 6MM MARFIL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (533, N'TARUGO 8 X 22MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (534, N'TORNILLO MINIFIX 32MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (535, N'TAMBOR MINIFIX', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (536, N'BUJE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (537, N'ZAPATA 20 X 4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (538, N'TAPA HUECOS 16MM COBA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (539, N'TAPA HUECOS 16MM CEREZA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (540, N'TAPA HUECOS 16MM MARRON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (541, N'TAPA HUECOS 16MM MARFIL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (542, N'ZAPATA NEGRA DE 1"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (543, N'ZAPATA NEGRA C/HUECO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (544, N'TAPA HUECOS 14MM CAOBA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (545, N'TAPA HUECOS 14MM CEREZA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (546, N'TAPA HUECOS 14MM MARRON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (547, N'TAPA HUECOS 14MM MARFIL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (548, N'PIN SOPORTE 8 X 6 MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (549, N'CONTRA GOLPE SILICONADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (550, N'LLAVE SOPRANO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (551, N'ENTR. LLAVES NIQUEL MATE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (552, N'CERRADURA TABACO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (553, N'CERRADURA MARFIL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (554, N'GRAMPADORA NEUMATICA 80 W/16 B1', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (555, N'GRAMPADORA NEUMATICA LNF 50', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (556, N'FILTRO DE AIRE / REG.1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (557, N'FILTRO DE AIRE / REG. Y LUB. 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (558, N'JALADOR RIVIERA 96MM CROMO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (559, N'TAPACANTO MOGNO BOM 19MM 180 ESPESOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (560, N'TAPACANTO MOGNO BOM 22MM 180 ESPESOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (561, N'TAPACANTO MOGNO BOM 30MM 180 ESPESOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (562, N'TAPACANTO NOGUEIRA CPI 19MM 180 ESPESOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (563, N'TAPACANTO NOGUEIRA CPI 22MM 180 ESPESOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (564, N'TAPACANTO NOGUEIRA CPI 30MM 180 ESPESOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (565, N'TAPACANTO TABACO CPI 19MM 180 ESPESOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (566, N'TAPACANTO TABACO CPI 30MM 180 ESPESOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (567, N'TAPACANTO MARFIM 16  19MM 210 ESPESOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (568, N'TAPACANTO MARFIM 16  22MM 210 ESPESOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (569, N'TAPACANTO MARFIM 16  30MM 210 ESPESOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (570, N'TAPACANTO MOGNO NOBRE 19MM  180 ESPESOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (571, N'MASSA UV BALDE METALICO 25KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (572, N'VERNIZ UV FOSCO ESPECIAL BALDE METALICO 19KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (573, N'VERNIZ UV LASER BALDE METALICO 20.0KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (574, N'SELLER UV-BALDE METALICO 230KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (575, N'ESMALTE UV BRANCO FOSCO BALDE METALICO 23.0KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (576, N'SOLUCAO DE FOTOINICIADOR-LATA MATALICA 5.0LTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (577, N'TINGIDOR NARFIM UV IMPRES BALDE METALICO 19KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (578, N'TINGIDOR CEREZO UV IMPRES BALDE METALICO 19.0KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (579, N'TINGIDOR MOGNO UV IMPRES BALDE METALICO 19.0KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (580, N'TINGIDOR TABACO UV IMPRES BALDE METALICO 19.0KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (581, N'PRIMER UV BRANCO BALDE METALICO 25.0KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (582, N'PRIMER UV MARFIM BALDE METALICO 25.0KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (583, N'PRIMER UV CEREZO BALDE METALICO 25.0KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (584, N'PRIMER UV MOGNO BALDE METALICO 23.0KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (585, N'PRIMER UV TABACO BALDE METALICO 23.0KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (586, N'PASTA UV PRETO 10 GALAO METALICO 3.5KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (587, N'PASTA UV VERMLH-OXIDO 40GALAO METALICO 5.0KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (588, N'PEGAMENTO PARA TUVOS ESPUMA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (589, N'CERA PARA DISUEÑOS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (590, N'PLASTICO AZUL GRUESO ESPUMA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (591, N'CINTA EMBALAJE ESPUMA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (592, N'MANGA CRISTAL 60 X 4 ESPUMA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (593, N'PIG NEGRO MICRONIZADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (594, N'PIG NARANJA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (595, N'PIG AMARILLO 1300C', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (596, N'PIG ROJO 4801/WG3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (597, N'PIG AZUL 1501', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (598, N'PIG AMARILLO 1303', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (599, N'MANGA CRISTAL 42X2.5 PICADILLO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (600, N'MANGA CRISTAL 50X1.8 DISUEÑOS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (601, N'MANGA CRISTAL DISUEÑO X 1.5', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (602, N'PLASTICOS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (603, N'MANGA CRISTAL 50 º X 2 ABIERTO UN LADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (604, N'MANGA CRISTAL 105CM X 3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (605, N'JALADOR IMPORTADO ATLANTA 96MM ARGENTO S/B', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (606, N'APLICAS DE SALA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (607, N'ESPEJO MIREX 2MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (608, N'PLANCHAS 2 X 1 X 1 1/4 NARANJA D200', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (609, N'CRISTAL INCOLORO 3MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (610, N'COJINES 58 X 65 X 5 AMARILLO 500', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (611, N'TORNILLO SPACK 4 X 25', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (612, N'TORNILLO SPACK 4 X 30', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (613, N'ESPEJO MIREX 3MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (614, N'COJINES 60 X 58 X 5 AMARILLO 500 D', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (615, N'CRISTAL INCOLORO 8MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (616, N'COJINES 50 X 60 X 4 AMARILLO 500 D', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (617, N'CRISTAL GRIS 6MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (618, N'JALADOR IMPORTADO ASPEN 96MM BRILLO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (619, N'JALADOR IMPORTADO ATLANTA 96MM ORO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (620, N'JALADOR IMPORTADO COLINA 96MM ORO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (621, N'JALADOR IMPORTADO PARTENON 96MM ARGENTO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (622, N'ESTOBOL 3/16 X 1 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (623, N'ESTOBOL 3/16 X 2 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (624, N'ESTOBOL 3/16 X 2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (625, N'ZOCALO PINO NAT MATE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (626, N'MANGUERA DELGADA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (627, N'ELASTICO POLIESTER', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (628, N'(NO USAR) PANQUEQUE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (629, N'JALADOR CORREA CHICA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (630, N'JALADOR BRILLO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (631, N'JALADOR CORREA GRANDE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (632, N'JALADOR ALA GRANDE QUEMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (633, N'JALADOR MEDIA LUNA GRUESO QUEMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (634, N'JALADOR MANO QUEMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (635, N'APLICAS ZAMARA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (636, N'JALADOR ANGIE PLATEADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (637, N'JALADOR BRONCE LAZO QUEMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (638, N'JALADOR ANILLO DORADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (639, N'JALADOR IMPORTADO PLATEADO 96MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (640, N'JALADOR IMPORTADO DORADO 96MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (641, N'JALADOR GRANDE PLATA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (642, N'JALADOR ARCO IRIS DORADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (643, N'JALADOR MEDIANO PLATA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (644, N'JALADOR MEDIANO DORADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (645, N'GRECA BEIGE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (646, N'ESMALTE SINTETICO PREMIUN AMARILLO LIMON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (647, N'ROLLO DE PROLIPROPILENO 1.70 X 200 MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (648, N'PATAS VIVIANA VARIOS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (649, N'ESMALTE ACRILICO BRILLO DIRECTO BLANCO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (650, N'EXTRA THINNER', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (651, N'TORNILLOS SPACK 4 X 80', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (652, N'ARANDELA 3/16', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (653, N'ARANDELA 5/32', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (654, N'TORNILLOS AUTORROSCANTE 6 X 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (655, N'VARILLAS 5/16 X 1 MTS CON TUERCA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (656, N'SOFA 1CPO ATENA INGLES INGLES MIX CHENILLE COMBINADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (657, N'ANGULO 5"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (658, N'ANGULO 2 1/2 "', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (659, N'ANGULO 4"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (660, N'JALADOR BRONCE CON PUNTA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (661, N'APLICAS CHELLEMIX NAT  BRILLANTE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (662, N'JGO ZOCALOS FILADELFIA 3-2-1- NOGAL MAT', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (663, N'PANQUEQUE 080 GR DE 2.0 X 50. MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (664, N'FIERRO DE CONSTRUCCION 1/4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (665, N'TORNILLO SPACK 4  X 70', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (666, N'PANQUEQUE 80 GR DE 1.40 X 50. MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (667, N'APLICAS LETICIA EN PROCESO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (668, N'POLYESTER POLY BRIGHT', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (669, N'PATA CROMADA  H120MM  Z205C', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (670, N'PATA CROMADA  H115  Z233', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (671, N'APLICAS SALOME NAT BRILLANTE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (672, N'HILO TREN 20/3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (673, N'TORNILLO AUTORROSCANTE 6 X 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (674, N'LACA A LA  PIROXILINA AMARILLO MEDIO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (675, N'ANGULOS 2 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (676, N'ANGULOS 4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (677, N'ANGULOS 5', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (678, N'TEKNO COLA ULTRA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (679, N'POLIPROPILENO TELA BLANCA 1.30 MTS DE ANCHO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (680, N'OLEO MATE ROJO BERMELLON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (681, N'CINTA MASKING 3/4 X 40 YDS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (682, N'BISAGRA CAPUCHINA 2 1/2 X 1 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (683, N'BISAGRA CAPUCHINA 2 1/2 X 2 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (684, N'ESTOBOL 5/32 X 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (685, N'ESTOBOL 5/32 X 1" CABEZA PLANA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (686, N'ESTOBOL 5/32 X 1 1/2" CABEZA PLANA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (687, N'ESTOBOL 1/4 X 3"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (688, N'LIJA AL AGUA GR 800', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (689, N'LIJA BANDA 80 (0.25CM X 2.0MT)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (690, N'ESMALTE ACRILICO BRILLO DIRECTO ALUMINIO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (691, N'LACA A LA PIROXILINA AZUL THONNER', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (692, N'LIJA BANDA 120 PARA VIDRIO ( 3" X 74 3/4")', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (693, N'LIJA BANDA 40 (3 X 11 9/16)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (694, N'LIJA BANDA 80 (3  X 11 9/16)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (695, N'LIJA BANDA 60 (3 X 11 9/16)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (696, N'LIJA BANDA 40 (2 3/4 X 10 3/4)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (697, N'LIJA BANDA 60 (2 3/4 X 10 3/4)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (698, N'LACA A LA PIROXILINA  AZUL ULTRAMAR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (699, N'LACA A LA PIROXILINA  TRANSPARENTE BRILLANTE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (700, N'LACA A LA PIROXILINA TRANSPARENTE MATE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (701, N'LACA A LA PIROXILINA VERDE ACENTO THONNER', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (702, N'LACA A LA PIROXILINA ROJO RUBI', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (703, N'LACA A LA PIROXILINA AZUL MARINO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (704, N'TORNILLO SPACK 3.5 X 13', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (705, N'TORNILLO SPACK 5.0 X 50 2¨', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (706, N'TORNILLO SPACK 5.0 X 100 4¨', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (707, N'TORNILLO SPACK 3.5 X 17', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (708, N'PERILLA PINO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (709, N'PERNO COCHE 1/4 X 3 1/4 CABEZA LENTEJA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (710, N'PATAS IMPORTADAS ATLANTICO ARGENTO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (711, N'VENCECOLA PROFESIONAL X KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (712, N'POLISEDA TELA NOTEX *', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (713, N'REMOVEDOR DE PINTURA ANYPSA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (714, N'GRAPA EN TIRA MARAGA STEEL 1 3/4"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (715, N'GRAPA EN TIRA MARAGA STEEL 2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (716, N'CLAVILLO MARAGA STEEL 1 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (717, N'CLAVO EN ROLLO MARAGA STELL 2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (718, N'CLAVO EN ROLLO MARAGA STELL 2 3/8"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (719, N'CORREDERA TELESCOPICA 16"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (720, N'PATAS VIVIAN NOGAL MATE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (721, N'ZOCALO NOGAL MATE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (722, N'BASE ZINCROMATO INDUSTRIAL BLANCO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (723, N'GARRUCHAS 2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (724, N'APLICAS RANCES NAT BRILLANTE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (725, N'TOPE CROMO 1 1/2 X 20 MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (726, N'CLAVO EN ROLLO MARAGA STEEL 2 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (727, N'APLICAS MANHATAN NAT BRILLANTE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (728, N'VENCECOLA SECADO RAPIDO X KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (729, N'VENCECOLA DORADA X KG', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (730, N'PANQUEQUE 0.60 X 2.00 X 50 MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (731, N'PERNO COCHE 1/4 X 5"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (732, N'PITA DE YUTE MADEJA GRANDE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (733, N'HILO 12/3  "', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (734, N'PATAS INCLINADAS 12 X 1 3/4 C/ ARGOLLA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (735, N'PATAS CROMADAS H120MM  Z219C', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (736, N'PATAS CROMADAS H120MM  Z225N', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (737, N'CINTA MASKING 1 X 40 YDS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (738, N'HILO NAYLON TRAMADO ( HILO DE ZAPATERO)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (739, N'JALADOR MODELO CLIENTE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (740, N'JALADOR MEDIA LUNA DELGADO QUEMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (741, N'PERILLA EXAGONAL BRILLO DORADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (742, N'PATAS CROMADAS H130MM Z216C', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (743, N'PATAS CROMADAS H120MM Z205C', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (744, N'APLICAS GEMENIS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (745, N'VENCECOLA SECADO RAPIDO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (746, N'PATAS VIVIAN DUCO NOGAL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (747, N'PATAS VIVIAN DUCO NEGRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (748, N'APLICAS LETICIA NAT MATE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (749, N'COPETA DE LETICIA 3CPO NAT MATE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (750, N'COPETA DE LETICIA 2CPO NAT MATE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (751, N'COPETA DE LETICIA 1CPO NAT MATE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (752, N'CRISTAL 10 MM BRONCE CORTADO 2.10 X 1.10', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (753, N'PATAS VIVIAN NAT BRILLANTE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (754, N'HILO NRO 10', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (755, N'TOPE CROMO 2 X 50 MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (756, N'BISAGRA B- 7N NEGRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (757, N'MANGA ARTILLERA 1.30 X 2.00 MTS BLANCOS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (758, N'CERROJO C-8 REDONDO SIMPLE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (759, N'PLACA P-2N NEGRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (760, N'APLICAS ESPAÑOL EN PROCESO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (761, N'TARUGOS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (762, N'APLICAS CHAVELLY NAT BRILLANTE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (763, N'POLYPROPYLENO 1.30 X 200 MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (764, N'PATA DE ALUMINIO 50 X 120MM A 101', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (765, N'IMAN', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (766, N'ESMALTE SINTETICO BLANCO HUMO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (767, N'MANGA BLANCA 27 ABIERTA  (POLIPROPILENO 1.4 ANCHO )', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (768, N'CABLE MELLIZO 2 X 18  INDECO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (769, N'LIJA BANDA 60 (3" X 20")', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (770, N'TORNILLO AUTORROSCANTE 4 X 20', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (771, N'TORNILLO AUTORROSCANTE 4 X 16', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (772, N'THINER ACRILICO EXTRA ALTO BRILLO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (773, N'TAPACANTO CAOBA 30MM 180 ESPESOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (774, N'TAPACANTO CAOBA 22MM 180 ESPESOR', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (775, N'TAMBOR DE VINIFLIX', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (776, N'PIN VINIFLIX PLASTICO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (777, N'PERILLA FIERRO REDONDO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (778, N'OLEO MATE LADRILLO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (779, N'OLEO MATE SINTETICO CREMA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (780, N'OCRE ROJO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (781, N'MANGUERA AUTOMOTRIZ 5/16', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (782, N'LIJA AL AGUA GR 40', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (783, N'LIJA AL AGUA GR 80', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (784, N'LIJA AL AGUA GR 320', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (785, N'LIJA AL AGUA GR 400', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (786, N'LACA CATALIZADA AL ACIDO P/ MADERA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (787, N'LACA CATALIZADA ROJO INGLES', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (788, N'JALADOR MEDIA LUNA PLATEADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (789, N'JALADOR LUNA DELGADA PLATEADA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (790, N'JALADOR IMPORTADO PLATEADO 140MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (791, N'JALADOR IMPORTADO DORADO 140MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (792, N'JALADOR CORREA DORADA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (793, N'JALADOR IMPORTADO DORADO 260 MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (794, N'JALADOR IMPORTADO PLATEADO 260 MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (795, N'JALADOR FANTASIA METAL DORADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (796, N'JALADOR BRONCE INDU', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (797, N'GRECA VARIOS COLORES', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (798, N'GRAPAS IMPORTADAS 3/8 (9.85MM)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (799, N'ESTOBOL 5/32 X 3/4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (800, N'ESMALTE ACRILICO AUTOMOTRIZ ROJO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (801, N'BISAGRA DE PUNTO PARA VIDRIO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (802, N'BISAGRA CAPUCHINA 2 1/2 X 1 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (803, N'BISAGRA CAPUCHINA 2 1/2 X 2 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (804, N'BISAGRA CAPUCHINA 2 X 1 1/4', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (805, N'BASE ZINCROMATO BLANCO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (806, N'ANTICORROSIVO STANDARD BLANCO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (807, N'SHAMPOO FIBREK TEKNO ( LIMPIEZA DE TAPIZ DE MUEBLES)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (808, N'SHAMPOO LIMPIEZA TAPIZ DE MUEBLES', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (809, N'LIMPIADOR DE VIDRIOS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (810, N'HILO NRO 10*', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (811, N'HILO 20/3 ( X 2 MIL YDS)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (812, N'BISAGRA DE PUNTO PARA VIDRIO *', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (813, N'PATAS CROMADAS H150MM Z220-1', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (814, N'PATAS CROMADAS 329', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (815, N'TORNILLOS AUTORROSCANTE 6 X 1"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (816, N'TORNILLOS AUTORROSCANTE 6 X 1 1/2"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (817, N'TIRAFON 5/16 X 1 1/2', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (818, N'LACA A LA PIROXILINA GRIS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (819, N'LACA A LA PIROXILINA MASILLA BLANCA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (820, N'CORREDERA METALICA 20"', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (821, N'TUBO DE ALUMINIO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (822, N'TIRADORES 25CM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (823, N'HILO 20/3  X 3000 YDS 325', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (824, N'PATAS CROMADAS PARA MADERA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (825, N'FONDO LIJABLE DD/A5', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (826, N'CATALIZADOR FONDO LIJABLE DD/B5', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (827, N'PATAS CROMADA SL-325', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (828, N'HILO NRO 9 NEGRO **', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (829, N'PANQUEQUE 60 GR DE 1.40 X 50. MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (830, N'JALADOR MANO GRANDE QUEMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (831, N'CRISTAL INCOLORO 15MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (832, N'PANEL DE 2.00 X 2.00 FABRICACION ESPUMAS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (833, N'PLANCHAS 1.80 X 1.20 X 1 LILA 120T', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (834, N'HILO POLIESTHER 210D/3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (835, N'HILO POLIESTHER 20S/3', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (836, N'FIELTRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (837, N'NAYLO PARA COLCHON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (838, N'CINTA 40MM BANDA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (839, N'POLIPROPILENO 1.70MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (840, N'CINTA LABRADA 25 MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (841, N'POLIPROPILENO 2 Mts', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (842, N'CINTA RIGIDA PARA COLCHON 40MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (843, N'SUPERFLEX 2 .05 X1.15 (1 1/2PL)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (844, N'ETIQUETA DISUEÑO PLASTICO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (845, N'ETIQUETA SOFT DREAM GARANTIA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (846, N'ETIQUETA CENTRO DISUEÑO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (847, N'PANEL NOLA 13 X 22', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (848, N'PANEL NOLA 7 X 22', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (849, N'PANEL NOLA 11 X 22', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (850, N'PANEL NOLA 8 X 22', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (851, N'GRAPAS INDUSTRIALES PARA COLCHONES', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (852, N'POLIPROPILENO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (853, N'GRAPAS INDUSTRIALES PARA COLCHON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (854, N'PANEL NOLA 12 X 22', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (855, N'BOLSAS TUX64 COLCHON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (856, N'RESPIRADOR DE COLCHON DORADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (857, N'RESPIRADOR DE COLCHON BRONCE', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (858, N'RESPIRADOR DE COLCHON NIKEL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (859, N'RESPIRADOR DE COLCHON QUEMADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (860, N'PLASTICO CRISTAL COLCHON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (861, N'CINTA RIGIDA PARA COLCHON 32MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (862, N'HILO BLANCO 20/2 COLCHON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (863, N'PANEL NOLA 10 X 22', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (864, N'HILO BLANCO COLCHON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (865, N'MAQUETA GOLD DRILL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (866, N'CINTA RIGIDA  PARA COLCHON 25MM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (867, N'NOTEX D', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (868, N'MAQUETA 75 X 55 SUITE DREAM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (869, N'PANEL NOLA 9 X 22', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (870, N'POLIPROPILENO 2.00 MTS DE ANCHO X 200MTS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (871, N'XXXXPANEL 1/ 2 X 7', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (872, N'XXXXPANEL 2 X 10', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (873, N'PANEL NOLA 6 X 22', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (874, N'PANEL QUEEN 14 X 23', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (875, N'PANEL KING 17 X 23', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (876, N'GRAPAS C-20 2COLCHONES', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (877, N'GRAPAS J-22 1COLCHONES', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (878, N'SUPERFLEX 2.05 X 1.57 QUEEN 2 1/2PL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (879, N'SUPERFLEX 2.05 X 2.08 KING 3 PL', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (880, N'PANEL NOLA 15 X 24', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (881, N'HILO BLANCO 40/2 COLCHON', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (882, N'ETIIQUETA DELEITE PULGADAS', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (883, N'ETIQUETA RESORTE REFORZADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (884, N'PANEL QUEEN 15 X 23', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (885, N'ETIQUETA BOX (ANTIGO)', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (886, N'ETIQUETA PILLOW TOP', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (887, N'ETIQUETA GOLD DREAM CERTIFICADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (888, N'ETIQUETA START NIGHT', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (889, N'ETIQUETA START NIGHT ESQUINERO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (890, N'ETIQUETA START NIGHT CERTIFICADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (891, N'ETIQUETA LIFE DREAM', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (892, N'ETIQUETA LIFE DREAM CENTRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (893, N'ETIQUETA LIFE DREAM ESQUINERO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (894, N'ETIQUETA LIFE DREAM CERTIFICADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (895, N'ETIQUETA SOFT DREAM ESQUINERO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (896, N'ETIQUETA START NIGHT CENTRO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (897, N'PANEL 5 X 8  MAQUETA', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (898, N'PANEL 18 X 23 KING', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (899, N'MANGA CRISTAL 1.5 DISUEÑO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (900, N'TARJETA Y LECTORA PARTES P/ MAQUINAS TELARES', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Articulo] ([Id], [Descripcion], [TipoExistencia], [Activo], [StockActual], [IdFormulaProduccion]) VALUES (901, N'PAPEL TRANSFERENCIA IMPORTADO', N'M', 1, CAST(15000.00 AS Decimal(12, 2)), NULL)
GO
SET IDENTITY_INSERT [dbo].[Articulo] OFF
GO
SET IDENTITY_INSERT [dbo].[ArticuloFormulaProduccion] ON 

GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (1, CAST(0.25 AS Decimal(12, 2)), 51, 9)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (2, CAST(0.25 AS Decimal(12, 2)), 52, 9)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (3, CAST(0.25 AS Decimal(12, 2)), 53, 9)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (4, CAST(0.25 AS Decimal(12, 2)), 54, 10)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (5, CAST(0.25 AS Decimal(12, 2)), 55, 10)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (6, CAST(0.25 AS Decimal(12, 2)), 56, 10)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (7, CAST(0.25 AS Decimal(12, 2)), 57, 10)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (8, CAST(0.25 AS Decimal(12, 2)), 58, 10)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (9, CAST(0.25 AS Decimal(12, 2)), 59, 10)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (10, CAST(0.25 AS Decimal(12, 2)), 60, 10)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (11, CAST(0.25 AS Decimal(12, 2)), 61, 25)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (12, CAST(0.25 AS Decimal(12, 2)), 62, 25)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (13, CAST(0.25 AS Decimal(12, 2)), 63, 25)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (14, CAST(0.25 AS Decimal(12, 2)), 64, 25)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (15, CAST(0.25 AS Decimal(12, 2)), 65, 25)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (16, CAST(0.25 AS Decimal(12, 2)), 66, 25)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (17, CAST(0.25 AS Decimal(12, 2)), 67, 48)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (18, CAST(0.25 AS Decimal(12, 2)), 68, 48)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (19, CAST(0.25 AS Decimal(12, 2)), 69, 48)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (20, CAST(0.25 AS Decimal(12, 2)), 70, 48)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (21, CAST(0.25 AS Decimal(12, 2)), 71, 48)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (22, CAST(0.25 AS Decimal(12, 2)), 72, 30)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (23, CAST(0.25 AS Decimal(12, 2)), 73, 30)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (24, CAST(0.25 AS Decimal(12, 2)), 74, 30)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (25, CAST(0.25 AS Decimal(12, 2)), 75, 30)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (26, CAST(0.25 AS Decimal(12, 2)), 76, 30)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (27, CAST(0.25 AS Decimal(12, 2)), 77, 30)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (28, CAST(0.25 AS Decimal(12, 2)), 78, 30)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (29, CAST(0.25 AS Decimal(12, 2)), 79, 30)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (30, CAST(0.25 AS Decimal(12, 2)), 80, 30)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (31, CAST(0.25 AS Decimal(12, 2)), 81, 7)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (32, CAST(0.25 AS Decimal(12, 2)), 82, 7)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (33, CAST(0.25 AS Decimal(12, 2)), 83, 7)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (34, CAST(0.25 AS Decimal(12, 2)), 84, 7)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (35, CAST(0.25 AS Decimal(12, 2)), 85, 7)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (36, CAST(0.25 AS Decimal(12, 2)), 86, 8)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (37, CAST(0.25 AS Decimal(12, 2)), 87, 8)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (38, CAST(0.25 AS Decimal(12, 2)), 88, 8)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (39, CAST(0.25 AS Decimal(12, 2)), 89, 8)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (40, CAST(0.25 AS Decimal(12, 2)), 90, 8)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (41, CAST(0.25 AS Decimal(12, 2)), 91, 9)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (42, CAST(0.25 AS Decimal(12, 2)), 92, 9)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (43, CAST(0.25 AS Decimal(12, 2)), 93, 9)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (44, CAST(0.25 AS Decimal(12, 2)), 94, 9)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (45, CAST(0.25 AS Decimal(12, 2)), 95, 9)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (46, CAST(0.25 AS Decimal(12, 2)), 96, 10)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (47, CAST(0.25 AS Decimal(12, 2)), 97, 10)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (48, CAST(0.25 AS Decimal(12, 2)), 98, 10)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (49, CAST(0.25 AS Decimal(12, 2)), 99, 10)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (50, CAST(0.25 AS Decimal(12, 2)), 100, 10)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (51, CAST(0.25 AS Decimal(12, 2)), 101, 11)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (52, CAST(0.25 AS Decimal(12, 2)), 102, 11)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (53, CAST(0.25 AS Decimal(12, 2)), 103, 11)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (54, CAST(0.25 AS Decimal(12, 2)), 104, 11)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (55, CAST(0.25 AS Decimal(12, 2)), 105, 11)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (56, CAST(0.25 AS Decimal(12, 2)), 106, 12)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (57, CAST(0.25 AS Decimal(12, 2)), 107, 12)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (58, CAST(0.25 AS Decimal(12, 2)), 108, 12)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (59, CAST(0.25 AS Decimal(12, 2)), 109, 12)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (60, CAST(0.25 AS Decimal(12, 2)), 110, 12)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (61, CAST(0.25 AS Decimal(12, 2)), 111, 13)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (62, CAST(0.25 AS Decimal(12, 2)), 112, 13)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (63, CAST(0.25 AS Decimal(12, 2)), 113, 13)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (64, CAST(0.25 AS Decimal(12, 2)), 114, 13)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (65, CAST(0.25 AS Decimal(12, 2)), 115, 13)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (66, CAST(0.25 AS Decimal(12, 2)), 116, 14)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (67, CAST(0.25 AS Decimal(12, 2)), 117, 14)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (68, CAST(0.25 AS Decimal(12, 2)), 118, 14)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (69, CAST(0.25 AS Decimal(12, 2)), 119, 14)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (70, CAST(0.25 AS Decimal(12, 2)), 120, 14)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (71, CAST(0.25 AS Decimal(12, 2)), 121, 15)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (72, CAST(0.25 AS Decimal(12, 2)), 122, 15)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (73, CAST(0.25 AS Decimal(12, 2)), 123, 15)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (74, CAST(0.25 AS Decimal(12, 2)), 124, 15)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (75, CAST(0.25 AS Decimal(12, 2)), 125, 15)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (76, CAST(0.25 AS Decimal(12, 2)), 126, 16)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (77, CAST(0.25 AS Decimal(12, 2)), 127, 16)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (78, CAST(0.25 AS Decimal(12, 2)), 128, 16)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (79, CAST(0.25 AS Decimal(12, 2)), 129, 16)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (80, CAST(0.25 AS Decimal(12, 2)), 130, 16)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (81, CAST(0.25 AS Decimal(12, 2)), 131, 17)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (82, CAST(0.25 AS Decimal(12, 2)), 132, 17)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (83, CAST(0.25 AS Decimal(12, 2)), 133, 17)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (84, CAST(0.25 AS Decimal(12, 2)), 134, 17)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (85, CAST(0.25 AS Decimal(12, 2)), 135, 17)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (86, CAST(0.25 AS Decimal(12, 2)), 136, 18)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (87, CAST(0.25 AS Decimal(12, 2)), 137, 18)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (88, CAST(0.25 AS Decimal(12, 2)), 138, 18)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (89, CAST(0.25 AS Decimal(12, 2)), 139, 18)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (90, CAST(0.25 AS Decimal(12, 2)), 140, 18)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (91, CAST(0.25 AS Decimal(12, 2)), 141, 19)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (92, CAST(0.25 AS Decimal(12, 2)), 142, 19)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (93, CAST(0.25 AS Decimal(12, 2)), 143, 19)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (94, CAST(0.25 AS Decimal(12, 2)), 144, 19)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (95, CAST(0.25 AS Decimal(12, 2)), 145, 19)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (96, CAST(0.25 AS Decimal(12, 2)), 146, 20)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (97, CAST(0.25 AS Decimal(12, 2)), 147, 20)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (98, CAST(0.25 AS Decimal(12, 2)), 148, 20)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (99, CAST(0.25 AS Decimal(12, 2)), 149, 20)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (100, CAST(0.25 AS Decimal(12, 2)), 150, 20)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (101, CAST(0.25 AS Decimal(12, 2)), 151, 21)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (102, CAST(0.25 AS Decimal(12, 2)), 152, 21)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (103, CAST(0.25 AS Decimal(12, 2)), 153, 21)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (104, CAST(0.25 AS Decimal(12, 2)), 154, 21)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (105, CAST(0.25 AS Decimal(12, 2)), 155, 21)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (106, CAST(0.25 AS Decimal(12, 2)), 156, 22)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (107, CAST(0.25 AS Decimal(12, 2)), 157, 22)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (108, CAST(0.25 AS Decimal(12, 2)), 158, 22)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (109, CAST(0.25 AS Decimal(12, 2)), 159, 22)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (110, CAST(0.25 AS Decimal(12, 2)), 160, 22)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (111, CAST(0.25 AS Decimal(12, 2)), 161, 23)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (112, CAST(0.25 AS Decimal(12, 2)), 162, 23)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (113, CAST(0.25 AS Decimal(12, 2)), 163, 23)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (114, CAST(0.25 AS Decimal(12, 2)), 164, 23)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (115, CAST(0.25 AS Decimal(12, 2)), 165, 23)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (116, CAST(0.25 AS Decimal(12, 2)), 166, 24)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (117, CAST(0.25 AS Decimal(12, 2)), 167, 24)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (118, CAST(0.25 AS Decimal(12, 2)), 168, 24)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (119, CAST(0.25 AS Decimal(12, 2)), 169, 24)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (120, CAST(0.25 AS Decimal(12, 2)), 170, 24)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (121, CAST(0.25 AS Decimal(12, 2)), 171, 25)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (122, CAST(0.25 AS Decimal(12, 2)), 172, 25)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (123, CAST(0.25 AS Decimal(12, 2)), 173, 25)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (124, CAST(0.25 AS Decimal(12, 2)), 174, 25)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (125, CAST(0.25 AS Decimal(12, 2)), 175, 25)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (126, CAST(0.25 AS Decimal(12, 2)), 176, 26)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (127, CAST(0.25 AS Decimal(12, 2)), 177, 26)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (128, CAST(0.25 AS Decimal(12, 2)), 178, 26)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (129, CAST(0.25 AS Decimal(12, 2)), 179, 26)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (130, CAST(0.25 AS Decimal(12, 2)), 180, 26)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (131, CAST(0.25 AS Decimal(12, 2)), 181, 27)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (132, CAST(0.25 AS Decimal(12, 2)), 182, 27)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (133, CAST(0.25 AS Decimal(12, 2)), 183, 27)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (134, CAST(0.25 AS Decimal(12, 2)), 184, 27)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (135, CAST(0.25 AS Decimal(12, 2)), 185, 27)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (136, CAST(0.25 AS Decimal(12, 2)), 186, 28)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (137, CAST(0.25 AS Decimal(12, 2)), 187, 28)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (138, CAST(0.25 AS Decimal(12, 2)), 188, 28)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (139, CAST(0.25 AS Decimal(12, 2)), 189, 28)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (140, CAST(0.25 AS Decimal(12, 2)), 190, 28)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (141, CAST(0.25 AS Decimal(12, 2)), 191, 29)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (142, CAST(0.25 AS Decimal(12, 2)), 192, 29)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (143, CAST(0.25 AS Decimal(12, 2)), 193, 29)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (144, CAST(0.25 AS Decimal(12, 2)), 194, 29)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (145, CAST(0.25 AS Decimal(12, 2)), 195, 29)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (146, CAST(0.25 AS Decimal(12, 2)), 196, 30)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (147, CAST(0.25 AS Decimal(12, 2)), 197, 30)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (148, CAST(0.25 AS Decimal(12, 2)), 198, 30)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (149, CAST(0.25 AS Decimal(12, 2)), 199, 30)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (150, CAST(0.25 AS Decimal(12, 2)), 200, 30)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (151, CAST(0.25 AS Decimal(12, 2)), 201, 31)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (152, CAST(0.25 AS Decimal(12, 2)), 202, 31)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (153, CAST(0.25 AS Decimal(12, 2)), 203, 31)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (154, CAST(0.25 AS Decimal(12, 2)), 204, 31)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (155, CAST(0.25 AS Decimal(12, 2)), 205, 31)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (156, CAST(0.25 AS Decimal(12, 2)), 206, 32)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (157, CAST(0.25 AS Decimal(12, 2)), 207, 32)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (158, CAST(0.25 AS Decimal(12, 2)), 208, 32)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (159, CAST(0.25 AS Decimal(12, 2)), 209, 32)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (160, CAST(0.25 AS Decimal(12, 2)), 210, 32)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (161, CAST(0.25 AS Decimal(12, 2)), 211, 33)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (162, CAST(0.25 AS Decimal(12, 2)), 212, 33)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (163, CAST(0.25 AS Decimal(12, 2)), 213, 33)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (164, CAST(0.25 AS Decimal(12, 2)), 214, 33)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (165, CAST(0.25 AS Decimal(12, 2)), 215, 33)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (166, CAST(0.25 AS Decimal(12, 2)), 216, 34)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (167, CAST(0.25 AS Decimal(12, 2)), 217, 34)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (168, CAST(0.25 AS Decimal(12, 2)), 218, 34)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (169, CAST(0.25 AS Decimal(12, 2)), 219, 34)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (170, CAST(0.25 AS Decimal(12, 2)), 220, 34)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (171, CAST(0.25 AS Decimal(12, 2)), 221, 35)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (172, CAST(0.25 AS Decimal(12, 2)), 222, 35)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (173, CAST(0.25 AS Decimal(12, 2)), 223, 35)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (174, CAST(0.25 AS Decimal(12, 2)), 224, 35)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (175, CAST(0.25 AS Decimal(12, 2)), 225, 35)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (176, CAST(0.25 AS Decimal(12, 2)), 226, 36)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (177, CAST(0.25 AS Decimal(12, 2)), 227, 36)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (178, CAST(0.25 AS Decimal(12, 2)), 228, 36)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (179, CAST(0.25 AS Decimal(12, 2)), 229, 36)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (180, CAST(0.25 AS Decimal(12, 2)), 230, 36)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (181, CAST(0.25 AS Decimal(12, 2)), 231, 37)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (182, CAST(0.25 AS Decimal(12, 2)), 232, 37)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (183, CAST(0.25 AS Decimal(12, 2)), 233, 37)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (184, CAST(0.25 AS Decimal(12, 2)), 234, 37)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (185, CAST(0.25 AS Decimal(12, 2)), 235, 37)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (186, CAST(0.25 AS Decimal(12, 2)), 236, 38)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (187, CAST(0.25 AS Decimal(12, 2)), 237, 38)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (188, CAST(0.25 AS Decimal(12, 2)), 238, 38)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (189, CAST(0.25 AS Decimal(12, 2)), 239, 38)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (190, CAST(0.25 AS Decimal(12, 2)), 240, 38)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (191, CAST(0.25 AS Decimal(12, 2)), 241, 39)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (192, CAST(0.25 AS Decimal(12, 2)), 242, 39)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (193, CAST(0.25 AS Decimal(12, 2)), 243, 39)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (194, CAST(0.25 AS Decimal(12, 2)), 244, 39)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (195, CAST(0.25 AS Decimal(12, 2)), 245, 39)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (196, CAST(0.25 AS Decimal(12, 2)), 246, 40)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (197, CAST(0.25 AS Decimal(12, 2)), 247, 40)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (198, CAST(0.25 AS Decimal(12, 2)), 248, 40)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (199, CAST(0.25 AS Decimal(12, 2)), 249, 40)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (200, CAST(0.25 AS Decimal(12, 2)), 250, 40)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (201, CAST(0.25 AS Decimal(12, 2)), 251, 41)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (202, CAST(0.25 AS Decimal(12, 2)), 252, 41)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (203, CAST(0.25 AS Decimal(12, 2)), 253, 41)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (204, CAST(0.25 AS Decimal(12, 2)), 254, 41)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (205, CAST(0.25 AS Decimal(12, 2)), 255, 41)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (206, CAST(0.25 AS Decimal(12, 2)), 256, 42)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (207, CAST(0.25 AS Decimal(12, 2)), 257, 42)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (208, CAST(0.25 AS Decimal(12, 2)), 258, 42)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (209, CAST(0.25 AS Decimal(12, 2)), 259, 42)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (210, CAST(0.25 AS Decimal(12, 2)), 260, 42)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (211, CAST(0.25 AS Decimal(12, 2)), 261, 43)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (212, CAST(0.25 AS Decimal(12, 2)), 262, 43)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (213, CAST(0.25 AS Decimal(12, 2)), 263, 43)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (214, CAST(0.25 AS Decimal(12, 2)), 264, 43)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (215, CAST(0.25 AS Decimal(12, 2)), 265, 43)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (216, CAST(0.25 AS Decimal(12, 2)), 266, 44)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (217, CAST(0.25 AS Decimal(12, 2)), 267, 44)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (218, CAST(0.25 AS Decimal(12, 2)), 268, 44)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (219, CAST(0.25 AS Decimal(12, 2)), 269, 44)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (220, CAST(0.25 AS Decimal(12, 2)), 270, 44)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (221, CAST(0.25 AS Decimal(12, 2)), 271, 45)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (222, CAST(0.25 AS Decimal(12, 2)), 272, 45)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (223, CAST(0.25 AS Decimal(12, 2)), 273, 45)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (224, CAST(0.25 AS Decimal(12, 2)), 274, 45)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (225, CAST(0.25 AS Decimal(12, 2)), 275, 45)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (226, CAST(0.25 AS Decimal(12, 2)), 276, 46)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (227, CAST(0.25 AS Decimal(12, 2)), 277, 46)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (228, CAST(0.25 AS Decimal(12, 2)), 278, 46)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (229, CAST(0.25 AS Decimal(12, 2)), 279, 46)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (230, CAST(0.25 AS Decimal(12, 2)), 280, 46)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (231, CAST(0.25 AS Decimal(12, 2)), 281, 47)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (232, CAST(0.25 AS Decimal(12, 2)), 282, 47)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (233, CAST(0.25 AS Decimal(12, 2)), 283, 47)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (234, CAST(0.25 AS Decimal(12, 2)), 284, 47)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (235, CAST(0.25 AS Decimal(12, 2)), 285, 47)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (236, CAST(0.25 AS Decimal(12, 2)), 286, 48)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (237, CAST(0.25 AS Decimal(12, 2)), 287, 48)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (238, CAST(0.25 AS Decimal(12, 2)), 288, 48)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (239, CAST(0.25 AS Decimal(12, 2)), 289, 48)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (240, CAST(0.25 AS Decimal(12, 2)), 290, 48)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (241, CAST(0.25 AS Decimal(12, 2)), 291, 49)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (242, CAST(0.25 AS Decimal(12, 2)), 292, 49)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (243, CAST(0.25 AS Decimal(12, 2)), 293, 49)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (244, CAST(0.25 AS Decimal(12, 2)), 294, 49)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (245, CAST(0.25 AS Decimal(12, 2)), 295, 49)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (246, CAST(0.25 AS Decimal(12, 2)), 296, 50)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (247, CAST(0.25 AS Decimal(12, 2)), 297, 50)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (248, CAST(0.25 AS Decimal(12, 2)), 298, 50)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (249, CAST(0.25 AS Decimal(12, 2)), 299, 50)
GO
INSERT [dbo].[ArticuloFormulaProduccion] ([Id], [Cantidad], [IdArticulo], [IdFormulaProduccion]) VALUES (250, CAST(0.25 AS Decimal(12, 2)), 300, 50)
GO
SET IDENTITY_INSERT [dbo].[ArticuloFormulaProduccion] OFF
GO
INSERT [dbo].[Parametro] ([Id], [Descripcion]) VALUES (1, N'ESTADO ORDEN DE TRABAJO')
GO
INSERT [dbo].[Parametro] ([Id], [Descripcion]) VALUES (2, N'ALMACEN MATERIALES')
GO
INSERT [dbo].[Parametro] ([Id], [Descripcion]) VALUES (3, N'ALMACEN PRODUCTO TERMINADO')
GO
INSERT [dbo].[Parametro] ([Id], [Descripcion]) VALUES (4, N'FORMULA DE PRODUCCION')
GO
SET IDENTITY_INSERT [dbo].[ParametroDetalle] ON 

GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (1, N'PENDIENTE', 1)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (2, N'APROBADO', 1)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (3, N'EN PROCESO DE PRODUCCION', 1)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (4, N'CERRADO', 1)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (5, N'ALMACEN DE MATERIALES', 2)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (6, N'ALMACEN DE PRODUCTO TERMINADO', 3)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (7, N'SOFA 3CPO ANGIE               ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (8, N'SOFA 2CPO ANGIE               ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (9, N'SOFA 1CPO ANGIE               ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (10, N'SILLON RECLINABLE SANTOS      ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (11, N'SILLON RECLINABLE NORMAL(Y)   ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (12, N'SOFA 3CPO ESPAÑOL (Y)         ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (13, N'SOFA 2CPO ESPAÑOL (Y)         ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (14, N'SOFA 1CPO ESPAÑOL (Y)         ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (15, N'SOFA 3CPO ATENAS AMERICANO    ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (16, N'SOFA 2CPO ATENAS AMERICANO    ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (17, N'SOFA 1CPO ATENAS AMERICANO    ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (18, N'SOFA 3CPO MONICA (Y)          ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (19, N'SOFA 2CPO MONICA (Y)          ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (20, N'SOFA 1CPO MONICA (Y)          ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (21, N'SOFA 3CPO ISABEL              ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (22, N'SOFA 2CPO ISABEL              ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (23, N'SOFA 1CPO ISABEL              ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (24, N'SOFA 3CPO LUCY                ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (25, N'SOFA 2CPO LUCY                ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (26, N'SOFA 1CPO LUCY                ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (27, N'SOFA 3CPO SALOME              ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (28, N'SOFA 2CPO SALOME              ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (29, N'SOFA 1CPO SALOME              ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (30, N'SOFA 3CPO RISOLI(Y)           ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (31, N'SOFA 2CPO RISOLI(Y)           ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (32, N'SOFA 1CPO RISOLI(Y)           ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (33, N'SOFA 3CPO SHEIKA              ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (34, N'SOFA 2CPO SHEIKA              ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (35, N'SOFA 1CPO SHEIKA              ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (36, N'SOFA 3CPO FILADELFIA          ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (37, N'SOFA 2CPO FILADELFIA          ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (38, N'SOFA 1CPO FILADELFIA          ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (39, N'SOFA 3CPO KASSANDRA           ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (40, N'SOFA 2CPO KASSANDRA           ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (41, N'SOFA 1CPO KASSANDRA           ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (42, N'CAS SOFA 3CPO ELEGANTA        ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (43, N'CAS SOFA 2CPO ELEGANTA        ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (44, N'CAS SOFA 1CPO ELEGANTA        ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (45, N'CAS SECC 3CPO ELEGANTA        ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (46, N'CAS SECC 2CPO ELEGANTA        ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (47, N'CAS ESQUINERO ELEGANTA        ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (48, N'CAS SOFA 3CPO MONICA (Y)      ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (49, N'CAS SOFA 2CPO MONICA (Y)      ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (50, N'CAS SOFA 1CPO MONICA (Y)      ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (51, N'CAS SECC 3CPO MONICA          ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (52, N'CAS SECC 2CPO MONICA          ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (53, N'CAS ESQUINERO MONICA          ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (54, N'CAS SOFA 3CPO RISOLI          ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (55, N'CAS SOFA 2CPO RISOLI          ', 4)
GO
INSERT [dbo].[ParametroDetalle] ([Id], [Descripcion], [IdPadre]) VALUES (56, N'CAS SOFA 1CPO RISOLI          ', 4)
GO
SET IDENTITY_INSERT [dbo].[ParametroDetalle] OFF
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [R_16] FOREIGN KEY([IdFormulaProduccion])
REFERENCES [dbo].[ParametroDetalle] ([Id])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [R_16]
GO
ALTER TABLE [dbo].[ArticuloFormulaProduccion]  WITH CHECK ADD  CONSTRAINT [R_17] FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[Articulo] ([Id])
GO
ALTER TABLE [dbo].[ArticuloFormulaProduccion] CHECK CONSTRAINT [R_17]
GO
ALTER TABLE [dbo].[ArticuloFormulaProduccion]  WITH CHECK ADD  CONSTRAINT [R_18] FOREIGN KEY([IdFormulaProduccion])
REFERENCES [dbo].[ParametroDetalle] ([Id])
GO
ALTER TABLE [dbo].[ArticuloFormulaProduccion] CHECK CONSTRAINT [R_18]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [R_10] FOREIGN KEY([IdAlmacen])
REFERENCES [dbo].[ParametroDetalle] ([Id])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [R_10]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [R_13] FOREIGN KEY([IdOrdenTrabajo])
REFERENCES [dbo].[OrdenTrabajo] ([Id])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [R_13]
GO
ALTER TABLE [dbo].[MovimientoDetalle]  WITH CHECK ADD  CONSTRAINT [R_11] FOREIGN KEY([IdMovimiento])
REFERENCES [dbo].[Movimiento] ([Id])
GO
ALTER TABLE [dbo].[MovimientoDetalle] CHECK CONSTRAINT [R_11]
GO
ALTER TABLE [dbo].[MovimientoDetalle]  WITH CHECK ADD  CONSTRAINT [R_12] FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[Articulo] ([Id])
GO
ALTER TABLE [dbo].[MovimientoDetalle] CHECK CONSTRAINT [R_12]
GO
ALTER TABLE [dbo].[OrdenTrabajo]  WITH CHECK ADD  CONSTRAINT [R_8] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[ParametroDetalle] ([Id])
GO
ALTER TABLE [dbo].[OrdenTrabajo] CHECK CONSTRAINT [R_8]
GO
ALTER TABLE [dbo].[OrdenTrabajoDetalle]  WITH CHECK ADD  CONSTRAINT [R_3] FOREIGN KEY([IdOrdenTrabajo])
REFERENCES [dbo].[OrdenTrabajo] ([Id])
GO
ALTER TABLE [dbo].[OrdenTrabajoDetalle] CHECK CONSTRAINT [R_3]
GO
ALTER TABLE [dbo].[OrdenTrabajoDetalle]  WITH CHECK ADD  CONSTRAINT [R_6] FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[Articulo] ([Id])
GO
ALTER TABLE [dbo].[OrdenTrabajoDetalle] CHECK CONSTRAINT [R_6]
GO
ALTER TABLE [dbo].[ParametroDetalle]  WITH CHECK ADD  CONSTRAINT [R_7] FOREIGN KEY([IdPadre])
REFERENCES [dbo].[Parametro] ([Id])
GO
ALTER TABLE [dbo].[ParametroDetalle] CHECK CONSTRAINT [R_7]
GO
