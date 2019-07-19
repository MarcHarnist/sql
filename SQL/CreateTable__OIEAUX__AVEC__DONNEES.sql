USE [Marc]
GO

/****** Object:  Table [dbo].[oiseaux]    Script Date: 14/06/2019 13:21:49 ******/
DROP TABLE [dbo].[oiseaux]
GO

/****** Object:  Table [dbo].[oiseaux]    Script Date: 14/06/2019 13:21:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[oiseaux](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
	[taille] [int] NOT NULL,
	[couleur] [varchar](100) NULL,
	[LieuDhabitat] [varchar](255) NULL,
 CONSTRAINT [PK_nom] PRIMARY KEY CLUSTERED 
(
	[nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

INSERT INTO Marc.dbo.oiseaux (nom, taille, couleur, LieuDhabitat) VALUES ('mésange', 10, 'bleue', 'plaine');
INSERT INTO Marc.dbo.oiseaux (nom, taille, couleur, LieuDhabitat) VALUES ('gypaète barbu', 100, 'orange et noir', 'France');
INSERT INTO Marc.dbo.oiseaux (nom, taille, couleur, LieuDhabitat) VALUES ('pie', 30, 'noire et blanche', 'France');
INSERT INTO Marc.dbo.oiseaux (nom, taille, couleur, LieuDhabitat) VALUES ('corbeau', 50, 'noir', 'Europe');


