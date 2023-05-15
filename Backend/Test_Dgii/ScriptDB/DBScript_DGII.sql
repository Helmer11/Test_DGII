USE [PruebaDGII]
GO
/****** Object:  Table [dbo].[Comprobantes_Fiscales]    Script Date: 5/15/2023 1:32:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comprobantes_Fiscales](
	[Comprobante_id] [int] IDENTITY(1,1) NOT NULL,
	[Contribuyente_ID] [int] NOT NULL,
	[NCF] [varchar](15) NOT NULL,
	[Monto] [decimal](18, 2) NOT NULL,
	[Itbis18] [decimal](18, 2) NOT NULL,
	[Estatus] [varchar](10) NOT NULL,
	[Registro_Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK__Comproba__F5A65756467B80B1] PRIMARY KEY CLUSTERED 
(
	[Comprobante_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contribuyentes]    Script Date: 5/15/2023 1:32:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contribuyentes](
	[Contribuyente_id] [int] IDENTITY(1,1) NOT NULL,
	[RncCedula] [varchar](15) NOT NULL,
	[Contribuyente_Nombre] [varchar](50) NOT NULL,
	[Tipo_Persona_ID] [tinyint] NOT NULL,
	[Estatus] [varchar](10) NOT NULL,
	[Registro_Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK__Contribu__DD20B088E3FEEF99] PRIMARY KEY CLUSTERED 
(
	[Contribuyente_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Informacion_Error_log]    Script Date: 5/15/2023 1:32:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Informacion_Error_log](
	[Log_id] [int] IDENTITY(1,1) NOT NULL,
	[Informacion] [varchar](max) NOT NULL,
	[Registro_Fecha] [datetime] NOT NULL,
	[Registro_Hora] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_Personas]    Script Date: 5/15/2023 1:32:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_Personas](
	[Tipo_persona_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Persona_Nombre] [varchar](50) NOT NULL,
	[Estatus] [char](1) NOT NULL,
	[Registro_Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK__Tipos_Pe__86B88E94CD61B401] PRIMARY KEY CLUSTERED 
(
	[Tipo_persona_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comprobantes_Fiscales] ADD  CONSTRAINT [DF__Comproban__Estat__52593CB8]  DEFAULT ('Activo') FOR [Estatus]
GO
ALTER TABLE [dbo].[Comprobantes_Fiscales] ADD  CONSTRAINT [DF__Comproban__Regis__534D60F1]  DEFAULT (getdate()) FOR [Registro_Fecha]
GO
ALTER TABLE [dbo].[Contribuyentes] ADD  CONSTRAINT [DF__Contribuy__Estat__4D94879B]  DEFAULT ('Activo') FOR [Estatus]
GO
ALTER TABLE [dbo].[Contribuyentes] ADD  CONSTRAINT [DF__Contribuy__Regis__4E88ABD4]  DEFAULT (getdate()) FOR [Registro_Fecha]
GO
ALTER TABLE [dbo].[Informacion_Error_log] ADD  DEFAULT (getdate()) FOR [Registro_Fecha]
GO
ALTER TABLE [dbo].[Informacion_Error_log] ADD  DEFAULT (getdate()) FOR [Registro_Hora]
GO
ALTER TABLE [dbo].[Tipos_Personas] ADD  CONSTRAINT [DF__Tipos_Per__Estat__49C3F6B7]  DEFAULT ('A') FOR [Estatus]
GO
ALTER TABLE [dbo].[Tipos_Personas] ADD  CONSTRAINT [DF__Tipos_Per__Regis__4AB81AF0]  DEFAULT (getdate()) FOR [Registro_Fecha]
GO
ALTER TABLE [dbo].[Comprobantes_Fiscales]  WITH CHECK ADD  CONSTRAINT [FK__Comproban__Contr__5441852A] FOREIGN KEY([Contribuyente_ID])
REFERENCES [dbo].[Contribuyentes] ([Contribuyente_id])
GO
ALTER TABLE [dbo].[Comprobantes_Fiscales] CHECK CONSTRAINT [FK__Comproban__Contr__5441852A]
GO
ALTER TABLE [dbo].[Contribuyentes]  WITH CHECK ADD  CONSTRAINT [FK__Contribuy__Tipo___4F7CD00D] FOREIGN KEY([Tipo_Persona_ID])
REFERENCES [dbo].[Tipos_Personas] ([Tipo_persona_id])
GO
ALTER TABLE [dbo].[Contribuyentes] CHECK CONSTRAINT [FK__Contribuy__Tipo___4F7CD00D]
GO
/****** Object:  StoredProcedure [dbo].[Error_Informacion_log]    Script Date: 5/15/2023 1:32:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Helmer Salas >
-- Create date: <Create 14/05/2023>
-- Description:	<Description: Procedimiento que se encarga de recopilar informacion de los errores ocasionador en la aplicacion>
-- =============================================
CREATE PROCEDURE [dbo].[Error_Informacion_log]
(
@MensajeError varchar(max)
)
AS
BEGIN
	
	INSERT INTO Informacion_Error_log
	(
	Informacion,
	Registro_Fecha,
	Registro_Hora
	)
	VALUES
	(
	@MensajeError,
	GETDATE(),
	GETDATE()
	)


END
GO
/****** Object:  StoredProcedure [dbo].[Lista_Comprobantes_Fiscales]    Script Date: 5/15/2023 1:32:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Helmer Salas>
-- Create date: <Create 12/05/2023,>
-- Description:	<Description,Cargar lista de comprobantes Fiscales,>
-- =============================================

--Lista_Comprobantes_Fiscales '456-4781234-9'

--Lista_Comprobantes_Fiscales '226-3219876-1'
CREATE PROCEDURE [dbo].[Lista_Comprobantes_Fiscales]
(
@RncCedula VARCHAR(15) 
)
AS
BEGIN
	
	SELECT 
	c.RncCedula,
	c.Contribuyente_Nombre,
	cf.NCF,
	cf.Monto,
	cf.Itbis18,
	Sum(DISTINCT Itbis18 + Itbis18 ) as Total_Itbis
		  FROM Contribuyentes c WITH(NOLOCK)
			INNER JOIN Comprobantes_Fiscales cf WITH(NOLOCK)
		ON c.Contribuyente_id = cf.Contribuyente_ID

		WHERE c.RncCedula = @RncCedula
		And cf.Estatus = 'Activo'
		And c.Estatus = 'Activo'
		GROUP by c.Contribuyente_Nombre,
				c.RncCedula,
				c.Contribuyente_Nombre,
				cf.NCF,
				cf.Monto,
				cf.Itbis18
		ORDER By c.RncCedula DESC
		

END
GO
/****** Object:  StoredProcedure [dbo].[Lista_Contribuyentes]    Script Date: 5/15/2023 1:32:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Helmer Salas >
-- Create date: <Create 12/05/2023,>
-- Description:	<Description,Carga el listado de los contribuyentes>
-- =============================================

-- Lista_Contribuyentes 
CREATE PROCEDURE [dbo].[Lista_Contribuyentes] 

AS
BEGIN

	SELECT
		c.Contribuyente_id,
		c.RncCedula,
		c.Contribuyente_Nombre,
		tp.Persona_Nombre as Tipo,
		c.Estatus
		FROM Contribuyentes c WITH(NOLOCK)
		INNER JOIN Tipos_Personas tp 
		On c.Tipo_Persona_ID = tp.Tipo_persona_id
	
		Where c.Estatus = 'Activo'


END
GO
