USE [PreguntadORT]
GO
/****** Object:  User [alumno]    Script Date: 16/8/2023 14:30:11 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 16/8/2023 14:30:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Foto] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 16/8/2023 14:30:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 16/8/2023 14:30:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdDificultad] [int] NOT NULL,
	[Enunciado] [nvarchar](max) NOT NULL,
	[Foto] [nvarchar](max) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 16/8/2023 14:30:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [nvarchar](max) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [nvarchar](max) NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'Ciencia', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Deportes', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Entretenimiento', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Historia', NULL)
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (2, N'Intermedia')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (3, N'Dificil')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (1, 2, 2, N'¿En que año se invento el basquet?
', N'https://www.lavoz.com.ar/resizer/zANPb_Ly-nL_dl4Iksv2VT_CQaw=/980x640/smart/filters:quality(75):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/grupoclarin/CCXE7COSDRCAHEXADF4ESEVG6U.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (2, 2, 3, N'¿Cuantos años tuvo el medallista olimpo mas grande al ganar un medalla?
', N'https://www.ole.com.ar/images/2021/08/02/nMF5Uc-xy_860x575__1.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (3, 2, 2, N'¿Cual se las siguientes selecciones gano 31-0 contra Samoa Americana en su partido de 2001?', N'https://images.ecestaticos.com/YXyw5-JQV-hXXJabtsSCyDTfyRw=/27x0:930x637/557x418/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2Fc8c%2F084%2F373%2Fc8c0843733764ef6bc7e5e38fad1242e.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (5, 2, 1, N'¿Cual de estos no es un tipo de surf?', N'https://res.cloudinary.com/manawa/image/upload/f_auto,c_limit,w_1920,q_auto/articles/3104/surfing-wipeout')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (7, 2, 1, N'¿Cual de estas es una regla de Handball?
', N'https://www.clarin.com/img/2019/12/04/xrLeAeXU_1256x620__1.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (8, 3, 2, N'¿Quien interpreta Al Pacino en "El Padrino"
?', N'https://album.mediaset.es/eimg/10000/2022/02/28/clipping_vr5Cfo_e879.jpg?w=1200')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (9, 3, 1, N'¿En cual de los siguientes videojuegos jugamos como un oso?
', N'https://cdn0.bioenciclopedia.com/es/posts/1/1/0/osos_11_orig.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (10, 3, 1, N'¿Cual de estas series tiene mas temporadas?', N'https://s1.eestatic.com/2019/09/13/ciencia/salud/enfermedades_mentales-series-netflix_428967390_134387732_1706x960.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (11, 3, 3, N'¿Cual de las siguientes peliculas tiene mas premios Oscar?', N'https://hips.hearstapps.com/hmg-prod/images/overview-of-the-oscar-statue-at-meet-the-oscars-at-the-time-news-photo-1588178852.jpg?crop=0.99092xw:1xh;center,top&resize=1200:*')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (12, 3, 2, N'¿Como se llama este pokemon?', N'data:image/jpeg;base64,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')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (13, 2, 3, N'¿En honor a quien se celebra el día del remero?', N'https://www.argentina.gob.ar/sites/default/files/remero-fuerza-aerea-argentina-03.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (14, 3, 3, N'¿Cual de los siguientes albumes no es de gorilazz', N'https://es.rollingstone.com/wp-content/uploads/2021/11/gorillaz.jpg')
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (1, 1, 1, N'1864', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (2, 1, 2, N'1912', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (3, 1, 3, N'1900', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 1, 4, N'1888', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (6, 2, 1, N'67', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (7, 2, 2, N'76', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (8, 2, 3, N'72', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (9, 2, 4, N'81', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (10, 3, 1, N'Australia', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (11, 3, 2, N'Alemania', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (12, 3, 3, N'Austria', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (13, 3, 4, N'Argentina', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (14, 5, 1, N'Dropknee', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (15, 5, 2, N'Boat surf', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (16, 5, 3, N'Funboard', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (17, 5, 4, N'Prone', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (18, 7, 1, N'Los equipos deben consistir de 9 jugadores
', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (19, 7, 2, N'Ninguna es correcta
', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (20, 7, 3, N'Se pueden dar 4 pasos con la pelota en la mano
', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (21, 7, 4, N'No podemos estar quietos por mas de 3 segundos', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (22, 8, 1, N'Michael Corleone', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (23, 8, 2, N'Sonny', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (24, 8, 3, N'Hank Schrader', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (25, 8, 4, N'Vito Corleone', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (26, 9, 1, N'Five Nights at Freddy''s', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (27, 9, 2, N'Adventure Island', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (28, 9, 3, N'Banjo-Kazooie', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (31, 9, 4, N'Crash Bandicoot
', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (32, 10, 1, N'Suits', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (33, 10, 2, N'Friends', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (34, 10, 3, N'Better Call Saul
', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (35, 10, 4, N'The Office', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (36, 11, 1, N'La lista de Schindler', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (37, 11, 2, N'Amadeus', 1, NULL)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
