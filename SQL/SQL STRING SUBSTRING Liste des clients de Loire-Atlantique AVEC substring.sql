SELECT * 
	FROM dbo.CLIENTS AS cli 
	WHERE SUBSTRING(cli.code_postal,1,2)=44;